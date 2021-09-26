#!/usr/bin/env bash
# bootstrap-test-file.sh - creates starter with test functions in tests subdirectory for input file
# usage: bootstrap-test-file.sh foo.py

echo $(pwd)
grep 'def' $1 | sed 's/def //' | sed -e 's/(.*//' | sed 's/^/def test_/' | awk '$0=$0"():"' >> ./tests/test_$1

