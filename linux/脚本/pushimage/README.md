### pushimage使用说明

该脚本用于将本地镜像批量上传到指定harbor，需要事先知道harbor的IP地址，需要将镜像tar文件放置在images文件夹下，并且镜像tag必须带仓库名（也可以带IP），例如k8s-deploy/alpine:latest或者10.1.10.89/k8s-deploy/alpine:latest 
执行方法：./pushimage.sh 目标Harbor, 可重新定义namespace
例如：./pushimage.sh 10.1.11.19 service-mesh
