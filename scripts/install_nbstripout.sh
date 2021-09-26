#!/usr/bin/env bash
nbstripout --install
git config filter.nbstripout.extrakeys 'metadata.pycharm\n metadata.language_info.codemirror_mode.version\n metadata.language_info.pygments_lexer\n metadata.language_info.version'
nbstripout --status
