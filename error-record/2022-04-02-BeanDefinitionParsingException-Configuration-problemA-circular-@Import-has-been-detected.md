# BeanDefinitionParsingException: Configuration problem: A circular @Import has been detected

# 报错摘要：

```java
org.springframework.beans.factory.parsing.BeanDefinitionParsingException: Configuration problem: A circular @Import has been detected: Illegal attempt by @Configuration class 'SlbAutoConfig' to import class 'SlbAutoConfig' as 'SlbAutoConfig' is already present in the current import stack [SlbAutoConfig->SlbAutoConfig->GatewayApplication]
Offending resource: class path resource [com/slb/gateway/SlbAutoConfig.class]
```

报错详细信息：

```java
org.springframework.beans.factory.parsing.BeanDefinitionParsingException: Configuration problem: A circular @Import has been detected: Illegal attempt by @Configuration class 'SlbAutoConfig' to import class 'SlbAutoConfig' as 'SlbAutoConfig' is already present in the current import stack [SlbAutoConfig->SlbAutoConfig->GatewayApplication]
Offending resource: class path resource [com/slb/gateway/SlbAutoConfig.class]
	at org.springframework.beans.factory.parsing.FailFastProblemReporter.error(FailFastProblemReporter.java:72)
	at org.springframework.context.annotation.ConfigurationClassParser.processImports(ConfigurationClassParser.java:562)
	at org.springframework.context.annotation.ConfigurationClassParser.doProcessConfigurationClass(ConfigurationClassParser.java:311)
	at org.springframework.context.annotation.ConfigurationClassParser.processConfigurationClass(ConfigurationClassParser.java:250)
	at org.springframework.context.annotation.ConfigurationClassParser.processImports(ConfigurationClassParser.java:600)
	at org.springframework.context.annotation.ConfigurationClassParser.access$800(ConfigurationClassParser.java:111)
	at org.springframework.context.annotation.ConfigurationClassParser$DeferredImportSelectorGroupingHandler.lambda$processGroupImports$1(ConfigurationClassParser.java:812)
	at java.util.ArrayList.forEach(ArrayList.java:1257)
	at org.springframework.context.annotation.ConfigurationClassParser$DeferredImportSelectorGroupingHandler.processGroupImports(ConfigurationClassParser.java:809)
	at org.springframework.context.annotation.ConfigurationClassParser$DeferredImportSelectorHandler.handle(ConfigurationClassParser.java:765)
	at org.springframework.context.annotation.ConfigurationClassParser.processImports(ConfigurationClassParser.java:578)
	at org.springframework.context.annotation.ConfigurationClassParser.doProcessConfigurationClass(ConfigurationClassParser.java:311)
	at org.springframework.context.annotation.ConfigurationClassParser.processConfigurationClass(ConfigurationClassParser.java:250)
	at org.springframework.context.annotation.ConfigurationClassParser.processImports(ConfigurationClassParser.java:600)
	at org.springframework.context.annotation.ConfigurationClassParser.access$800(ConfigurationClassParser.java:111)
	at org.springframework.context.annotation.ConfigurationClassParser$DeferredImportSelectorGroupingHandler.lambda$processGroupImports$1(ConfigurationClassParser.java:812)
	at java.util.ArrayList.forEach(ArrayList.java:1257)
	at org.springframework.context.annotation.ConfigurationClassParser$DeferredImportSelectorGroupingHandler.processGroupImports(ConfigurationClassParser.java:809)
	at org.springframework.context.annotation.ConfigurationClassParser$DeferredImportSelectorHandler.process(ConfigurationClassParser.java:780)
	at org.springframework.context.annotation.ConfigurationClassParser.parse(ConfigurationClassParser.java:193)
	at org.springframework.context.annotation.ConfigurationClassPostProcessor.processConfigBeanDefinitions(ConfigurationClassPostProcessor.java:336)
	at org.springframework.context.annotation.ConfigurationClassPostProcessor.postProcessBeanDefinitionRegistry(ConfigurationClassPostProcessor.java:252)
	at org.springframework.context.support.PostProcessorRegistrationDelegate.invokeBeanDefinitionRegistryPostProcessors(PostProcessorRegistrationDelegate.java:285)
	at org.springframework.context.support.PostProcessorRegistrationDelegate.invokeBeanFactoryPostProcessors(PostProcessorRegistrationDelegate.java:99)
	at org.springframework.context.support.AbstractApplicationContext.invokeBeanFactoryPostProcessors(AbstractApplicationContext.java:751)
	at org.springframework.context.support.AbstractApplicationContext.refresh(AbstractApplicationContext.java:569)
	at org.springframework.boot.web.reactive.context.ReactiveWebServerApplicationContext.refresh(ReactiveWebServerApplicationContext.java:63)
	at org.springframework.boot.SpringApplication.refresh(SpringApplication.java:767)
	at org.springframework.boot.SpringApplication.refresh(SpringApplication.java:759)
	at org.springframework.boot.SpringApplication.refreshContext(SpringApplication.java:426)
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:326)
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:1309)
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:1298)
	at cn.harmonycloud.gateway.GatewayApplication.main(GatewayApplication.java:17)
```

# 报错原因：

- 插件项目当中自动配置类加了一个`@Configuration`注解，
- 在`META-INF/spring.factories`文件当中也加了一个配置。如下所示：

```java
org.springframework.boot.autoconfigure.EnableAutoConfiguration= \
  com.slb.gateway.SlbAutoConfig
```

- 两个冲突了导致了这个报错

# 报错解决：

- 将插件项目当中的自动配置类上的注解`@Configuration`移除

# 解决