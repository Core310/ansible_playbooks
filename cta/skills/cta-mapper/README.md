# cta-mapper

`cta-mapper` scans files in the workspace, extracts code symbols and relationships, indexes them into SQLite, and outputs structured YAML guides.

## Incremental Git Diff Algorithm
1. Reads `last_scanned_commit` from SQLite table `git_tracker`.
2. Queries `git diff --name-status <commit>` and uncommitted changes via `git status --porcelain`.
3. Computes `git hash-object` for modified candidates.
4. If a file's hash has not changed, AST parsing is bypassed entirely.
5. If modified, deletes old records for that file and re-inserts updated symbols, relationships, docstrings, and tags.
6. Prunes deleted files from all SQLite tables and FTS5 index.
7. Rebuilds `cta_codebase_index.yml` and `cta_directory_structure.yml`.

## Commands
```bash
# Full mapping pass
python3 /home/arika/Documents/ansible_stuff/ansible_playbooks/fresh/desktop/configs/gemini/config/skills/cta-init/scripts/cta_engine.py --workspace . map

# Fast incremental mapping pass
python3 /home/arika/Documents/ansible_stuff/ansible_playbooks/fresh/desktop/configs/gemini/config/skills/cta-init/scripts/cta_engine.py --workspace . map --incremental
```
