#!/usr/bin/env bash
# CTA Installer and Updater Script
# Manages CTA CLI binaries, Git commit-hash update verification, and skill symlinks.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../../../../.." && pwd)"
BIN_DIR="${HOME}/.local/bin"
GEMINI_SKILLS_DIR="${HOME}/.gemini/config/skills"
AGY_SKILLS_DIR="${HOME}/.agy/skills"

show_help() {
  cat <<EOF
CTA Installation & Update Management Tool

Usage:
  ./install_cta.sh [options]

Options:
  --install         Install CTA CLI tools and link skills to ~/.gemini and ~/.agy
  --update          Check git commit hash, pull latest updates, and refresh links
  --check           Check if remote updates exist by comparing git commit hashes
  --help            Show this help message

Examples:
  ./install_cta.sh --install
  ./install_cta.sh --update
EOF
}

check_updates() {
  echo "Checking for CTA updates..."
  if [ -d "${REPO_ROOT}/.git" ]; then
    cd "${REPO_ROOT}"
    LOCAL_HASH=$(git rev-parse --short HEAD)
    echo "Current local commit: ${LOCAL_HASH}"
    
    if git fetch origin main --quiet 2>/dev/null; then
      REMOTE_HASH=$(git rev-parse --short origin/main 2>/dev/null || echo "${LOCAL_HASH}")
      echo "Remote origin commit: ${REMOTE_HASH}"
      if [ "${LOCAL_HASH}" != "${REMOTE_HASH}" ]; then
        echo "Update available! (${LOCAL_HASH} -> ${REMOTE_HASH})"
        return 1
      else
        echo "CTA is up to date at commit ${LOCAL_HASH}."
        return 0
      fi
    else
      echo "Could not reach remote origin. Skipping remote check."
      return 0
    fi
  else
    echo "Not a Git repository at ${REPO_ROOT}."
    return 0
  fi
}

install_cta() {
  echo "Installing CTA Framework..."
  mkdir -p "${BIN_DIR}"
  mkdir -p "${GEMINI_SKILLS_DIR}"
  mkdir -p "${AGY_SKILLS_DIR}"

  CTA_ENGINE="${SCRIPT_DIR}/cta-init/scripts/cta_engine.py"
  CTA_FETCH="${SCRIPT_DIR}/cta-init/scripts/cta_fetch.py"

  chmod +x "${CTA_ENGINE}" "${CTA_FETCH}"

  # Create executable wrapper for cta
  cat <<WRAPPER > "${BIN_DIR}/cta"
#!/usr/bin/env bash
exec python3 "${CTA_ENGINE}" "\$@"
WRAPPER
  chmod +x "${BIN_DIR}/cta"

  # Create executable wrapper for cta-fetch
  cat <<WRAPPER > "${BIN_DIR}/cta-fetch"
#!/usr/bin/env bash
exec python3 "${CTA_FETCH}" "\$@"
WRAPPER
  chmod +x "${BIN_DIR}/cta-fetch"

  echo "Created CLI binaries:"
  echo "  - ${BIN_DIR}/cta"
  echo "  - ${BIN_DIR}/cta-fetch"

  # Link/Sync skills safely avoiding circular self-links
  REAL_SCRIPT_DIR=$(realpath "${SCRIPT_DIR}")
  REAL_GEMINI_DIR=$(realpath "${GEMINI_SKILLS_DIR}")

  for skill_dir in "${SCRIPT_DIR}"/cta-*; do
    if [ -d "${skill_dir}" ]; then
      skill_name=$(basename "${skill_dir}")
      
      # Only link to gemini if it is a physically distinct directory
      if [ "${REAL_SCRIPT_DIR}" != "${REAL_GEMINI_DIR}" ]; then
        rm -rf "${GEMINI_SKILLS_DIR}/${skill_name}"
        ln -sf "${skill_dir}" "${GEMINI_SKILLS_DIR}/${skill_name}"
      fi

      # Link to ~/.agy/skills
      REAL_AGY_DIR=$(realpath "${AGY_SKILLS_DIR}")
      if [ "${REAL_SCRIPT_DIR}" != "${REAL_AGY_DIR}" ]; then
        rm -rf "${AGY_SKILLS_DIR}/${skill_name}"
        ln -sf "${skill_dir}" "${AGY_SKILLS_DIR}/${skill_name}"
      fi
    fi
  done

  echo "Linked CTA skills to ~/.gemini/config/skills and ~/.agy/skills."

  if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
    echo ""
    echo "NOTE: ${BIN_DIR} is not currently in your \$PATH."
    echo "Add it to your ~/.bashrc or ~/.zshrc:"
    echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
  fi

  echo ""
  echo "Installation Complete!"
  "${BIN_DIR}/cta" --help | head -n 8
}

update_cta() {
  echo "Updating CTA Framework..."
  if [ -d "${REPO_ROOT}/.git" ]; then
    cd "${REPO_ROOT}"
    LOCAL_BEFORE=$(git rev-parse --short HEAD)
    echo "Fetching and pulling latest changes..."
    git pull --ff-only origin main || {
      echo "Warning: git pull failed or has merge conflicts. Please resolve manually."
    }
    LOCAL_AFTER=$(git rev-parse --short HEAD)
    echo "Repository updated: ${LOCAL_BEFORE} -> ${LOCAL_AFTER}"
  fi
  install_cta
}

MODE="${1:---install}"

case "${MODE}" in
  --install)
    install_cta
    ;;
  --update)
    update_cta
    ;;
  --check)
    check_updates || true
    ;;
  --help|-h)
    show_help
    ;;
  *)
    echo "Unknown option: ${MODE}"
    show_help
    exit 1
    ;;
esac
