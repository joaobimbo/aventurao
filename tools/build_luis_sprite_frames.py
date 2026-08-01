import argparse
from collections import deque
from io import BytesIO
from pathlib import Path

from PIL import Image, ImageOps


ROOT = Path(__file__).resolve().parents[1]
SOURCE_DIR = ROOT / "Sprites" / "Luis" / "Source"
WALK_DIR = ROOT / "Sprites" / "Luis" / "Walk"
TALK_DIR = ROOT / "Sprites" / "Luis" / "Talk"

SOURCE_SIZE = (1448, 1086)
FRAME_SIZE = (192, 224)
GRID = (6, 4)


def save_png(image: Image.Image, path: Path) -> None:
  output = BytesIO()
  image.save(output, format="PNG")
  path.write_bytes(output.getvalue())


def normalize_sheet(path: Path) -> None:
  with Image.open(path) as image:
    image = image.convert("RGBA")
    if image.size != SOURCE_SIZE:
      image = image.resize(SOURCE_SIZE, Image.Resampling.LANCZOS)
    image.save(path)


def extract_cell(sheet: Image.Image, column: int, row: int) -> Image.Image:
  left = round(column * sheet.width / GRID[0])
  right = round((column + 1) * sheet.width / GRID[0])
  top = round(row * sheet.height / GRID[1])
  bottom = round((row + 1) * sheet.height / GRID[1])
  cell = sheet.crop((left, top, right, bottom))

  alpha = cell.getchannel("A")
  opaque = alpha.point(lambda value: 255 if value > 24 else 0)
  pixels = opaque.load()
  visited = set()
  largest = []

  for y in range(cell.height):
    for x in range(cell.width):
      if pixels[x, y] == 0 or (x, y) in visited:
        continue

      component = []
      queue = deque(((x, y),))
      visited.add((x, y))
      while queue:
        current_x, current_y = queue.popleft()
        component.append((current_x, current_y))
        for next_x, next_y in (
            (current_x - 1, current_y),
            (current_x + 1, current_y),
            (current_x, current_y - 1),
            (current_x, current_y + 1),
        ):
          if (
              0 <= next_x < cell.width
              and 0 <= next_y < cell.height
              and pixels[next_x, next_y] != 0
              and (next_x, next_y) not in visited
          ):
            visited.add((next_x, next_y))
            queue.append((next_x, next_y))

      if len(component) > len(largest):
        largest = component

  if not largest:
    raise ValueError(f"Empty sprite cell at column {column}, row {row}")

  component_mask = Image.new("L", cell.size, 0)
  component_pixels = component_mask.load()
  for x, y in largest:
    component_pixels[x, y] = alpha.getpixel((x, y))
  cell.putalpha(component_mask)

  alpha_box = component_mask.getbbox()
  if alpha_box is None:
    raise ValueError(f"Empty sprite cell at column {column}, row {row}")

  sprite = cell.crop(alpha_box)
  max_width = FRAME_SIZE[0] - 8
  max_height = FRAME_SIZE[1] - 6
  scale = min(max_width / sprite.width, max_height / sprite.height)
  sprite = sprite.resize(
      (round(sprite.width * scale), round(sprite.height * scale)),
      Image.Resampling.LANCZOS,
  )

  frame = Image.new("RGBA", FRAME_SIZE, (0, 0, 0, 0))
  x = (FRAME_SIZE[0] - sprite.width) // 2
  y = FRAME_SIZE[1] - sprite.height - 3
  frame.alpha_composite(sprite, (x, y))
  return frame


def build_walk_frames() -> None:
  with Image.open(SOURCE_DIR / "luis_walk_transparent.png") as image:
    sheet = image.convert("RGBA")
    rows = ("down", "up", "left", "talk_front")
    for row, direction in enumerate(rows):
      for column in range(GRID[0]):
        frame = extract_cell(sheet, column, row)
        save_png(frame, WALK_DIR / f"{direction}_{column}.png")

        if direction == "left":
          save_png(ImageOps.mirror(frame), WALK_DIR / f"right_{column}.png")


def build_talk_frames() -> None:
  with Image.open(SOURCE_DIR / "luis_talk_transparent.png") as image:
    sheet = image.convert("RGBA")
    rows = ("down", "up", "left", "right")
    for row, direction in enumerate(rows):
      for column in range(GRID[0]):
        save_png(
            extract_cell(sheet, column, row),
            TALK_DIR / f"{direction}_{column}.png",
        )


def validate_outputs() -> None:
  source_names = ("luis_walk_transparent.png", "luis_talk_transparent.png")
  for name in source_names:
    with Image.open(SOURCE_DIR / name) as image:
      if image.size != SOURCE_SIZE or image.mode != "RGBA":
        raise ValueError(f"Invalid source sheet {name}: {image.size}, {image.mode}")

  frames = list(WALK_DIR.glob("*.png")) + list(TALK_DIR.glob("*.png"))
  if len(frames) != 54:
    raise ValueError(f"Expected 54 individual frames, found {len(frames)}")

  for path in frames:
    with Image.open(path) as image:
      if image.size != FRAME_SIZE or image.mode != "RGBA":
        raise ValueError(f"Invalid frame {path}: {image.size}, {image.mode}")
      alpha = image.getchannel("A")
      if alpha.getbbox() is None or alpha.getextrema()[0] != 0:
        raise ValueError(f"Invalid transparency in {path}")

  print(f"Validated 2 source sheets and {len(frames)} individual frames.")


if __name__ == "__main__":
  parser = argparse.ArgumentParser()
  parser.add_argument("mode", choices=("normalize", "frames", "validate"))
  parser.add_argument("--output-root", type=Path)
  args = parser.parse_args()

  if args.mode == "normalize":
    normalize_sheet(SOURCE_DIR / "luis_walk_chromakey.png")
    normalize_sheet(SOURCE_DIR / "luis_talk_chromakey.png")
  elif args.mode == "frames":
    if args.output_root is not None:
      WALK_DIR = args.output_root / "Walk"
      TALK_DIR = args.output_root / "Talk"
      WALK_DIR.mkdir(parents=True, exist_ok=True)
      TALK_DIR.mkdir(parents=True, exist_ok=True)
    build_walk_frames()
    build_talk_frames()
  else:
    validate_outputs()
