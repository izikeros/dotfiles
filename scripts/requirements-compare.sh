#!/usr/bin/env bash

cat requirements.txt requirements/* | sort -i > /tmp/req_specified.txt
pip-top-level > /tmp/req_installed.txt
meld /tmp/req_specified.txt /tmp/req_installed.txt