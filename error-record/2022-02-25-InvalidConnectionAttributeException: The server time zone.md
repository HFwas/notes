# 文章标题

InvalidConnectionAttributeException: The server time zone value '�й���׼ʱ��' is unrecognized or repr

# 报错概要

```java
InvalidConnectionAttributeException: The server time zone value '�й���׼ʱ��' is unrecognized or repr
```

# 报错信息如下
```
java.sql.SQLException: The server time zone value '�й���׼ʱ��' is unrecognized or represents more than one time zone. You must configure either the server or JDBC driver (via the 'serverTimezone' configuration property) to use a more specific time zone value if you want to utilize time zone support.
	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:129)
	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:97)
	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:89)
	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:63)
	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:73)
	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:76)
	at com.mysql.cj.jdbc.ConnectionImpl.createNewIO(ConnectionImpl.java:836)
	at com.mysql.cj.jdbc.ConnectionImpl.<init>(ConnectionImpl.java:456)
	at com.mysql.cj.jdbc.ConnectionImpl.getInstance(ConnectionImpl.java:246)
	at com.mysql.cj.jdbc.NonRegisteringDriver.connect(NonRegisteringDriver.java:198)
	at com.zaxxer.hikari.util.DriverDataSource.getConnection(DriverDataSource.java:138)
	at com.zaxxer.hikari.pool.PoolBase.newConnection(PoolBase.java:358)
	at com.zaxxer.hikari.pool.PoolBase.newPoolEntry(PoolBase.java:206)
	at com.zaxxer.hikari.pool.HikariPool.createPoolEntry(HikariPool.java:477)
	at com.zaxxer.hikari.pool.HikariPool.checkFailFast(HikariPool.java:560)
	at com.zaxxer.hikari.pool.HikariPool.<init>(HikariPool.java:115)
	at com.zaxxer.hikari.HikariDataSource.getConnection(HikariDataSource.java:112)
	at org.springframework.jdbc.datasource.DataSourceUtils.fetchConnection(DataSourceUtils.java:158)
	at org.springframework.jdbc.datasource.DataSourceUtils.doGetConnection(DataSourceUtils.java:116)
	at org.springframework.jdbc.datasource.DataSourceUtils.getConnection(DataSourceUtils.java:79)
	at org.springframework.jdbc.core.JdbcTemplate.execute(JdbcTemplate.java:330)
	at org.springframework.boot.actuate.jdbc.DataSourceHealthIndicator.getProduct(DataSourceHealthIndicator.java:122)
	at org.springframework.boot.actuate.jdbc.DataSourceHealthIndicator.doDataSourceHealthCheck(DataSourceHealthIndicator.java:105)
	at org.springframework.boot.actuate.jdbc.DataSourceHealthIndicator.doHealthCheck(DataSourceHealthIndicator.java:100)
	at org.springframework.boot.actuate.health.AbstractHealthIndicator.health(AbstractHealthIndicator.java:82)
	at org.springframework.boot.actuate.health.HealthIndicator.getHealth(HealthIndicator.java:37)
	at org.springframework.boot.actuate.health.HealthEndpoint.getHealth(HealthEndpoint.java:71)
	at org.springframework.boot.actuate.health.HealthEndpoint.getHealth(HealthEndpoint.java:39)
	at org.springframework.boot.actuate.health.HealthEndpointSupport.getContribution(HealthEndpointSupport.java:99)
	at org.springframework.boot.actuate.health.HealthEndpointSupport.getAggregateHealth(HealthEndpointSupport.java:110)
	at org.springframework.boot.actuate.health.HealthEndpointSupport.getContribution(HealthEndpointSupport.java:96)
	at org.springframework.boot.actuate.health.HealthEndpointSupport.getHealth(HealthEndpointSupport.java:74)
	at org.springframework.boot.actuate.health.HealthEndpointSupport.getHealth(HealthEndpointSupport.java:61)
	at org.springframework.boot.actuate.health.HealthEndpoint.health(HealthEndpoint.java:65)
	at org.springframework.boot.actuate.health.HealthEndpoint.health(HealthEndpoint.java:55)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at org.springframework.util.ReflectionUtils.invokeMethod(ReflectionUtils.java:282)
	at org.springframework.boot.actuate.endpoint.invoke.reflect.ReflectiveOperationInvoker.invoke(ReflectiveOperationInvoker.java:77)
	at org.springframework.boot.actuate.endpoint.annotation.AbstractDiscoveredOperation.invoke(AbstractDiscoveredOperation.java:60)
	at org.springframework.boot.actuate.endpoint.jmx.EndpointMBean.invoke(EndpointMBean.java:121)
	at org.springframework.boot.actuate.endpoint.jmx.EndpointMBean.invoke(EndpointMBean.java:96)
	at com.sun.jmx.interceptor.DefaultMBeanServerInterceptor.invoke(DefaultMBeanServerInterceptor.java:819)
	at com.sun.jmx.mbeanserver.JmxMBeanServer.invoke(JmxMBeanServer.java:801)
	at javax.management.remote.rmi.RMIConnectionImpl.doOperation(RMIConnectionImpl.java:1468)
	at javax.management.remote.rmi.RMIConnectionImpl.access$300(RMIConnectionImpl.java:76)
	at javax.management.remote.rmi.RMIConnectionImpl$PrivilegedOperation.run(RMIConnectionImpl.java:1309)
	at javax.management.remote.rmi.RMIConnectionImpl.doPrivilegedOperation(RMIConnectionImpl.java:1401)
	at javax.management.remote.rmi.RMIConnectionImpl.invoke(RMIConnectionImpl.java:829)
	at sun.reflect.GeneratedMethodAccessor82.invoke(Unknown Source)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at sun.rmi.server.UnicastServerRef.dispatch(UnicastServerRef.java:357)
	at sun.rmi.transport.Transport$1.run(Transport.java:200)
	at sun.rmi.transport.Transport$1.run(Transport.java:197)
	at java.security.AccessController.doPrivileged(Native Method)
	at sun.rmi.transport.Transport.serviceCall(Transport.java:196)
	at sun.rmi.transport.tcp.TCPTransport.handleMessages(TCPTransport.java:573)
	at sun.rmi.transport.tcp.TCPTransport$ConnectionHandler.run0(TCPTransport.java:834)
	at sun.rmi.transport.tcp.TCPTransport$ConnectionHandler.lambda$run$0(TCPTransport.java:688)
	at java.security.AccessController.doPrivileged(Native Method)
	at sun.rmi.transport.tcp.TCPTransport$ConnectionHandler.run(TCPTransport.java:687)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
	at java.lang.Thread.run(Thread.java:748)
Caused by: com.mysql.cj.exceptions.InvalidConnectionAttributeException: The server time zone value '�й���׼ʱ��' is unrecognized or represents more than one time zone. You must configure either the server or JDBC driver (via the 'serverTimezone' configuration property) to use a more specific time zone value if you want to utilize time zone support.
	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)
	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
	at java.lang.reflect.Constructor.newInstance(Constructor.java:423)
	at com.mysql.cj.exceptions.ExceptionFactory.createException(ExceptionFactory.java:61)
	at com.mysql.cj.exceptions.ExceptionFactory.createException(ExceptionFactory.java:85)
	at com.mysql.cj.util.TimeUtil.getCanonicalTimezone(TimeUtil.java:134)
	at com.mysql.cj.protocol.a.NativeProtocol.configureTimezone(NativeProtocol.java:2186)
	at com.mysql.cj.protocol.a.NativeProtocol.initServerSession(NativeProtocol.java:2209)
	at com.mysql.cj.jdbc.ConnectionImpl.initializePropsFromServer(ConnectionImpl.java:1318)
	at com.mysql.cj.jdbc.ConnectionImpl.connectOneTryOnly(ConnectionImpl.java:967)
	at com.mysql.cj.jdbc.ConnectionImpl.createNewIO(ConnectionImpl.java:826)
	... 60 common frames omitted

2022-02-25 10:39:58.928  WARN 7036 --- [(5)-192.168.3.1] o.s.b.a.jdbc.DataSourceHealthIndicator   : DataSource health check failed

org.springframework.jdbc.CannotGetJdbcConnectionException: Failed to obtain JDBC Connection; nested exception is java.sql.SQLException: The server time zone value '�й���׼ʱ��' is unrecognized or represents more than one time zone. You must configure either the server or JDBC driver (via the 'serverTimezone' configuration property) to use a more specific time zone value if you want to utilize time zone support.
	at org.springframework.jdbc.datasource.DataSourceUtils.getConnection(DataSourceUtils.java:82)
	at org.springframework.jdbc.core.JdbcTemplate.execute(JdbcTemplate.java:330)
	at org.springframework.boot.actuate.jdbc.DataSourceHealthIndicator.getProduct(DataSourceHealthIndicator.java:122)
	at org.springframework.boot.actuate.jdbc.DataSourceHealthIndicator.doDataSourceHealthCheck(DataSourceHealthIndicator.java:105)
	at org.springframework.boot.actuate.jdbc.DataSourceHealthIndicator.doHealthCheck(DataSourceHealthIndicator.java:100)
	at org.springframework.boot.actuate.health.AbstractHealthIndicator.health(AbstractHealthIndicator.java:82)
	at org.springframework.boot.actuate.health.HealthIndicator.getHealth(HealthIndicator.java:37)
	at org.springframework.boot.actuate.health.HealthEndpoint.getHealth(HealthEndpoint.java:71)
	at org.springframework.boot.actuate.health.HealthEndpoint.getHealth(HealthEndpoint.java:39)
	at org.springframework.boot.actuate.health.HealthEndpointSupport.getContribution(HealthEndpointSupport.java:99)
	at org.springframework.boot.actuate.health.HealthEndpointSupport.getAggregateHealth(HealthEndpointSupport.java:110)
	at org.springframework.boot.actuate.health.HealthEndpointSupport.getContribution(HealthEndpointSupport.java:96)
	at org.springframework.boot.actuate.health.HealthEndpointSupport.getHealth(HealthEndpointSupport.java:74)
	at org.springframework.boot.actuate.health.HealthEndpointSupport.getHealth(HealthEndpointSupport.java:61)
	at org.springframework.boot.actuate.health.HealthEndpoint.health(HealthEndpoint.java:65)
	at org.springframework.boot.actuate.health.HealthEndpoint.health(HealthEndpoint.java:55)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at org.springframework.util.ReflectionUtils.invokeMethod(ReflectionUtils.java:282)
	at org.springframework.boot.actuate.endpoint.invoke.reflect.ReflectiveOperationInvoker.invoke(ReflectiveOperationInvoker.java:77)
	at org.springframework.boot.actuate.endpoint.annotation.AbstractDiscoveredOperation.invoke(AbstractDiscoveredOperation.java:60)
	at org.springframework.boot.actuate.endpoint.jmx.EndpointMBean.invoke(EndpointMBean.java:121)
	at org.springframework.boot.actuate.endpoint.jmx.EndpointMBean.invoke(EndpointMBean.java:96)
	at com.sun.jmx.interceptor.DefaultMBeanServerInterceptor.invoke(DefaultMBeanServerInterceptor.java:819)
	at com.sun.jmx.mbeanserver.JmxMBeanServer.invoke(JmxMBeanServer.java:801)
	at javax.management.remote.rmi.RMIConnectionImpl.doOperation(RMIConnectionImpl.java:1468)
	at javax.management.remote.rmi.RMIConnectionImpl.access$300(RMIConnectionImpl.java:76)
	at javax.management.remote.rmi.RMIConnectionImpl$PrivilegedOperation.run(RMIConnectionImpl.java:1309)
	at javax.management.remote.rmi.RMIConnectionImpl.doPrivilegedOperation(RMIConnectionImpl.java:1401)
	at javax.management.remote.rmi.RMIConnectionImpl.invoke(RMIConnectionImpl.java:829)
	at sun.reflect.GeneratedMethodAccessor82.invoke(Unknown Source)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at sun.rmi.server.UnicastServerRef.dispatch(UnicastServerRef.java:357)
	at sun.rmi.transport.Transport$1.run(Transport.java:200)
	at sun.rmi.transport.Transport$1.run(Transport.java:197)
	at java.security.AccessController.doPrivileged(Native Method)
	at sun.rmi.transport.Transport.serviceCall(Transport.java:196)
	at sun.rmi.transport.tcp.TCPTransport.handleMessages(TCPTransport.java:573)
	at sun.rmi.transport.tcp.TCPTransport$ConnectionHandler.run0(TCPTransport.java:834)
	at sun.rmi.transport.tcp.TCPTransport$ConnectionHandler.lambda$run$0(TCPTransport.java:688)
	at java.security.AccessController.doPrivileged(Native Method)
	at sun.rmi.transport.tcp.TCPTransport$ConnectionHandler.run(TCPTransport.java:687)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
	at java.lang.Thread.run(Thread.java:748)
Caused by: java.sql.SQLException: The server time zone value '�й���׼ʱ��' is unrecognized or represents more than one time zone. You must configure either the server or JDBC driver (via the 'serverTimezone' configuration property) to use a more specific time zone value if you want to utilize time zone support.
	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:129)
	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:97)
	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:89)
	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:63)
	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:73)
	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:76)
	at com.mysql.cj.jdbc.ConnectionImpl.createNewIO(ConnectionImpl.java:836)
	at com.mysql.cj.jdbc.ConnectionImpl.<init>(ConnectionImpl.java:456)
	at com.mysql.cj.jdbc.ConnectionImpl.getInstance(ConnectionImpl.java:246)
	at com.mysql.cj.jdbc.NonRegisteringDriver.connect(NonRegisteringDriver.java:198)
	at com.zaxxer.hikari.util.DriverDataSource.getConnection(DriverDataSource.java:138)
	at com.zaxxer.hikari.pool.PoolBase.newConnection(PoolBase.java:358)
	at com.zaxxer.hikari.pool.PoolBase.newPoolEntry(PoolBase.java:206)
	at com.zaxxer.hikari.pool.HikariPool.createPoolEntry(HikariPool.java:477)
	at com.zaxxer.hikari.pool.HikariPool.checkFailFast(HikariPool.java:560)
	at com.zaxxer.hikari.pool.HikariPool.<init>(HikariPool.java:115)
	at com.zaxxer.hikari.HikariDataSource.getConnection(HikariDataSource.java:112)
	at org.springframework.jdbc.datasource.DataSourceUtils.fetchConnection(DataSourceUtils.java:158)
	at org.springframework.jdbc.datasource.DataSourceUtils.doGetConnection(DataSourceUtils.java:116)
	at org.springframework.jdbc.datasource.DataSourceUtils.getConnection(DataSourceUtils.java:79)
	... 47 common frames omitted
Caused by: com.mysql.cj.exceptions.InvalidConnectionAttributeException: The server time zone value '�й���׼ʱ��' is unrecognized or represents more than one time zone. You must configure either the server or JDBC driver (via the 'serverTimezone' configuration property) to use a more specific time zone value if you want to utilize time zone support.
	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)
	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
	at java.lang.reflect.Constructor.newInstance(Constructor.java:423)
	at com.mysql.cj.exceptions.ExceptionFactory.createException(ExceptionFactory.java:61)
	at com.mysql.cj.exceptions.ExceptionFactory.createException(ExceptionFactory.java:85)
	at com.mysql.cj.util.TimeUtil.getCanonicalTimezone(TimeUtil.java:134)
	at com.mysql.cj.protocol.a.NativeProtocol.configureTimezone(NativeProtocol.java:2186)
	at com.mysql.cj.protocol.a.NativeProtocol.initServerSession(NativeProtocol.java:2209)
	at com.mysql.cj.jdbc.ConnectionImpl.initializePropsFromServer(ConnectionImpl.java:1318)
	at com.mysql.cj.jdbc.ConnectionImpl.connectOneTryOnly(ConnectionImpl.java:967)
	at com.mysql.cj.jdbc.ConnectionImpl.createNewIO(ConnectionImpl.java:826)
	... 60 common frames omitted

	
```

# 排查原因：
- 这是由于数据库和系统时区差异所造成的

# 解决问题
- url添加时区：serverTimezone=GMT
- 如果需要使用gmt+8时区，需要写成GMT%2B8，否则会被解析为空
```
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/slb_integration_platform?useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&serverTimezone=GMT
    driver-class-name: com.mysql.cj.jdbc.Driver
    username: root
    password: 123456
```

