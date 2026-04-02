#!/usr/bin/env python3
"""
WriteupForge CLI Entry Point
This module serves as the entry point for the fgwrite and writeupforge commands.
"""

import sys
import os


def main():
    """Main entry point for the CLI"""
    # Add the current directory to path so we can import our modules
    current_dir = os.path.dirname(os.path.abspath(__file__))
    if current_dir not in sys.path:
        sys.path.insert(0, current_dir)
    
    # Check .env file permissions before running
    env_file = os.path.join(current_dir, '.env')
    if os.path.exists(env_file):
        try:
            # Try to read the .env file to check permissions
            with open(env_file, 'r') as f:
                f.read(1)
        except PermissionError:
            print("❌ Permission Error: Cannot read .env file")
            print(f"Location: {env_file}")
            print("\nFix this by running:")
            print(f"  sudo chown $(whoami):$(whoami) {env_file}")
            print(f"  sudo chmod 600 {env_file}")
            print("\nOr reinstall WriteupForge using:")
            print("  sudo bash scripts/install-linux.sh")
            sys.exit(1)
    
    try:
        # Import and run
        from run import run
        run()
    except PermissionError as e:
        if ".env" in str(e):
            print("❌ Permission Error: Cannot access .env file")
            print(f"\nFix this by running:")
            print(f"  sudo chown $(whoami):$(whoami) {env_file}")
            print(f"  sudo chmod 600 {env_file}")
            sys.exit(1)
        else:
            raise
    except Exception as e:
        print(f"Error: {str(e)}")
        sys.exit(1)


if __name__ == "__main__":
    main()
