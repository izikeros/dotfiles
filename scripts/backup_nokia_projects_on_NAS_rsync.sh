#!/usr/bin/env bash

# Rsync options used
# -a archive mode (preserve attributes)
# -v verbose
# -z compress
# -h Output numbers in a more human-readable format.
# -m (prune-empty-dirs) This option tells the receiving rsync to get rid of
#	 empty directories from the file-list, including nested directories that
#    have no non-directory children.  This is useful for avoiding the creation
#    of a bunch of useless directories when the sending rsync is recursively
#    scanning a hierarchy of files using include/exclude/filter rules.
# -P progress (note that progress info after each )

# projects/nokia
rsync -avzhm --delete --exclude={\
'prolog/data/*',\
'aipa-is-boam/app/models_v1/*',\
'batman-experiments/experiments/1/data/*',\
'batman-experiments/experiments/ex7/models/*',\
'clogster/clogster/*.txt',\
'pci-nboam/data/*',\
'clogster/clogster/*.txt',\
'pci-nboam/experiments/pipeline_tf/data/test_pci/*',\
'*/.tox/',\
'*/.eggs/',\
'*/*.egg-info/',\
'*/.pytest_cache/',\
'*/__pycache__/'\
} /home/safjan/projects/nokia /mnt/NAS/projects




