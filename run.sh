#!/bin/sh
#
# run.sh <local user>
# run as background process if attaching remotely using VSC or similar tool
#
docker run -it --user devuser -v "/Users/$1/Documents/vmshare":/vmshare -w /vmshare almalinux-dev /bin/zsh

