#!/bin/bash

set -euo pipefail
trap 'echo "operation is interrupted"; exit 130' INT

skip_confirm=false
if [[ "${1-}" =~ ^([Yy][Ee][Ss]|[Yy])$ ]]; then
    skip_confirm=true
fi

echo "Start disk partiton."
source ./disk_partition.sh
apt-get update 1>/dev/null
disk_to_install=$(disk_partition "$skip_confirm")
echo "Disk partiton completed."

echo "Start making install media."
source ./make_install_media.sh
$(make_install_media "$disk_to_install")
echo "Making install media completed."

echo -e "All things completed. You can now exit the rescue mode, \n\
and then poweron your original os to continue installation..."
