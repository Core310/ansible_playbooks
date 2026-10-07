#!/usr/bin/env python3
"""
CTA (Context & Code Tracking Architecture) - Personal Overlay CLI
Wraps and extends ClearSet (cs) with personal workflows, AI defense gates, and local rules.
"""

import sys
import os
import argparse
import subprocess
from pathlib import Path

# ClearSet core import
import clearset as cs
import clearset.engine as cs_engine
import clearset.sync as cs_sync
import clearset.gate as cs_gate
import clearset.fetch as cs_fetch
import clearset.cleanup as cs_cleanup
import clearset.stagger as cs_stagger

AI_DEFENSE_GATE = Path("/home/arika/D/school/ai_defense_gate.py")


def run_audit(target_path: str) -> int:
    """Runs the personal AI defense gate against a file or directory."""
    if not AI_DEFENSE_GATE.exists():
        print(f"Error: AI defense gate not found at {AI_DEFENSE_GATE}", file=sys.stderr)
        return 1
    
    cmd = [sys.executable, str(AI_DEFENSE_GATE), "audit", target_path]
    res = subprocess.run(cmd)
    return res.returncode


def main():
    # If first argument is 'audit', route directly to personal gate
    if len(sys.argv) > 1 and sys.argv[1] == "audit":
        if len(sys.argv) < 3:
            print("Usage: cta audit <file_path>")
            sys.exit(1)
        sys.exit(run_audit(sys.argv[2]))

    # If first argument is 'stagger', route to clearset.stagger
    if len(sys.argv) > 1 and sys.argv[1] == "stagger":
        sys.argv.pop(1)
        cs_stagger.main()
        return

    # If first argument is 'sync', route to clearset.sync
    if len(sys.argv) > 1 and sys.argv[1] == "sync":
        sys.argv.pop(1)
        cs_sync.main()
        return

    # If first argument is 'gate', route to clearset.gate
    if len(sys.argv) > 1 and sys.argv[1] == "gate":
        sys.argv.pop(1)
        cs_gate.main()
        return

    # If first argument is 'fetch', route to clearset.fetch
    if len(sys.argv) > 1 and sys.argv[1] == "fetch":
        sys.argv.pop(1)
        cs_fetch.main()
        return

    # If first argument is 'cleanup', route to clearset.cleanup
    if len(sys.argv) > 1 and sys.argv[1] == "cleanup":
        sys.argv.pop(1)
        cs_cleanup.main()
        return

    # Default: Delegate to ClearSet core engine
    cs_engine.main()


if __name__ == "__main__":
    main()
