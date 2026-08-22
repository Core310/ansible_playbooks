# Example: Task Execution and Logging

```bash
python3 /home/arika/Documents/ansible_stuff/ansible_playbooks/fresh/desktop/configs/gemini/config/skills/cta-init/scripts/cta_engine.py log-action \
  --milestone "M001" \
  --phase "Phase 2" \
  --task "Task 2.1" \
  --type "EXECUTION" \
  --desc "Added index on symbols(file_path)" \
  --status "SUCCESS" \
  --files ".cta/cta_codebase.db" \
  --summary "Migration applied. Index verified."
```
