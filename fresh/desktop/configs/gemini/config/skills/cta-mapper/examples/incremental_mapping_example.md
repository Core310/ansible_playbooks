# Example: Incremental Codebase Mapping via Git Diffs

This example demonstrates how `cta-mapper` updates only modified files in a 10,000-file repository in under 200 milliseconds.

## Running Incremental Map
```bash
python3 /home/arika/Documents/ansible_stuff/ansible_playbooks/fresh/desktop/configs/gemini/config/skills/cta-init/scripts/cta_engine.py --workspace . map --incremental
```

### Output
```
Codebase mapped: 2 indexed, 10238 unchanged, 0 pruned.
```
