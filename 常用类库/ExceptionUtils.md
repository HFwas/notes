# ExceptionUtils工具类的使用

# 描述

- 该类属于`org.apache.commons.lang3.exception.ExceptionUtils`
- 通过传入的`Throwable`对象，进而获取详细的错误信息。包括：
  - 错误的原因
  - 错误的堆栈信息
  - 报错的根原因
  - 错误的根消息
  - 错误的数量
  - 等等

- 通过`ExceptionUtils`，我们可以拿到程序报错的详细信息，同步到日志库当中，不用我们手动区编写代码抽取日志报错信息

# 方法

- getMessage(throwable);获取错误信息
- getStackTrace(throwable);获取错误堆栈信息
- getRootCauseMessage(throwable);获取错误的根消息
- getRootCause(throwable);获取错误的根原因
- getStackFrames(throwable);获取栈帧消息
- getThrowableCount(throwable);获取报错数
- getThrowables(throwable);获取throwable数

# 测试demo

# controller层

```java
package com.hfwas.main.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @ClassName ExceptionTestController
 * @Description
 * @Author <a href="hfwas1024@gmail.com">HFwas</a>
 * @Date: 3:16 下午
 * @Version: 1.0
 **/
@Slf4j
@RestController
@RequestMapping("/exception")
public class ExceptionTestController {

    @GetMapping("/aa")
    public void test01() {

        int a = 1/ 0;

        System.out.println("test1");
    }
}
```

# handle层

```java
package com.hfwas.main.exception;

import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletRequest;

/**
 * @ClassName ExceptionTests
 * @Description
 * @Author <a href="hfwas1024@gmail.com">HFwas</a>
 * @Date: 3:09 下午
 * @Version: 1.0
 **/
@Slf4j
@RestControllerAdvice
public class ExceptionHanler {

    @ExceptionHandler(value = Exception.class)
    public void handler(HttpServletRequest req, Throwable throwable){
				// // ArithmeticException: / by zero
        String message = ExceptionUtils.getMessage(throwable);
				
        String stackTrace = ExceptionUtils.getStackTrace(throwable);
        // ArithmeticException: / by zero
        String rootCauseMessage = ExceptionUtils.getRootCauseMessage(throwable);
        // java.lang.ArithmeticException: / by zero
        Throwable rootCause = ExceptionUtils.getRootCause(throwable);
        // ["java.lang.Arith...", "	at com.hfwas.m...", "	at sun.reflect...", "	at sun.reflect...", "	at sun.reflect...", +47 more]
        String[] stackFrames = ExceptionUtils.getStackFrames(throwable);
        // 1
        int throwableCount = ExceptionUtils.getThrowableCount(throwable);
       
        Throwable[] throwables = ExceptionUtils.getThrowables(throwable);

        log.info("错误日志开始打印");
    }
}
```





