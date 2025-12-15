# Convert SVG assets to raster formats using ImageMagick (Windows PowerShell)
# Requirements: ImageMagick (magick.exe) installed and on PATH
# Usage: Open PowerShell in project root and run: .\scripts\convert-assets.ps1

$ErrorActionPreference = 'Stop'

function Check-Tool($name){
    $p = Get-Command $name -ErrorAction SilentlyContinue
    return $null -ne $p
}

if(-not (Check-Tool magick)){
    Write-Host "ImageMagick 'magick' not found on PATH." -ForegroundColor Yellow
    Write-Host "Install from https://imagemagick.org or use Inkscape and adapt the commands in this script." -ForegroundColor Yellow
    exit 1
}

$srcSvg = "assets/logo.svg"
$faviconSvg = "assets/favicon.svg"

if(-not (Test-Path $srcSvg)){
    Write-Host "Source SVG not found: $srcSvg" -ForegroundColor Red
    exit 1
}

Write-Host "Generating raster assets from $srcSvg..." -ForegroundColor Green

# Large social OG image (1200x630)
magick convert "$srcSvg" -background none -resize 1200x630 -gravity center -extent 1200x630 "assets/og-image.png"
# Primary PNGs
magick convert "$srcSvg" -background none -resize 512x512 "assets/logo-512.png"
magick convert "$srcSvg" -background none -resize 256x256 "assets/logo-256.png"
magick convert "$srcSvg" -background none -resize 128x128 "assets/logo-128.png"
magick convert "$srcSvg" -background none -resize 64x64 "assets/logo-64.png"
magick convert "$srcSvg" -background none -resize 48x48 "assets/logo-48.png"
magick convert "$srcSvg" -background none -resize 32x32 "assets/logo-32.png"
magick convert "$srcSvg" -background none -resize 16x16 "assets/logo-16.png"

# Create favicon.ico from multiple sizes
magick convert "assets/logo-48.png" "assets/logo-32.png" "assets/logo-16.png" "assets/favicon.ico"

Write-Host "Done. Generated PNGs and favicon.ico in assets/." -ForegroundColor Green
Write-Host "If you don't have ImageMagick, install it or use Inkscape to export SVGs to PNG." -ForegroundColor Yellow
