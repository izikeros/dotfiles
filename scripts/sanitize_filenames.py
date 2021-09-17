#!/usr/bin/env python
import argparse
import os
import re

import unidecode


def remove_accents(accented_string: str):
    """Replace accented characters with their unaccented counterparts.

    Args:
        accented_string:

    Returns:

    """
    unaccented_string = unidecode.unidecode(accented_string)
    return unaccented_string


def sanitize_file(accented_filename: str, verbose: bool):
    filename = remove_accents(accented_filename)
    filename = filename.replace(" ", "_")
    filename = re.sub(r"[^\w\.-]+", "", filename)
    if accented_filename != filename:
        try:
            os.rename(accented_filename, filename)
            if verbose:
                print(f'{accented_filename} -> {filename}')
        except Exception as ex:
            print(ex)


def sanitize_target(target=None, recursive=False, verbose=False):
    # rename file or directory provided
    if target and (os.path.isdir(target) or os.path.isfile(target)):
        sanitize_file(target, verbose)

    # if not provided, process all files and dirs in current dir
    if target is None:
        target = os.getcwd()

    if os.path.isdir(target):
        for accented_filename in os.listdir():
            if os.path.isdir(accented_filename) and recursive:
                sanitize_target(accented_filename, recursive=recursive, verbose=verbose)
            else:
                sanitize_file(accented_filename, verbose)
    else:
        raise FileNotFoundError(f"File or directory: {target} not exists.")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Make filenames sane by replacing spaces with _ and removing non-ascii characters. Without any args - process all files and dirs (non-recursively) in current directory."
    )
    # positional arguments
    parser.add_argument(
        "target",
        help="file or directory name to sanitize",
        nargs="?",
        default=None,
    )

    # named parameters
    parser.add_argument(
        "-r",
        "--recursive",
        help="recursive through subdirectories (not implemented yet)",
        type=bool,
        default=False,
    )

    parser.add_argument(
        "-v",
        "--verbose",
        help="print original and changed name",
        action='store_true'
    )

    args = parser.parse_args()
    sanitize_target(target=args.target, recursive=args.recursive, verbose=args.verbose)
