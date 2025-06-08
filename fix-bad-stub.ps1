$path = "$env:USERPROFILE\.docker\config.json"
$content = @'
{
    "auths": {
        "public.ecr.aws": {}
    },
    "credStore": ""
}
'@

$utf8NoBom = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllText($path, $content, $utf8NoBom)

Write-Output "Now restart Docker Desktop and try logging in to ECR again"