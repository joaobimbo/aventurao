param(
  [string]$InputDirectory = "Sprites/Familia/Animacao",
  [string]$Output = "Sprites/Familia/Animacao/familia_cantar_palmas_4x1.png"
)

Add-Type -AssemblyName System.Drawing

$sequence = @(0, 1, 2, 1)
$images = @()

try {
  foreach ($frame in $sequence) {
    $path = Join-Path $InputDirectory "familia_cantar_palmas_$frame.png"
    $images += [System.Drawing.Bitmap]::FromFile((Resolve-Path $path))
  }

  $frameWidth = $images[0].Width
  $frameHeight = $images[0].Height
  $sheet = New-Object System.Drawing.Bitmap(($frameWidth * $images.Count), $frameHeight, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
  $graphics = [System.Drawing.Graphics]::FromImage($sheet)
  $graphics.Clear([System.Drawing.Color]::Transparent)
  $graphics.CompositingMode = [System.Drawing.Drawing2D.CompositingMode]::SourceCopy

  for ($index = 0; $index -lt $images.Count; $index++) {
    $graphics.DrawImageUnscaled($images[$index], ($index * $frameWidth), 0)
  }

  $sheet.Save($Output, [System.Drawing.Imaging.ImageFormat]::Png)
  $graphics.Dispose()
  $sheet.Dispose()
  Write-Output "Wrote $Output ($($frameWidth * $images.Count)x$frameHeight)"
}
finally {
  foreach ($image in $images) {
    if ($null -ne $image) { $image.Dispose() }
  }
}
