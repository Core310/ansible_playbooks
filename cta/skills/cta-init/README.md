# cta-init

`cta-init` sets up the complete hybrid Spec-Driven RAG environment for any codebase.

## Features
- **Dual SQLite Database Setup**:
  - `cta_turns.db`: Turn logs, active concerns, lessons learned, and checkpoint history.
  - `cta_codebase.db`: High-performance symbol indexing, AST parsing, and FTS5 search.
- **YAML Guide Generation**:
  - `cta_codebase_index.yml`: Tag index and query templates.
  - `cta_directory_structure.yml`: Module hierarchy and architectural boundaries.

## Usage
```bash
python3 /home/arika/Documents/ansible_stuff/ansible_playbooks/fresh/desktop/configs/gemini/config/skills/cta-init/scripts/cta_engine.py --workspace . init
```
