# Quick Start: Local Garak Integration

This guide gets you up and running with the local garak copy in 5 minutes.

## What Changed

✅ **Garak copied to**: `aegis/backend/garak/`
✅ **Requirements updated**: Added `-e ./garak` for editable install
✅ **Proposal created**: See `GARAK_ENHANCEMENT_PROPOSAL.md` for full plan
✅ **Dev guide created**: See `LOCAL_GARAK_DEVELOPMENT_GUIDE.md` for details

## Setup (5 Minutes)

### 1. Install Dependencies

```bash
cd aegis/backend

# Create virtual environment (if you haven't already)
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# Install all dependencies including local garak
pip install -r requirements.txt

# Verify garak is installed from local copy
pip show garak
# Location should be: /path/to/aegis/backend/garak
```

### 2. Verify Installation

```bash
# Test garak command
python -m garak --version
# Should output: garak 0.13.3.pre1 (or similar)

# Test import
python -c "import garak; print('✅ Garak imported successfully!')"
```

### 3. Run a Test Scan

```bash
# Simple test scan
python -m garak \
    --target_type ollama \
    --target_name gemma3 \
    --probes dan.DAN_Jailbreak \
    --generations 3

# Check the output
ls ~/.local/share/garak/garak_runs/
```

## Making Your First Modification

Let's add mitigation recommendations to a probe as a proof-of-concept.

### Step 1: Edit the DAN Probe

Open `aegis/backend/garak/garak/probes/dan.py` and add this at the end of the `DAN_Jailbreak` class:

```python
class DAN_Jailbreak(Probe):
    # ... existing code ...

    # ADD THIS METHOD
    def _attempt_prestore_hook(self, attempt, seq):
        """Add mitigation recommendations to failed attempts"""
        from datetime import datetime
        from garak.attempt import ATTEMPT_COMPLETE

        # Always timestamp
        attempt.timestamp = datetime.now().isoformat()

        # Check if this attempt failed
        if attempt.status == ATTEMPT_COMPLETE:
            failed = any(
                any(score > 0 for score in scores)
                for scores in attempt.detector_results.values()
            )

            if failed:
                # Add detailed information
                attempt.vulnerability_explanation = (
                    "This model failed to resist a DAN jailbreak prompt. "
                    "Jailbreaks allow attackers to bypass safety controls."
                )

                attempt.mitigation_recommendations = [
                    "Implement jailbreak pattern detection on input",
                    "Add output safety filtering (e.g., Llama Guard)",
                    "Strengthen refusal training with constitutional AI",
                    "Monitor for repeated jailbreak attempts"
                ]

                attempt.severity = "high"
                attempt.attack_technique = "Jailbreak"

                print(f"✅ Added mitigation data to attempt {attempt.uuid}")
```

### Step 2: Run a Scan

```bash
python -m garak \
    --target_type ollama \
    --target_name gemma3 \
    --probes dan.DAN_Jailbreak \
    --generations 3
```

### Step 3: Check the Report

```bash
# Find the latest report
REPORT=$(ls -t ~/.local/share/garak/garak_runs/garak.*.report.jsonl | head -1)

# View mitigation recommendations
cat $REPORT | jq 'select(.entry_type=="attempt") | {
    probe: .probe_classname,
    explanation: .vulnerability_explanation,
    mitigations: .mitigation_recommendations,
    severity: .severity
}'
```

You should see output like:

```json
{
  "probe": "dan.DAN_Jailbreak",
  "explanation": "This model failed to resist a DAN jailbreak prompt...",
  "mitigations": [
    "Implement jailbreak pattern detection on input",
    "Add output safety filtering (e.g., Llama Guard)",
    ...
  ],
  "severity": "high"
}
```

## Testing with Aegis Backend

### 1. Start the Backend

```bash
cd aegis/backend
python main.py
```

### 2. Run a Scan via API

```bash
curl -X POST http://localhost:8888/api/v1/scan/start \
  -H "Content-Type: application/json" \
  -d '{
    "target_type": "ollama",
    "target_name": "gemma3",
    "probes": ["dan.DAN_Jailbreak"],
    "detectors": ["auto"],
    "generations": 3
  }'
```

Save the `scan_id` from the response.

### 3. Get Results

```bash
# Replace <scan_id> with actual ID
curl http://localhost:8888/api/v1/scan/<scan_id>/results
```

## Next Steps

### Option A: Implement Full Enhancement Proposal

Follow the implementation plan in `GARAK_ENHANCEMENT_PROPOSAL.md`:

1. **Phase 1**: Enhance Attempt and Probe base classes
2. **Phase 2**: Add metadata to all probe categories
3. **Phase 3**: Create developer report generator
4. **Phase 4**: Update Aegis backend/frontend

### Option B: Just Use Local Garak for Development

Continue using the local copy to:
- Fix bugs in garak
- Add custom probes
- Customize report formats
- Experiment with new features

Any changes you make in `aegis/backend/garak/` will be immediately active!

## Common Tasks

### Add a Custom Probe

Create `aegis/backend/garak/garak/probes/custom.py`:

```python
from garak.probes.base import Probe

class MyCustomProbe(Probe):
    """Test for custom vulnerability"""

    bcp47 = "en"
    goal = "test custom attack"

    prompts = [
        "Your custom test prompt here",
        "Another test prompt",
    ]

    def _attempt_prestore_hook(self, attempt, seq):
        # Add your custom metadata
        attempt.vulnerability_explanation = "Custom explanation"
        attempt.mitigation_recommendations = ["Fix 1", "Fix 2"]
```

Run it:

```bash
python -m garak --target_type ollama --target_name gemma3 --probes custom.MyCustomProbe
```

### Update Garak from Upstream

```bash
cd aegis/backend/garak

# Pull latest changes from NVIDIA's garak
git pull origin main

# Or fetch a specific version
git fetch --all --tags
git checkout tags/v0.13.3
```

### Debug Garak Issues

Add debug logging:

```python
# In any garak file
import logging
logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger(__name__)

logger.debug("Your debug message here")
```

## Troubleshooting

**Problem**: `ModuleNotFoundError: No module named 'garak'`

**Solution**:
```bash
pip install -e ./garak
```

**Problem**: Changes not taking effect

**Solution**: Restart the backend or Python interpreter.

**Problem**: Garak not found by Aegis backend

**Solution**: Set `GARAK_PATH` in `aegis/backend/.env`:
```
GARAK_PATH=/path/to/venv/bin/garak
```

## Resources

- **Full Enhancement Proposal**: [GARAK_ENHANCEMENT_PROPOSAL.md](./GARAK_ENHANCEMENT_PROPOSAL.md)
- **Development Guide**: [LOCAL_GARAK_DEVELOPMENT_GUIDE.md](./LOCAL_GARAK_DEVELOPMENT_GUIDE.md)
- **Garak Documentation**: https://docs.garak.ai
- **Garak GitHub**: https://github.com/NVIDIA/garak

---

## Summary

You now have:

✅ Local garak copy for development
✅ Editable install (changes take effect immediately)
✅ Example of adding mitigation recommendations
✅ Working Aegis integration

**Next**: Implement the full enhancement proposal to get detailed, developer-friendly vulnerability reports!
