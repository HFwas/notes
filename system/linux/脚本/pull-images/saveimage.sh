#!/bin/bash

HARBOR_FROM=$1
USER_NAME=$3
HARBOR_PASSWORD=$2

docker login $HARBOR_FROM --username $USER_NAME --password $HARBOR_PASSWORD

NUMBER=`awk 'END{print NR}' image.txt`
echo -e "\033[36m镜像数量$NUMBER个\033[0m"

for ((i=1; i<=$NUMBER; i++));
do
  imageTag=`awk -v val=$i 'NR==val{print}' image.txt`
  echo -e "\033[36m第$i个镜像 镜像tag名称:$imageTag\033[0m"

  imageName=${imageTag#*/}

  saveName=`echo ${imageName/:/-}`

  echo -e "\033[36m拉取镜像$HARBOR_FROM/$imageTag\033[0m"
  docker pull $HARBOR_FROM/$imageTag

  echo -e "\033[36m保存镜像$HARBOR_FROM/$imageTag为$saveName.tar\033[0m"
  docker save -o $saveName.tar $HARBOR_FROM/$imageTag

  echo -e "\033[36m清除本地镜像$HARBOR_FROM/$imageTag\033[0m"
  docker rmi $HARBOR_FROM/$imageTag

done
