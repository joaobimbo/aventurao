param(
  [string]$Output = "Sprites/Familia/Animacao/familia_guia.png"
)

Add-Type -AssemblyName System.Drawing

$canvasWidth = 1536
$canvasHeight = 1024
$canvas = New-Object System.Drawing.Bitmap($canvasWidth, $canvasHeight, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
$graphics = [System.Drawing.Graphics]::FromImage($canvas)
$graphics.Clear([System.Drawing.Color]::FromArgb(255, 0, 255, 0))
$graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::NearestNeighbor
$graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::Half
$graphics.CompositingMode = [System.Drawing.Drawing2D.CompositingMode]::SourceOver

function Get-AlphaBounds([System.Drawing.Bitmap]$bitmap) {
  $left = $bitmap.Width
  $top = $bitmap.Height
  $right = -1
  $bottom = -1

  for ($y = 0; $y -lt $bitmap.Height; $y += 2) {
    for ($x = 0; $x -lt $bitmap.Width; $x += 2) {
      if ($bitmap.GetPixel($x, $y).A -gt 8) {
        if ($x -lt $left) { $left = $x }
        if ($x -gt $right) { $right = $x }
        if ($y -lt $top) { $top = $y }
        if ($y -gt $bottom) { $bottom = $y }
      }
    }
  }

  if ($right -lt $left -or $bottom -lt $top) {
    return [System.Drawing.Rectangle]::new(0, 0, $bitmap.Width, $bitmap.Height)
  }

  return [System.Drawing.Rectangle]::new($left, $top, ($right - $left + 1), ($bottom - $top + 1))
}

function Draw-Sprite([string]$path, [int]$centerX, [int]$bottomY, [int]$height) {
  $bitmap = [System.Drawing.Bitmap]::FromFile((Resolve-Path $path))
  try {
    $source = Get-AlphaBounds $bitmap
    $width = [int][Math]::Round($source.Width * ($height / [double]$source.Height))
    $destination = [System.Drawing.Rectangle]::new(($centerX - [int]($width / 2)), ($bottomY - $height), $width, $height)
    $graphics.DrawImage($bitmap, $destination, $source, [System.Drawing.GraphicsUnit]::Pixel)
  }
  finally {
    $bitmap.Dispose()
  }
}

$backRow = @(
  @{ File = "Sprites/Familia/avo_paterno.png"; X = 110; H = 500 },
  @{ File = "Sprites/Familia/avo_paterna.png"; X = 325; H = 485 },
  @{ File = "Sprites/Familia/mae.png"; X = 535; H = 495 },
  @{ File = "Sprites/Familia/pai_luis.png"; X = 755; H = 510 },
  @{ File = "Sprites/Familia/avo_materno.png"; X = 975; H = 490 },
  @{ File = "Sprites/Familia/avo_materna.png"; X = 1190; H = 480 },
  @{ File = "Sprites/Familia/tia_1.png"; X = 1410; H = 495 }
)

$frontAdults = @(
  @{ File = "Sprites/Familia/tio_1.png"; X = 150; H = 585 },
  @{ File = "Sprites/Familia/tia_2.png"; X = 405; H = 570 },
  @{ File = "Sprites/Familia/tio_2.png"; X = 1160; H = 595 },
  @{ File = "Sprites/Familia/tia_3.png"; X = 1410; H = 580 }
)

$frontChildren = @(
  @{ File = "Sprites/Familia/prima.png"; X = 105; H = 410 },
  @{ File = "Sprites/Familia/primo.png"; X = 345; H = 330 }
)

foreach ($sprite in $backRow) {
  Draw-Sprite $sprite.File $sprite.X 610 $sprite.H
}

foreach ($sprite in $frontAdults) {
  Draw-Sprite $sprite.File $sprite.X 975 $sprite.H
}

foreach ($sprite in $frontChildren) {
  Draw-Sprite $sprite.File $sprite.X 985 $sprite.H
}

$directory = Split-Path -Parent $Output
New-Item -ItemType Directory -Force -Path $directory | Out-Null
$canvas.Save($Output, [System.Drawing.Imaging.ImageFormat]::Png)
$graphics.Dispose()
$canvas.Dispose()

Write-Output "Wrote $Output"
