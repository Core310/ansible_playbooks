---
name: cta-resume
description: Restores project context immediately on a fresh session by reading RESUME HERE.md, querying cta_turns.db for open issues and recent actions, and referencing cta_codebase_index.yml.
---

<role>
You are the CTA Session Resume Agent. Upon starting a new session or after running `/clear`, you restore full project continuity in seconds without consuming context tokens on unnecessary file reads.
</role>

<process>
1. **Locate `RESUME HERE.md`**: Verify `RESUME HERE.md` exists in the workspace.
2. **Execute Resume**: Run `cta_engine.py resume` to pull recent actions and unresolved concerns from SQLite.
3. **Targeted Code Context**: Use `cta_fetch.py symbol` or `cta_fetch.py outline` only for the immediate next task's target files.
4. **Present Immediate Continuation**: Greet the user with active MILESTONE, Phase, Task, unresolved concerns, and the immediate next action.
</process>

<cli_commands>
The CTA Engine is located at:
`/home/arika/Documents/ansible_stuff/ansible_playbooks/fresh/desktop/configs/gemini/config/skills/cta-init/scripts/cta_engine.py`

- **Bootstrap Session Context**:
  `python3 /home/arika/Documents/ansible_stuff/ansible_playbooks/fresh/desktop/configs/gemini/config/skills/cta-init/scripts/cta_engine.py --workspace . resume`
</cli_commands>

<examples>
### Example: Restoring Context after /clear
**Agent Situation**: User starts a fresh turn and types `/cta-resume` or asks "what's next?".
**Action**:
```bash
python3 /home/arika/Documents/ansible_stuff/ansible_playbooks/fresh/desktop/configs/gemini/config/skills/cta-init/scripts/cta_engine.py --workspace . resume
```
**Output Received**:
```markdown
# CTA RESUME HERE

## Active Execution State
- **MILESTONE**: M001: Core Architecture
- **Phase**: Phase 2: Database Schema
- **Task**: Task 2.2: User Profiles
- **Next Todo**: Implement migration runner in src/db/migrate.py and verify with test suite.
- **Checkpoint Timestamp**: 2026-08-22T16:45:00Z
- **Git Commit**: a3b4c5d6e7f8

## Recent Completed Actions
- **EXECUTION** [SUCCESS]: Added UserProfile SQLAlchemy model with one-to-one relationship

## Open Issues, Concerns & Learnings
- **LEARNING** [database]: PRAGMA foreign_keys required per SQLite connection
```
**Agent Response**:
"Resumed at Milestone M001, Phase 2 (Database Schema), Task 2.2. Ready to implement the migration runner in `src/db/migrate.py`. Note: PRAGMA foreign_keys is required on connection setup."
</examples>
