#!/usr/bin/env python3
"""
Fix duplicate GenericEnhancedReportingMixin in probe files
"""

import os
import re

PROBES_DIR = "/Users/innox/projects/garak/aegis/backend/garak/garak/probes"

def fix_duplicates(filepath):
    """Remove duplicate GenericEnhancedReportingMixin from class definitions"""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    original_content = content

    # Pattern to find duplicate mixins
    # Match: GenericEnhancedReportingMixin, GenericEnhancedReportingMixin
    pattern = r'GenericEnhancedReportingMixin,\s*GenericEnhancedReportingMixin'
    replacement = 'GenericEnhancedReportingMixin'

    content = re.sub(pattern, replacement, content)

    if content != original_content:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)
        return True
    return False

def main():
    print("Fixing duplicate GenericEnhancedReportingMixin...")

    fixed_count = 0
    for filename in os.listdir(PROBES_DIR):
        if filename.endswith('.py'):
            filepath = os.path.join(PROBES_DIR, filename)
            if fix_duplicates(filepath):
                print(f"  ✅ Fixed {filename}")
                fixed_count += 1

    print(f"\n✅ Fixed {fixed_count} files")

if __name__ == "__main__":
    main()
