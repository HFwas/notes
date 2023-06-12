# 内网windows二进制安装mysql

⚠️暂时有问题

# 环境信息

- 内网机器，没有联网
- 安装mysql
- mysql二进制包安装
- windows机器

# 前置准备

- 提前下载好mysql压缩包

# 操作步骤

- 将压缩包拷贝到内网机器上。
- 解压mysql压缩包
- 进入解压文件夹下，新建my.ini文件，文件内容如下：

```
[client]
port=3306
default-character-set=utf8
[mysqld]
# 设置为自己MYSQL的安装目录
basedir=D:\mysql5.7\
# 设置为MYSQL的数据目录
datadir=D:\mysql5.7\data\
port=3306
character_set_server=utf8
```

- 在bin目录下，cmd当中打开当前文件夹，执行安装命令，执行`mysqld --initialize --console`，会生成mysql的随机密码，这个密码得保存起来。
  - 如果之前在当前文件夹下有data目录，需要先删除。不然会报错

- 执行命令`mysqld --install MYSQL`，mysql服务就安装成功了。
- 启动mysql服务，打开任务管理器，找到mysql服务，选择启动即可。
- 设置环境变量，
  - 设置ADMIN的环境变量，MYSQL_HOME 对应mysql解压的位置
  - 设置系统变量，修改PATH的值，添加%MYSQL_HOME%\bin

- 进入cmd，进入mysql，执行`mysql -uroot -p`，回车进入mysql，输入之前随机生成的mysql密码，进入数据库

- 修改数据库密码，执行`ALTER USER 'root'@'localhost' IDENTIFIED BY 'Ab123456'`，填写自己的数据库密码，Ab123456是自己设置的数据库密码。

- 重启mysql服务，执行
  - 停止服务`net stop mysql`
  - 启动服务`net start mysql`
- 