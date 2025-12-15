This folder holds the site's image assets.

What I added:
- favicon.svg (simple SVG favicon)
- logo.svg (initial placeholder SVG)
- logo.jpg (your uploaded logo)

How to generate raster exports (PNG/ICO)

Requirements:
- ImageMagick installed and available as `magick` on PATH

Run from the project root (PowerShell):

```powershell
cd "c:/Users/EPIGNOSIS/Campaign"
.\scripts\convert-assets.ps1
```

This will produce:
- assets/logo-512.png, logo-256.png, logo-128.png, logo-64.png, logo-48.png, logo-32.png, logo-16.png
- assets/og-image.png (1200x630)
- assets/favicon.ico

If you prefer using Inkscape, export PNGs using the GUI or `inkscape` CLI.
