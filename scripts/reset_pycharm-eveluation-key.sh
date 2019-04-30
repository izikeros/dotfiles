#!/bin/bash

# https://www.quora.com/Is-there-a-way-to-extends-trial-period-of-Jetbrains-IDE

# evaluation key file location
PYCHARM_SETTINGS_DIR="$HOME/.PyCharm2019.1"
EVAL_FILE="PyCharm191.evaluation.key"
EVAL_KEY_FILE_FULLPATH="$PYCHARM_SETTINGS_DIR/config/eval/$EVAL_FILE"


# Remove evaluation key file
echo "Trying to remove evaluation key file"
if [ ! -f "$EVAL_KEY_FILE_FULLPATH" ]; then
	echo "Evaluation key file not found at indicated location ($EVAL_KEY_FILE_FULLPATH)."
	echo "Hint:"
	find ~/ | grep '.PyCharm'| grep "evaluation.key"
	exit 1
else
	echo "removing evaluation key: $EVAL_KEY_FILE_FULLPATH"
	rm "$EVAL_KEY_FILE_FULLPATH"
	echo "done"
fi

# Clear traces in options
# (quora was just removing options.xml file - we are cleaning other.xml file)
OPTIONS_FILE="other.xml"
OPTIONS_FILE_FULLPATH="$PYCHARM_SETTINGS_DIR/config/options/$OPTIONS_FILE"

echo "Trying to remove evaluation info from config"
if [ ! -f "$OPTIONS_FILE_FULLPATH" ]; then
	echo "options file not found at indicated location."
	echo "Hint:"
	find "$PYCHARM_SETTINGS_DIR/config/" -type f -name "*.xml" | xargs grep evlsprt
	exit 1
else
	echo "-- before:"
	grep evlsprt $OPTIONS_FILE_FULLPATH
	echo "-- removing eval info"
	sed -i.bak '/evlsprt/d' "$OPTIONS_FILE_FULLPATH"
	echo "-- after:"
	grep evlsprt $OPTIONS_FILE_FULLPATH
fi

# clear userPrefs from ~/.java dir
echo "Removing all pycharm data, rm -rf ~/.userPrefs/jetbrains/pycharm"
cd ~/.java/.userPrefs/jetbrains
rm -rf pycharm
