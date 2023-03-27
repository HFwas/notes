### saveimage使用说明

该脚本用于将指定harbor的镜像批量保存到本地tar文件，需要事先知道harbor的IP地址，需要在image.txt文件中写上需要保存的镜像tag名称，tag名称必须带仓库名及版本号，例如：k8s-deploy/alpine:latest 不要有多余的行存在
执行方法：./saveimage.sh 源Harbor
例如：./saveimage.sh registry.cn-hangzhou.aliyuncs.com qaz74100  brouce597
