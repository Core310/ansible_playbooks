# CTA (Context & Code Tracking Architecture)

A hybrid Spec-Driven Development + RAG framework for AGY on large codebases.

## Structure
- `bin/`: CLI tools (`cta_engine.py` and `cta_fetch.py`).
- `skills/`: CTA skills (`cta-init`, `cta-mapper`, `cta-query`, `cta-planner`, `cta-executor`, `cta-swarm`, `cta-clear`, `cta-resume`).

## Installation
From the project root:
```bash
./install-cta-skills.sh --install
```
Or via Ansible:
```bash
ansible-playbook -i localhost, fresh/desktop/main_script.yml
```
