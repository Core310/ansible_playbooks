# Example: Targeted RAG Querying

This example demonstrates using `cta_fetch.py` to retrieve exact code context.

## Step 1: Query for Auth Symbols
```bash
python3 /home/arika/Documents/ansible_stuff/ansible_playbooks/fresh/desktop/configs/gemini/config/skills/cta-init/scripts/cta_fetch.py symbol auth
```

## Step 2: Slice Targeted File
```bash
python3 /home/arika/Documents/ansible_stuff/ansible_playbooks/fresh/desktop/configs/gemini/config/skills/cta-init/scripts/cta_fetch.py slice backend/auth/jwt.py 1 30
```
