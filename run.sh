#!/bin/sh
#
# run.sh <local user>
# run as background process if attaching remotely using VSC or similar tool
# Port 8888 support Jupyter notebook
# Tested under new Apple Container Framework (Docker and Container commands below)
#
#docker run -p 8888:8888 -it --rm --user devuser -v "/Users/$1/Documents/vmshare":/vmshare -w /vmshare almalinux-dev /bin/zsh
container run -p 8888:8888 -it --rm --user devuser -v "/Users/$1/Documents/vmshare":/vmshare -w /vmshare --name alma10cont alma10machine /bin/zsh

