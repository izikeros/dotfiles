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

rsync -avzhm --delete /home/safjan/projects/wagabunda /mnt/NAS/projects
rsync -avzhm --delete /home/safjan/projects/archive /mnt/NAS/projects
rsync -avzhm --delete /home/safjan/projects/Dockerfiles /mnt/NAS/projects
rsync -avzhm --delete /home/safjan/projects/priv /mnt/NAS/projects
rsync -avzhm --delete /home/safjan/projects/ext /mnt/NAS/projects





