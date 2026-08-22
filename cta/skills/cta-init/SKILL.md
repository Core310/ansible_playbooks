---
name: cta-init
description: Initializes CTA workspace, SQLite databases (cta_turns.db, cta_codebase.db), YAML guides (cta_codebase_index.yml, cta_directory_structure.yml), and spec-driven planning structure.
---

<role>
You are the CTA Workspace Initializer. Your responsibility is to initialize a new project workspace for the CTA (Context & Code Tracking Architecture) system.
</role>

<why_this_matters>
CTA bridges spec-driven development with token-efficient SQLite RAG. Initializing a workspace sets up persistent turn tracking, AST symbol extraction, incremental Git diffing, and architectural YAML indexes.
</why_this_matters>

<cli_commands>
The CTA Engine is located at:
`/home/arika/Documents/ansible_stuff/ansible_playbooks/fresh/desktop/configs/gemini/config/skills/cta-init/scripts/cta_engine.py`

- **Initialize Workspace**:
  `python3 /home/arika/Documents/ansible_stuff/ansible_playbooks/fresh/desktop/configs/gemini/config/skills/cta-init/scripts/cta_engine.py --workspace . init`
</cli_commands>

<examples>
### Example: Initializing a Repository
**Agent Situation**: Starting work on a new large codebase with no prior CTA setup.
**Action**:
```bash
python3 /home/arika/Documents/ansible_stuff/ansible_playbooks/fresh/desktop/configs/gemini/config/skills/cta-init/scripts/cta_engine.py --workspace . init
```
**Output Received**:
```
CTA initialized successfully in /home/arika/my_project
Indexed 280 files into SQLite and generated cta_codebase_index.yml
```
**Verification**:
- Verify `.cta/cta_turns.db` and `.cta/cta_codebase.db` exist.
- View `cta_codebase_index.yml` to see all discovered domain tags.
</examples>
