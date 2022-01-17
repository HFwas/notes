# Spring Bean基础

- 定义Spring Bean
- BeanDefinition元信息
- 命名Spring Bean
- Spring Bean 的别名
- 注册Ѕрrіng Веаn
- 实例化Spring Bean
- 初始化 Spring Bean
- 延迟初始化 Spring Bean
- 销毁Spring Bean
- 垃圾回收 Spring Bean
- 面试题精选

# 目录

[toc]

# 定义Spring Bean

- 什么是BeanDefinition?
- BeanDefinition是Spring Framework中定义Bean的配置元信息接口，包含:
  - Bean的类名
  - Bean行为配置元素,如作用域、自动绑定的模式、生命周期回调等
  - 其他Bean引用，又可称作合作者(Collaborators) 或者依赖(Dependencies)
  - 配置设置，比如Bean属性(Properties )

# BeanDefinition元信息

| 属性                     | 说明                                         |
| ------------------------ | -------------------------------------------- |
| Class                    | Bean全类名，必须是具体类，不能用抽象类或接口 |
| Name                     | Bean的名称或者ID                             |
| Scope                    | Bean的作用域(如: singleton、 prototype 等)   |
| Constructor arguments    | Bean构造器参数(用于依赖注人)                 |
| Properties               | Bean属性设置(用于依赖注人)                   |
| Autowiring mode          | Bean自动绑定模式(如: 通过名称byName)         |
| Lazy initialization mode | Bean延迟初始化模式(延迟和非延迟)             |
| Initialization method    | Bean初始化回调方法名称                       |
| Destruction method       | Bean销毁回调方法名称                         |

## BeanDefinition构建

- 通过BeanDefinitionBuilder
- 通过AbstractBeanDefinition以及派生类

## 代码测试

- 新建项目
- 修改POM文件

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <parent>
        <artifactId>geekbang-lessons</artifactId>
        <groupId>org.example</groupId>
        <version>1.0-SNAPSHOT</version>
    </parent>
    <modelVersion>4.0.0</modelVersion>

    <artifactId>spring-bean</artifactId>

    <properties>
        <maven.compiler.source>8</maven.compiler.source>
        <maven.compiler.target>8</maven.compiler.target>
    </properties>

    <dependencies>
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-context</artifactId>
            <version>5.2.2.RELEASE</version>
        </dependency>
        <dependency>
            <groupId>org.example</groupId>
            <artifactId>ioc-container-overview</artifactId>
            <version>1.0-SNAPSHOT</version>
        </dependency>
    </dependencies>

</project>
```

- 测试代码

```java
package com.hfwas.in.spring.bean.definition;

import com.hfwas.in.spring.domain.User;
import org.springframework.beans.MutablePropertyValues;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.beans.factory.support.AbstractBeanDefinition;
import org.springframework.beans.factory.support.BeanDefinitionBuilder;
import org.springframework.beans.factory.support.GenericBeanDefinition;

/**
 * @ClassName BeanDefinitionCreationDemo
 * @Description
 * {@link org.springframework.beans.factory.config.BeanDefinition} 构建示例
 * @Author <a href="hfwas1024@gmail.com">HFwas</a>
 * @Date: 11:39 下午
 * @Version: 1.0
 **/
public class BeanDefinitionCreationDemo {

    public static void main(String[] args) {
        // 1. 通过BeanDefinitionBuilder 构建
        BeanDefinitionBuilder beanDefinitionBuilder = BeanDefinitionBuilder.genericBeanDefinition(User.class);
        // 通过属性设置
        beanDefinitionBuilder
                .addPropertyValue("id", 12L)
                .addPropertyValue("name", "hfwas");
        // 获取 BeanDefinition 实例
        BeanDefinition beanDefinition = beanDefinitionBuilder.getBeanDefinition();
        // BeanDefinition 并非 bean 终态， 可以自定义修改

        // 2. 通过 AbstractBeanDefinition 以及派生类
        GenericBeanDefinition genericBeanDefinition = new GenericBeanDefinition();
        // 设置 bean 类型
        genericBeanDefinition.setBeanClass(User.class);
        // 通过 MutablePropertyValues 批量操作属性
        MutablePropertyValues propertyValues = new MutablePropertyValues();
//        propertyValues.addPropertyValue("id", 111L);
//        propertyValues.addPropertyValue("name", "hfwas");

        propertyValues.add("id", 89L).add("name", "hfwas");
        // 通过 set MutablePropertyValues 批量操作属性
       genericBeanDefinition.setPropertyValues(propertyValues);
    }
}
```

# 命名Spring Bean

- Bean的名称
  - 每个Bean拥有一个或多个标识符(identifiers) ，这些标识符在Bean所在的容器必须是唯一的。通常，一个Bean仅有一个标识符，如果需要额外的，可考虑使用别名(Alias) 来扩充。
  - 在基于XML的配置元信息中，开发人员可用id 或者name属性来规定Bean的标识符。通常Bean的标识符由字母组成，允许出现特殊字符。如果要想引入Bean的别名的话，可在name属性使用半角逗号(“,”) 或分号(“;") 来间隔。
  - Bean的id或name属性并非必须制定，如果留空的话，容器会为Bean自动生成一个唯一的名称。Bean的命名尽管没有限制，不过宫方建议采用驼峰的方式，更符合Java的命名约定。

- Bean名称生成器(BeanNameGenerator)
  - 由Spring Framework 2.0.3引入，框架內建两种实现: DefaultBeanNameGenerator:默认通用BeanNameGenerator 实现
  - AnnotationBeanNameGenerator:基于注解扫描的BeanNameGenerator实现，起始于Spring Framework 2.5，关联的官方文档:
    - With component scanning in the classpath, Spring generates bean names for unnamed components,following the rules described earlier: essentially, taking the simplet class name and turning its initial
      character to lower- -case. However, in the (unusual) special case when there is more than one character and both the first and second characters are upper case, the original casing gets preserved. T  the same rules as defined by java. beans.Introspector. decapitalize (which Spring uses here).

# Spring Bean 的别名

- Bean别名(Alias) 的价值
  - 复用现有的BeanDefinition
  - 更具有场景化的命名方法，比如:
    - <alias name="myApp-dataSource" alias="subsystemA-dataSource"/>
    - <alias name="myApp-dataSource" alias="subsystemB-dataSource' />

## 代码测试

- 配置文件

```java
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="
        http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">

    <!--导入第三方包-->
    <import resource="dependency-lookup-context.xml"/>

    <!--将Spring 容器中 "user" bean 关联/建立别名 - 'xiaomage-user' -->
    <alias name="user" alias="xiaomage-user"/>

</beans>
```

- 测试代码

```java
package com.hfwas.in.spring.bean.definition;

import com.hfwas.in.spring.domain.User;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @ClassName BeanAliasDemo
 * @Description
 * bean 别名实例
 * @Author <a href="hfwas1024@gmail.com">HFwas</a>
 * @Date: 8:52 下午
 * @Version: 1.0
 **/
public class BeanAliasDemo {

    public static void main(String[] args) {
        // 配置 xml 配置i文件
        // 启动 spring 应用上下文
        BeanFactory beanFactory = new ClassPathXmlApplicationContext("classpath:/META-INF/dependency-definition-context.xml");
        // 通过别名 xiaomage-user 获取曾用名 user 的 bean
        User user = beanFactory.getBean("user", User.class);
        User xiaomage = beanFactory.getBean("xiaomage-user", User.class);
        System.out.println(xiaomage == user);
    }
}
```

- 测试截图

![image-20220117205944244](images/image-20220117205944244.png)

# 注册Ѕрrіng Веаn

- BeanDefinition注册
  - XML配置元信息
    - <bean name="”... />
- Java注解配置元信息
  - @Bean
  - @Component
  - @Import
- Java API配置元信息
  - 命名方式:BeanDefinitionRegistry #registerBeanDefinition (String, BeanDefinition )
  - 非命名方式:BeanDefinitionReaderUtils #registerWithGeneratedName (AbstractBeanDefinition,BeafinitionRegistry)
  - 配置类方式: AnotatedBeensfiniticnRaader#register(Class..）

## 代码测试

- 配置文件

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="
        http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">

    <!--导入第三方包-->
    <import resource="dependency-lookup-context.xml"/>

    <!--将Spring 容器中 "user" bean 关联/建立别名 - 'xiaomage-user' -->
    <alias name="user" alias="xiaomage-user"/>

</beans>
```

- 测试代码

```java
package com.hfwas.in.spring.bean.definition;

import com.hfwas.in.spring.domain.User;
import org.springframework.beans.factory.support.BeanDefinitionBuilder;
import org.springframework.beans.factory.support.BeanDefinitionReaderUtils;
import org.springframework.beans.factory.support.BeanDefinitionRegistry;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Import;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.util.Map;

import static org.springframework.beans.factory.support.BeanDefinitionBuilder.genericBeanDefinition;

/**
 * @ClassName AnnotationBeanDefinitionDemo
 * @Description
 *
 * 注解
 *
 * @Author <a href="hfwas1024@gmail.com">HFwas</a>
 * @Date: 9:04 下午
 * @Version: 1.0
 **/
// 3。 通过 @Import 来进行导入
@Import(AnnotationBeanDefinitionDemo.Config.class)
public class AnnotationBeanDefinitionDemo {

    public static void main(String[] args) {
        // 创建 BeanFactory 容器
        AnnotationConfigApplicationContext applicationContext = new AnnotationConfigApplicationContext();
        // 注册 Configuration class (配置类)
        applicationContext.register(Config.class);

        // 通过 BeanDefinition 注册 API 实现
        // 1。命名 bean 的注册方式
        registerUserBeanDefinition(applicationContext, "mercyblitz-user");
        // 2. 非命名的 bean 的注册方法
        registerUserBeanDefinition(applicationContext);

        // 启动应用上下文
        applicationContext.refresh();
        // 按照类型查找
        System.out.println("Config 类型的所有的 beans : " + applicationContext.getBeansOfType(Config.class));
        System.out.println("User 类型的所有的  beans : " + applicationContext.getBeansOfType(User.class));

        // 显示地关闭Spring 应用上下文
        applicationContext.close();
    }

    /**
     * 命名 bean 的注册方式
     *
     * @param beanDefinitionRegistry
     * @param beanName
     */
    public static void registerUserBeanDefinition(BeanDefinitionRegistry beanDefinitionRegistry, String beanName) {
        BeanDefinitionBuilder beanDefinitionBuilder = genericBeanDefinition(User.class);
        beanDefinitionBuilder
                .addPropertyValue("id", 89L)
                .addPropertyValue("name", "hfwas");

        // 判断如果 beanName 参数存在时
        if (StringUtils.hasText(beanName)) {
            // 注册 BeanDefinition
            beanDefinitionRegistry.registerBeanDefinition(beanName, beanDefinitionBuilder.getBeanDefinition());
        } else {
            // 非命名的 bean 注册方法
            BeanDefinitionReaderUtils.registerWithGeneratedName(beanDefinitionBuilder.getBeanDefinition(), beanDefinitionRegistry);
        }
    }

    public static void registerUserBeanDefinition(BeanDefinitionRegistry beanDefinitionRegistry) {
        registerUserBeanDefinition(beanDefinitionRegistry, null);
    }


    // 2. 通过 @Component 方式
    @Component // 定义当前类作为 Spring bean （组件）
    public static class Config{
        // 1。 通过 @bean 方法定义
        /*通过 java 注解的方式， 定义了一个bean */
        @Bean(name = {"user", "xiaomage-user"})
        public User get(){
            User user = new User();
            user.setId(89L);
            user.setName("hfwas");
            return user;
        }
    }
}
```

- 测试截图

![image-20220118002511192](images/image-20220118002511192.png)

# 实例化Spring Bean

- Bean实例化(Instantiation)
- 常规方式
  - 通过构造器(配置元信息: XML、Java注解和Java API )
  - 通过静态工厂方法(配置元信息: XML和Java API )
  - 通过Bean工厂方法(配置元信息: XML和Java API )
  - 通过FactoryBean (配置元信息: XML、Java注解和Java API )
- 特殊方式
  - 通过Servicel oaderFactoryBean (配置元信息: XML、Java注解和Java API )
  - 通过AutowireCapableBeanFactory#createBean(java.lang.Class, int, boolean)
  - 通过BeanDefinitionRegistry #registerBeanDefinition ( String, BeanDefinition )

## 代码测试

### 通过静态工厂方法

- 配置文件

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="
        http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">

    <bean id="user-by-static-method" class="com.hfwas.in.spring.domain.User"
    factory-method="createUser">

    </bean>

</beans>
```

- 实体类修改

```java
package com.hfwas.in.spring.domain;

/**
 * @ClassName User
 * @Description
 * @Author <a href="hfwas1024@gmail.com">HFwas</a>
 * @Date: 12:32 上午
 * @Version: 1.0
 **/
public class User {

    private Long id;

    private String name;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }

    public static User createUser(){
        return new User();
    }
}
```

- 测试代码

```java
package com.hfwas.in.spring.bean.definition;

import com.hfwas.in.spring.domain.User;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @ClassName BeanInstantiationDemo
 * @Description
 *
 * bean 实例话演示
 *
 * @Author <a href="hfwas1024@gmail.com">HFwas</a>
 * @Date: 12:32 上午
 * @Version: 1.0
 **/
public class BeanInstantiationDemo {

    public static void main(String[] args) {
        // 配置 xml 配置i文件
        // 启动 spring 应用上下文
        BeanFactory beanFactory = new ClassPathXmlApplicationContext("classpath:/META-INF/dependency-creation-context.xml");
        User bean = beanFactory.getBean("user-by-static-method", User.class);
        System.out.println(bean);
    }
}
```

- 测试截图

![image-20220118003632530](images/image-20220118003632530.png)







# 初始化 Spring Bean





# 延迟初始化 Spring Bean





# 销毁Spring Bean





# 垃圾回收 Spring Bean





# 面试题精选











