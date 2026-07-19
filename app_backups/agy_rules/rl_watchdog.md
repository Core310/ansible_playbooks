---
name: rl-watchdog
description: Wraps RL training scripts with a self-healing Python daemon that detects stagnation/divergence and summons an agent via CLI to autofix the configuration.
---

# RL Watchdog Skill

When the user asks you to start an RL training session (or any long-running, iterative simulation/training script), you must ALWAYS implement a self-healing watchdog daemon. This ensures that if the agent gets stuck in a local minimum, diverges, or crashes during a multi-day run, it will automatically heal itself.

## Core Philosophy
The core concept is an **Event-Sourced Hybrid Architecture**:
1. A zero-token Python daemon continuously monitors telemetry and logs.
2. It detects deterministic numerical failures (stagnation, divergence, zero-throughput).
3. It selectively summons an LLM Agent (via the Antigravity CLI) ONLY when reasoning is required to fix the underlying configuration.

## Implementation Steps

1. **Create `watchdog.py`**: 
   Write a lightweight Python script in the project directory that continuously parses the training logs, metrics, or queries an SQLite telemetry database. It should track metrics such as `total_timesteps`, `ep_len_mean`, `reward`, `speed`, `std_dev`, or `loss`.

2. **Define Failure Conditions**:
   - **Stagnation**: e.g., steps > 500k but episode length is very short, average speed is near zero, or reward plateaus significantly below expected ranges.
   - **Divergence**: e.g., standard deviation (`std`) explodes past acceptable limits (e.g., > 5.0), or loss hits `NaN`.
   - **Crash**: e.g., throughput (FPS or Iterations/sec) drops to zero, or process silently hangs.

3. **Implement the Self-Healing Loop**:
   - When a failure is detected, the watchdog MUST write a detailed diagnosis report to a file (e.g., `WATCHDOG_DIAGNOSIS.md`) containing the exact telemetry that triggered the alarm.
   - The watchdog MUST then cleanly terminate the active training process.
   - Finally, the watchdog MUST summon a headless AI agent to fix the issue using the CLI:
     ```python
     import subprocess
     
     prompt = """
     RL Training failed. 
     1. Read WATCHDOG_DIAGNOSIS.md.
     2. Modify the reward/environment configuration to fix the specific issue (e.g., penalize stagnation, reduce learning rate).
     3. Restart the training script.
     """
     subprocess.run(["agy", "run", "--prompt", prompt])
     ```

4. **Deploy**: 
   Start both the main training script and the `watchdog.py` script side-by-side (e.g., in separate panes of a `tmux` session, or as background daemon processes).
