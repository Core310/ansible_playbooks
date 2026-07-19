---
version: 1
always_use_skills: []
prefer_skills:
  - /home/arika/.gemini/config/skills/cleanup
  - gsd-verifier
avoid_skills: []
skill_rules: []
custom_instructions:
  - |
    ### GSD Auto-Resume Rule
    Whenever you start a new conversation or task, check if a `.planning` directory exists in the current workspace. If it does, you MUST silently read all files in the `.planning` directory to get the current context before responding to the user or starting work.
    
    
    ### Explicit Approval Rule
    You cannot execute git actions or modify codebase code without explicit user approval. The user must explicitly say "yes" or specifically instruct you to do so before you make any changes.
    
    
    ### Workspace Context Rule
    When a new agy session is made, only grab the context from the directory it was started. For example, if started in ~/Documents/tmp, then only look for previous project context in the tmp folder.
    
    ### No Assumption Rule
    Always prefer asking the user if it is not clear what they are asking instead of assuming. If data the user asks for is not available, do not make up temp numbers or random ones unless the user explicitly tells you to do so.
    
    
    ### Summary at the End Rule
    All conversational text and summaries of what you did during a turn must be provided at the very end of your response. Do not output text piecemeal while performing actions; perform all necessary actions first, and then tell the user everything you did at the end.

models: {}
skill_discovery:
auto_supervisor: {}
git:
  auto_push:
  push_branches:
  remote:
  snapshots:
  pre_merge_check:
  commit_type:
---

# GSD Skill Preferences

See `~/.gsd/agent/extensions/gsd/docs/preferences-reference.md` for full field documentation and examples.
