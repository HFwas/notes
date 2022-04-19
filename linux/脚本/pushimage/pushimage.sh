#!/bin/bash

HARBOR_TO=$1
NAMESPACE=$2
HARBOR_PASSWORD=Harbor12345
docker login $HARBOR_TO --username admin --password $HARBOR_PASSWORD

BASEPATH=$(cd `dirname $0`; pwd)

IMAGEPATH=$BASEPATH/images/*

for tempfile in $IMAGEPATH
do
  if [ -f $filetemp ]
  then
    filename=${tempfile##*/}
    echo $filename >> image.txt
  fi
done

#$BASEPATH/catfiles.sh

NUMBER=`awk 'END{print NR}' image.txt`
echo -e "\033[36m镜像数量$NUMBER个\033[0m"

for ((i=1; i<=$NUMBER; i++));
do
  saveName=`awk -v val=$i 'NR==val{print}' image.txt`
  echo -e "\033[36m第$i个镜像 镜像名称:$saveName\033[0m"

  docker load < $BASEPATH/images/$saveName >> log.log
  tempTag=`cat log.log | awk 'END {print}'`
  imageTag=${tempTag#*: }

  tempNum=`echo "$imageTag" |tr -cd / |wc -c`
  if [ $tempNum == 2 ]
  then
    pushTag=${imageTag##*/}

    echo -e "\033[36m修改原镜像tag:$imageTag 为$HARBOR_TO/$pushTag\033[0m"
    docker tag $imageTag $HARBOR_TO/$NAMESPACE/$pushTag

    echo -e "\033[36m上传镜像$HARBOR_TO/$pushTag\033[0m"
    docker push $HARBOR_TO/$NAMESPACE/$pushTag

    echo -e "\033[36m清除本地镜像$imageTag $HARBOR_TO/$pushTag\033[0m"
    docker rmi $imageTag $HARBOR_TO/$NAMESPACE/$pushTag
  elif [ $tempNum == 1 ]
  then
    echo -e "\033[36m修改原镜像tag:$imageTag 为$HARBOR_TO/$imageTag\033[0m"
    docker tag $imageTag $HARBOR_TO/$NAMESPACE/$pushTag

    echo -e "\033[36m上传镜像$HARBOR_TO/$imageTag\033[0m"
    docker push $HARBOR_TO/$NAMESPACE/$pushTag

    echo -e "\033[36m清除本地镜像$imageTag $HARBOR_TO/$imageTag\033[0m"
    docker rmi $imageTag $HARBOR_TO/$NAMESPACE/$pushTag
  elif [ $tempNum == 0 ]
  then
    echo -e "\033[31m修镜像tag:$imageTag 不满足上传要求 无法上传\033[0m"
  fi

done
