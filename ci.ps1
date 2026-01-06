Write-Host "=== CI STARTED ==="

$requiredFiles = @("index.html", "about.html")

foreach ($file in $requiredFiles) {
    if (-Not (Test-Path $file)) {
        Write-Host "CI FAIL: Missing file -> $file"
        exit 1
    }
}

if (-Not (Select-String "<html>" index.html -Quiet)) {
    Write-Host "CI FAIL: Invalid HTML structure"
    exit 1
}

if (-Not (Select-String "about.html" index.html -Quiet)) {
    Write-Host "CI FAIL: Broken link"
    exit 1
}

Write-Host "=== CI PASSED ==="
exit 0
