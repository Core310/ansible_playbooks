#!/usr/bin/env bash
# CTA Skills Installer & Updater
# Location: Content root of the Ansible playbooks repository.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CTA_DIR="${REPO_ROOT}/cta"
BIN_DIR="${HOME}/.local/bin"
GEMINI_SKILLS_DIR="${HOME}/.gemini/config/skills"
AGY_SKILLS_DIR="${HOME}/.agy/skills"

show_help() {
  cat <<EOF
CTA Framework Installer & Manager

Usage:
  ./install-cta-skills.sh [options]

Options:
  --install         Install CLI tools to ~/.local/bin and symlink skills
  --update          Check git commit hash, pull updates, and refresh links
  --check           Check for updates by comparing local vs remote commit hashes
  --help            Show this help message

Default action (no args): runs --install
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
  fi
  return 0
}

install_cta() {
  echo "Installing CTA Framework from ${CTA_DIR}..."
  mkdir -p "${BIN_DIR}"
  mkdir -p "${GEMINI_SKILLS_DIR}"
  mkdir -p "${AGY_SKILLS_DIR}"

  CTA_ENGINE="${CTA_DIR}/bin/cta_engine.py"
  CTA_FETCH="${CTA_DIR}/bin/cta_fetch.py"

  chmod +x "${CTA_ENGINE}" "${CTA_FETCH}"

  # Create executable wrapper for cta in ~/.local/bin
  cat <<WRAPPER > "${BIN_DIR}/cta"
#!/usr/bin/env bash
exec python3 "${CTA_ENGINE}" "\$@"
WRAPPER
  chmod +x "${BIN_DIR}/cta"

  # Create executable wrapper for cta-fetch in ~/.local/bin
  cat <<WRAPPER > "${BIN_DIR}/cta-fetch"
#!/usr/bin/env bash
exec python3 "${CTA_FETCH}" "\$@"
WRAPPER
  chmod +x "${BIN_DIR}/cta-fetch"

  echo "Installed CLI binaries:"
  echo "  - ${BIN_DIR}/cta"
  echo "  - ${BIN_DIR}/cta-fetch"

  # Link skills safely to ~/.gemini/config/skills and ~/.agy/skills
  for skill_dir in "${CTA_DIR}/skills"/cta-*; do
    if [ -d "${skill_dir}" ]; then
      skill_name=$(basename "${skill_dir}")
      
      # Link to Gemini
      rm -rf "${GEMINI_SKILLS_DIR}/${skill_name}"
      ln -sf "${skill_dir}" "${GEMINI_SKILLS_DIR}/${skill_name}"

      # Link to AGY
      rm -rf "${AGY_SKILLS_DIR}/${skill_name}"
      ln -sf "${skill_dir}" "${AGY_SKILLS_DIR}/${skill_name}"
    fi
  done

  echo "Linked CTA skills to ~/.gemini/config/skills and ~/.agy/skills."

  # PATH verification
  if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
    echo ""
    echo "NOTE: ${BIN_DIR} is not in your current PATH."
    echo "Ensure it is exported in ~/.bashrc or ~/.zshrc:"
    echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
  fi

  echo ""
  echo "CTA Installation Successful!"
  "${BIN_DIR}/cta" --help | head -n 6
}

update_cta() {
  echo "Updating CTA Framework..."
  if [ -d "${REPO_ROOT}/.git" ]; then
    cd "${REPO_ROOT}"
    LOCAL_BEFORE=$(git rev-parse --short HEAD)
    echo "Pulling latest repository changes..."
    git pull --ff-only origin main || {
      echo "Warning: git pull failed. Please resolve manually."
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
