# Decode base64 placeholder PNGs to real .png files
# Run from project root: .\scripts\decode-placeholders.ps1
$placeholders = @(
  @{b64='assets/placeholders/logo-128.png.b64'; out='assets/logo-128.png'},
  @{b64='assets/placeholders/logo-64.png.b64'; out='assets/logo-64.png'},
  @{b64='assets/placeholders/logo-32.png.b64'; out='assets/logo-32.png'}
)

foreach($p in $placeholders){
  if(Test-Path $p.b64){
    $b64 = Get-Content -Raw -Path $p.b64
    [System.Convert]::FromBase64String($b64) | Set-Content -Path $p.out -Encoding Byte
    Write-Host "Decoded $($p.out)"
  } else {
    Write-Host "Missing $($p.b64)" -ForegroundColor Yellow
  }
}
Write-Host "Done. Placeholder PNGs written to assets/." -ForegroundColor Green