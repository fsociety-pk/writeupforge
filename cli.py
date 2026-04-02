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
    
    # Import and run
    from run import run
    run()


if __name__ == "__main__":
    main()
