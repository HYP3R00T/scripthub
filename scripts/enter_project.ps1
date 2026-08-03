$ErrorActionPreference = "Stop"

# Keep this script behaviorally aligned with enter_project.sh.
$projectRoot = $env:MISE_PROJECT_ROOT
if (-not $projectRoot) {
    $projectRoot = (& git rev-parse --show-toplevel).Trim()
    if ($LASTEXITCODE -ne 0) {
        throw "Unable to determine the project root."
    }
}
Set-Location -LiteralPath $projectRoot

# Ensure Commitizen (cz) is available when uv is installed.
if ((Get-Command uv -ErrorAction SilentlyContinue) -and
    -not (Get-Command cz -ErrorAction SilentlyContinue)) {
    & uv tool install commitizen
    if ($LASTEXITCODE -ne 0 -or -not (Get-Command cz -ErrorAction SilentlyContinue)) {
        throw "Failed to install commitizen."
    }
}

# Configure prek hooks idempotently when prek is available.
if (Get-Command prek -ErrorAction SilentlyContinue) {
    $preCommitHook = (& git rev-parse --git-path hooks/pre-commit).Trim()
    $commitMsgHook = (& git rev-parse --git-path hooks/commit-msg).Trim()

    $hasPreCommitHook = (Test-Path -LiteralPath $preCommitHook) -and
        (Select-String -LiteralPath $preCommitHook -SimpleMatch "prek" -Quiet)
    if (-not $hasPreCommitHook) {
        & prek install --overwrite | Out-Null
        if ($LASTEXITCODE -ne 0) {
            throw "Failed to install the pre-commit hook."
        }
    }

    $hasCommitMsgHook = (Test-Path -LiteralPath $commitMsgHook) -and
        (Select-String -LiteralPath $commitMsgHook -SimpleMatch "prek" -Quiet)
    if (-not $hasCommitMsgHook) {
        & prek install --hook-type commit-msg --overwrite | Out-Null
        if ($LASTEXITCODE -ne 0) {
            throw "Failed to install the commit-msg hook."
        }
    }
}
