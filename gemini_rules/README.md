# Gemini Global Rules

This directory contains the global configuration rules and custom subagents for Gemini CLI.

## Setup

### Rules
The file `GEMINI.md` in this directory should be symlinked to `~/.gemini/GEMINI.md` to ensure Gemini CLI loads these rules globally across all sessions.

```bash
ln -sf /home/arika/Documents/ansible_stuff/ansible_playbooks/gemini_rules/GEMINI.md ~/.gemini/GEMINI.md
```

### Agents
Copy or symlink the files in the `agents/` directory to `~/.gemini/agents/`.

```bash
cp /home/arika/Documents/ansible_stuff/ansible_playbooks/gemini_rules/agents/*.md ~/.gemini/agents/
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
