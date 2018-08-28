#!/bin/bash

# https://www.quora.com/Is-there-a-way-to-extends-trial-period-of-Jetbrains-IDE

# evaluation key file location
PYCHARM_SETTINGS_DIR="$HOME/.PyCharm2018.1"
EVAL_FILE="PyCharm181.evaluation.key"
OPTIONS_FILE="options.xml"

EVAL_KEY_FILE_FULLPATH="$PYCHARM_SETTINGS_DIR/config/eval/$EVAL_FILE"
OPTIONS_FILE_FULLPATH="$PYCHARM_SETTINGS_DIR/config/options/$OPTIONS_FILE"

# Remove evaluation key file
if [ ! -f "$EVAL_KEY_FILE" ]; then
	echo "Evaluation key file not found at indicated location."
	echo "Hint:"
	find ~/ | grep '.PyCharm'| grep "evaluation.key"
	exit 1
else
	echo "removing evaluation key"
	rm "$EVAL_KEY_FILE_FULLPATH"
	echo "done"
	exit 0
fi

# Clear traces in options file
sed -i.bak '/evlsprt/d' "$OPTIONS_FILE_FULLPATH"

