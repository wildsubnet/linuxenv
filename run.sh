#!/bin/sh
#
# run.sh <local user>
# run as background process if attaching remotely using VSC or similar tool
# Port 8888 support Jupyter notebook
#
docker run -p 8888:8888 -it --user devuser -v "/Users/$1/Documents/vmshare":/vmshare -w /vmshare almalinux-dev /bin/zsh

