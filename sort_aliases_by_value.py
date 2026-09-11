#!/data/data/com.termux/files/home/.local/bin/python
from __future__ import annotations

import re
import sys
from pathlib import Path


def parse_aliases(filepath: Path) -> list[tuple[str, str, str]]:
    aliases = []
    try:
        with open(filepath, encoding="utf-8") as f:
            content = f.read()

        pattern = re.compile(r"^\s*alias\s+([a-zA-Z_][a-zA-Z0-9_-]*)\s*=\s*(.+?)\s*$", re.MULTILINE)
        for match in pattern.finditer(content):
            name = match.group(1)
            value = match.group(2).strip()

            if (value.startswith('"') and value.endswith('"')) or (value.startswith("'") and value.endswith("'")):
                value = value[1:-1]

            aliases.append((name, value, match.group(0)))

    except FileNotFoundError:
        print(f"Error: Aliases file not found: {filepath}")
        sys.exit(1)
    except Exception as e:
        print(f"Error reading file: {e}")
        sys.exit(1)

    return aliases


def write_sorted_aliases(aliases: list[tuple[str, str, str]], filepath: Path, create_backup: bool = True) -> None:
    sorted_aliases = sorted(aliases, key=lambda x: x[1])

    if create_backup:
        backup_path = filepath.with_suffix(filepath.suffix + ".backup")
        try:
            from shutil import copy2

            copy2(filepath, backup_path)
            print(f"✓ Backup created: {backup_path}")
        except Exception as e:
            print(f"⚠ Warning: Could not create backup: {e}")

    try:
        with open(filepath, "w", encoding="utf-8") as f:
            f.writelines(raw_line + "\n" for _name, _value, raw_line in sorted_aliases)
        print(f"✓ Sorted {len(sorted_aliases)} aliases by value")
        print(f"✓ Output written to: {filepath}")
    except Exception as e:
        print(f"Error writing file: {e}")
        sys.exit(1)


def display_aliases(aliases: list[tuple[str, str, str]], limit: int | None = None) -> None:
    if not aliases:
        print("No aliases found")
        return

    sorted_aliases = sorted(aliases, key=lambda x: x[1])
    if limit:
        sorted_aliases = sorted_aliases[:limit]

    max_name_len = max(len(name) for name, _, _ in sorted_aliases)
    max_value_len = max(len(value) for _, value, _ in sorted_aliases)
    max_value_len = min(max_value_len, 60)

    print(f"\n{'ALIAS':<{max_name_len}}  {'VALUE':<{max_value_len}}")
    print("-" * (max_name_len + max_value_len + 2))

    for name, value, _ in sorted_aliases:
        if len(value) > 60:
            value = value[:57] + "…"
        print(f"{name:<{max_name_len}}  {value:<{max_value_len}}")


def main() -> None:
    import argparse

    parser = argparse.ArgumentParser(description="Sort bash aliases by value with optional dry-run preview")
    parser.add_argument(
        "filepath",
        nargs="?",
        default=Path.home() / ".config/bash.d/bash_aliases",
        type=Path,
        help="Path to aliases file (default: ~/.config/bash.d/bash_aliases)",
    )
    parser.add_argument(
        "-a",
        "--apply",
        action="store_true",
        help="Apply changes to file (default: dry-run preview only)",
    )

    args = parser.parse_args()
    aliases_file = args.filepath

    print(f"Reading aliases from: {aliases_file}")
    print("-" * 50)

    aliases = parse_aliases(aliases_file)

    if not aliases:
        print("No aliases found in file")
        sys.exit(0)

    print(f"Found {len(aliases)} alias(es)")
    print("\n--- SORTED BY VALUE (first 10 shown) ---")
    display_aliases(aliases, limit=10)
    print("\n" + "-" * 50)

    if args.apply:
        response = input(f"⚠ Apply changes to {len(aliases)} aliases? [y/N]: ").strip().lower()
        if response != "y":
            print("Operation cancelled")
            sys.exit(0)
        write_sorted_aliases(aliases, aliases_file, create_backup=True)
        print("✓ Changes applied successfully!")
    else:
        print("(Dry-run mode: no changes made)")
        print(f"Run with -a/--apply flag to write changes to {aliases_file}")


if __name__ == "__main__":
    main()
