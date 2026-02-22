#!/usr/bin/env bash
set -euo pipefail

# case.dev CLI installer
# Installs casedev via Homebrew (macOS) or shell script (Linux/macOS fallback)

if command -v casedev >/dev/null 2>&1; then
  echo "casedev is already installed: $(casedev --version 2>/dev/null || echo 'unknown version')"
  exit 0
fi

if command -v brew >/dev/null 2>&1; then
  echo "Installing casedev via Homebrew..."
  brew install casemark/casedev/casedev
else
  echo "Installing casedev via shell script..."
  curl -fsSL https://raw.githubusercontent.com/CaseMark/homebrew-casedev/main/install.sh | sh
fi

if command -v casedev >/dev/null 2>&1; then
  echo "casedev installed successfully: $(casedev --version 2>/dev/null || echo 'unknown version')"
else
  echo "Installation failed. Install manually: brew install casemark/casedev/casedev"
  exit 1
fi
