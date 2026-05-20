# AGI Global Rules

This directory contains the global configuration rules and custom subagents for AGI CLI.

## Setup

### Rules
The file `AGI.md` in this directory should be symlinked to `~/.agi/AGI.md` to ensure AGI CLI loads these rules globally across all sessions.

```bash
ln -sf /home/$USER/Documents/ansible_stuff/ansible_playbooks/app_backups/agi_rules/AGI.md ~/.agi/AGI.md
```

### Agents
Copy or symlink the files in the `agents/` directory to `~/.agi/agents/`.

```bash
cp /home/$USER/Documents/ansible_stuff/ansible_playbooks/app_backups/agi_rules/agents/*.md ~/.agi/agents/
```

## Rules Included

- **Style**: No emojis or italics. Bold is restricted to the first word of bullet points.
- **Formatting**: Bullet points use '-' and math uses $.
- **Safety**: Moving files to /trash by default; no commits without permission.
- **Project Structure**: MILESTONE -> Phases -> sub-phases -> todos.
- **Workflow**: Mandatory plan before coding; assume fixes fail until user confirms success.
- **Checkpointing**: Automatic 'RESUME HERE' updates in `.planning` to allow safe use of `/clear`.
- **GSD Integration**: Prefer GSD subagents (e.g., `@cleanup`, `@syntax-auditor`). Includes strict researcher/discuss/executor phases.
- **Ready Context**: Instructions to maintain context awareness after `/clear` or session resets.
- **Summarization**: Short summaries at the end of every response.
- **Context**: Automatic sourcing of `.planning` directories.

## Custom Agents

- **@cleanup**: Handles project health (`gsd doctor`), codebase mapping, and uncommitted drift detection.
- **@syntax-auditor**: Audits local files against official online documentation.

## Skills & Commands

- **course**: Use `/course` to transform any codebase into a beautiful, interactive single-page HTML course.
