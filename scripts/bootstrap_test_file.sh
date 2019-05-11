#!/bin/bash
echo $(pwd)
grep 'def' $1 | sed 's/def //' | sed -e 's/(.*//' | sed 's/^/def test_/' | awk '$0=$0"():"' >> ./tests/test_$1

