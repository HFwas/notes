# docker部署es和kibana

# 前置环境

- 部署服务器环境：x86环境，
- cpu和内存分别是：2和4g

# 主要步骤

- 拉取es和kibana镜像
- docker启动es
- docker启动kibana

# 详细操作

- 拉取es镜像，执行`docker pull elasticsearch:7.4.2`



- 修改es配置，执行`echo "http.host: 0.0.0.0" >> /root/es/config/elasticsearch.yml`
- 执行授权操作，不然，执行命令`chmod -R 777 /root/es/`
- 执行`docker run --name elasticsearch -p 9200:9200 -p 9300:9300  -e  "discovery.type=single-node"  -e ES_JAVA_OPTS="-Xms128m -Xmx256m"  -v /root/es/config/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml  -v /root/es/data:/usr/share/elasticsearch/data   -v  /root/es/plugins:/usr/share/elasticsearch/plugins -d elasticsearch:7.4.2`

- 拉取kiabna镜像，执行`docker pull kibana:7.4.2`
- 启动kiban，执行`docker run --name kibana -e ELASTICSEARCH_HOSTS=http://43.143.250.182:9200 -p 5601:5601 -d kibana:7.4.2`