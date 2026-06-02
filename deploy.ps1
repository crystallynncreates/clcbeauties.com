# CLC Beauties — deploy to Cloudflare Pages
# Usage: .\deploy.ps1
# Run from repo root after making changes to index.html / logo.png / _redirects

$token     = $env:CLOUDFLARE_API_TOKEN
$accountId = "b0c5322365b665c885bf3afd3d0a25cd"
$project   = "clcbeauties"
$dir       = Join-Path $PSScriptRoot "CLCBeauties-Final"

if (-not $token) {
    Write-Error "Set CLOUDFLARE_API_TOKEN environment variable before running."
    exit 1
}

# Sync root site files into CLCBeauties-Final first
Copy-Item "$PSScriptRoot\index.html"   "$dir\index.html"   -Force
Copy-Item "$PSScriptRoot\_redirects"   "$dir\_redirects"   -Force
Copy-Item "$PSScriptRoot\logo.png"     "$dir\logo.png"     -Force

Add-Type -AssemblyName System.Net.Http

$md5      = [System.Security.Cryptography.MD5]::Create()
$manifest = @{}
$fileData = @{}

foreach ($file in Get-ChildItem $dir -Recurse -File) {
    $relPath = "/" + ($file.FullName.Substring($dir.Length + 1).Replace("\", "/"))
    $bytes   = [System.IO.File]::ReadAllBytes($file.FullName)
    $hash    = ([System.BitConverter]::ToString($md5.ComputeHash($bytes))).Replace("-","").ToLower()
    $manifest[$relPath] = $hash
    $fileData[$hash]    = $bytes
}

$multipart = New-Object System.Net.Http.MultipartFormDataContent
$mfContent = New-Object System.Net.Http.StringContent(($manifest | ConvertTo-Json -Compress), [System.Text.Encoding]::UTF8, "application/json")
$multipart.Add($mfContent, "manifest")
foreach ($e in $fileData.GetEnumerator()) {
    $multipart.Add((New-Object System.Net.Http.ByteArrayContent(,$e.Value)), $e.Key)
}

$client = New-Object System.Net.Http.HttpClient
$client.DefaultRequestHeaders.Authorization = New-Object System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", $token)

$resp = $client.PostAsync("https://api.cloudflare.com/client/v4/accounts/$accountId/pages/projects/$project/deployments", $multipart).Result
$body = ($resp.Content.ReadAsStringAsync().Result | ConvertFrom-Json)

if ($body.success) {
    Write-Host "Deployed successfully!" -ForegroundColor Green
    Write-Host "URL: https://www.$project.com"
} else {
    Write-Error "Deploy failed: $($body.errors | ConvertTo-Json)"
}
