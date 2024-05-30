#! /bin/bash
# To make snapshots of a running container issue the following command:
# docker commit <docker ID from docker PS command> <new name>
# then either change the name of the image here or remove old image & re-tag 
# docker image im <old name>
# docker tag <new name> <old name>
# docker rmi <new name>
# 
docker build --rm -f Dockerfile -t almalinux-dev .
