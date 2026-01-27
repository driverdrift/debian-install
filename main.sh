#!/bin/bash

set -euo pipefail
trap 'echo "operation is interrupted"; exit 130' INT

skip_confirm=false
if [[ "${1-}" =~ ^([Yy][Ee][Ss]|[Yy])$ ]]; then
    skip_confirm=true
fi

source ./disk_partition.sh
disk_to_format=$(disk_partition "$skip_confirm")
