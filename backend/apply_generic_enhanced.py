#!/usr/bin/env python3
"""
Script to automatically apply GenericEnhancedReportingMixin to all probe files
that don't already have specialized enhanced reporting.
"""

import os
import re

# Probe files that already have specialized mixins (skip these)
ALREADY_ENHANCED = {
    'dan.py',
    'encoding.py',
    'malwaregen.py',
    'promptinject.py',
    'smuggling.py',
    'snowball.py',
    # Skip these special files
    '__init__.py',
    'base.py',
    '_enhanced_reporting.py'
}

PROBES_DIR = "/Users/innox/projects/garak/aegis/backend/garak/garak/probes"

def already_has_enhanced_reporting(filepath):
    """Check if file already imports any enhanced reporting mixin"""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
        return 'ReportingMixin' in content

def get_probe_classes(content):
    """Extract all Probe class definitions from file content"""
    # Match class definitions that inherit from Probe
    pattern = r'class\s+(\w+)\([^)]*\bgarak\.probes\.Probe\b[^)]*\):'
    matches = re.findall(pattern, content)
    return matches

def apply_generic_mixin(filepath):
    """Add GenericEnhancedReportingMixin to all Probe classes in file"""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Check if already has enhanced reporting
    if already_has_enhanced_reporting(filepath):
        return False, "Already has enhanced reporting"

    # Find probe classes
    probe_classes = get_probe_classes(content)
    if not probe_classes:
        return False, "No Probe classes found"

    # Add import if not present
    if 'from garak.probes._enhanced_reporting import GenericEnhancedReportingMixin' not in content:
        # Find where to insert import (after other garak imports)
        import_pattern = r'(import garak\.probes.*?\n)'
        match = re.search(import_pattern, content)
        if match:
            insert_pos = match.end()
            new_import = 'from garak.probes._enhanced_reporting import GenericEnhancedReportingMixin\n'
            content = content[:insert_pos] + new_import + content[insert_pos:]
        else:
            # Fallback: add after module docstring
            if '"""' in content:
                # Find end of module docstring
                parts = content.split('"""', 2)
                if len(parts) >= 3:
                    content = parts[0] + '"""' + parts[1] + '"""' + '\n\nfrom garak.probes._enhanced_reporting import GenericEnhancedReportingMixin\n' + parts[2]

    # Apply mixin to each Probe class
    # Pattern: class ClassName(garak.probes.Probe):
    # Replace with: class ClassName(GenericEnhancedReportingMixin, garak.probes.Probe):
    pattern = r'class\s+(\w+)\((garak\.probes\.Probe)\):'
    replacement = r'class \1(GenericEnhancedReportingMixin, \2):'
    content = re.sub(pattern, replacement, content)

    # Also handle classes that inherit from other classes that inherit from Probe
    # Pattern: class ClassName(ParentClass, garak.probes.Probe):
    # Replace with: class ClassName(GenericEnhancedReportingMixin, ParentClass, garak.probes.Probe):
    pattern2 = r'class\s+(\w+)\(([^,)]+,\s*garak\.probes\.Probe)\):'
    replacement2 = r'class \1(GenericEnhancedReportingMixin, \2):'
    content = re.sub(pattern2, replacement2, content)

    # Write back
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)

    return True, f"Applied to {len(probe_classes)} classes: {', '.join(probe_classes)}"

def main():
    print("=" * 80)
    print("Applying GenericEnhancedReportingMixin to all probe files")
    print("=" * 80)

    # Get all probe files
    probe_files = []
    for filename in os.listdir(PROBES_DIR):
        if filename.endswith('.py') and filename not in ALREADY_ENHANCED:
            filepath = os.path.join(PROBES_DIR, filename)
            probe_files.append((filename, filepath))

    print(f"\nFound {len(probe_files)} probe files to process")
    print(f"Skipping {len(ALREADY_ENHANCED)} files that already have specialized mixins")

    successful = 0
    skipped = 0
    errors = 0

    print("\nProcessing files:")
    print("-" * 80)

    for filename, filepath in sorted(probe_files):
        try:
            applied, message = apply_generic_mixin(filepath)
            if applied:
                print(f"✅ {filename:30} - {message}")
                successful += 1
            else:
                print(f"⏭️  {filename:30} - {message}")
                skipped += 1
        except Exception as e:
            print(f"❌ {filename:30} - ERROR: {str(e)}")
            errors += 1

    print("-" * 80)
    print(f"\nResults:")
    print(f"  ✅ Successfully enhanced: {successful}")
    print(f"  ⏭️  Skipped: {skipped}")
    print(f"  ❌ Errors: {errors}")
    print(f"  📊 Total processed: {len(probe_files)}")

    if successful > 0:
        print("\n✅ SUCCESS! GenericEnhancedReportingMixin applied to all remaining probes")
    else:
        print("\n⚠️  No files were modified")

if __name__ == "__main__":
    main()
