param(
  [string]$CommitMessage = "Update web build"
)

$ErrorActionPreference = "Stop"

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$webBuild = Join-Path $repoRoot "Compiled\Web"

if (-not (Test-Path -LiteralPath (Join-Path $webBuild "index.html"))) {
  throw "Compiled/Web/index.html nao existe. Gera primeiro o target Web no AGS."
}

function Find-GhPagesWorktree {
  $candidate = $null

  foreach ($line in (& git -C $repoRoot worktree list --porcelain)) {
    if ($line.StartsWith("worktree ")) {
      $candidate = $line.Substring(9)
    }
    elseif ($line -eq "branch refs/heads/gh-pages") {
      return $candidate
    }
  }

  return $null
}

$deployRoot = Find-GhPagesWorktree

if (-not $deployRoot) {
  & git -C $repoRoot show-ref --verify --quiet refs/heads/gh-pages
  if ($LASTEXITCODE -ne 0) {
    & git -C $repoRoot fetch origin gh-pages:gh-pages
    if ($LASTEXITCODE -ne 0) {
      throw "Nao foi possivel obter o branch gh-pages de origin."
    }
  }

  $deployRoot = Join-Path (Split-Path $repoRoot -Parent) "aventurao-gh-pages"
  if (Test-Path -LiteralPath $deployRoot) {
    throw "O destino $deployRoot ja existe e nao e um worktree gh-pages conhecido."
  }

  & git -C $repoRoot worktree add $deployRoot gh-pages
  if ($LASTEXITCODE -ne 0) {
    throw "Nao foi possivel criar o worktree gh-pages."
  }
}

Get-ChildItem -LiteralPath $webBuild -Force | ForEach-Object {
  Copy-Item -LiteralPath $_.FullName -Destination $deployRoot -Recurse -Force
}

$noJekyll = Join-Path $deployRoot ".nojekyll"
if (-not (Test-Path -LiteralPath $noJekyll)) {
  New-Item -ItemType File -Path $noJekyll | Out-Null
}

& git -C $deployRoot add -A
if ($LASTEXITCODE -ne 0) {
  throw "Falhou o git add no branch gh-pages."
}

& git -C $deployRoot diff --cached --quiet
if ($LASTEXITCODE -eq 0) {
  Write-Output "O build Web ja esta atualizado; nao ha alteracoes para publicar."
  exit 0
}

& git -C $deployRoot commit -m $CommitMessage
if ($LASTEXITCODE -ne 0) {
  throw "Falhou o commit no branch gh-pages."
}

& git -C $deployRoot push origin gh-pages
if ($LASTEXITCODE -ne 0) {
  throw "Falhou o push do branch gh-pages."
}

Write-Output "Publicado em https://joaobimbo.github.io/aventurao/"
