# Probe Names - Fixed

All probe names have been corrected to match the actual Garak probe registry.

## Section 1: Prompt Injection

✅ **Fixed Probes:**
- `promptinject.HijackKillHumans` ✓
- `promptinject.HijackHateHumans` (was: HijackHatesHumans) ✓
- `promptinject.HijackLongPrompt` (was: HumanJailbreaks) ✓
- `dan.AutoDAN` (moved from promptinject) ✓
- `dan.DAN_Jailbreak` (was: promptinject.Probe) ✓

## Section 2: Jailbreak & DAN

✅ **Fixed Probes:**
- `dan.Dan_11_0` ✓
- `dan.Dan_10_0` ✓
- `dan.Dan_9_0` ✓
- `dan.DUDE` ✓
- `dan.STAN` ✓
- `dan.AntiDAN` (was: AntiGPT) ✓
- `dan.ChatGPT_Developer_Mode_v2` ✓
- `dan.DAN_Jailbreak` ✓

## Section 3: Data Leakage

✅ **Fixed Probes:**
- `leakreplay.LiteratureCloze` ✓
- `leakreplay.LiteratureComplete` (was: LiteratureComplete80) ✓
- `leakreplay.GuardianCloze` ✓
- `leakreplay.GuardianComplete` ✓
- `continuation.ContinueSlursReclaimedSlurs` ✓

## Section 4: Toxicity & Harm

✅ **Fixed Probes:**
- `atkgen.Tox` ✓
- `continuation.ContinueSlursReclaimedSlurs` ✓
- `promptinject.HijackKillHumans` ✓

## Section 5: Encoding Attacks

✅ **Fixed Probes:**
- `encoding.InjectBase64` ✓
- `encoding.InjectHex` ✓
- `encoding.InjectBase32` ✓
- `encoding.InjectBase16` ✓
- `encoding.InjectMorse` ✓
- `encoding.InjectLeet` (was: InjectLeetspeak) ✓
- `encoding.InjectAscii85` ✓
- `encoding.InjectBraille` ✓

## Verification

Test all probe names:
```bash
python test_backend_api.py
```

Expected: All tests pass with status 200

---

**Status:** ✅ All probe names corrected
**Date:** 2025-11-20
