# 01-Spring创建容器过程

[toc]

# 1.核心代码

```java
public void refresh() throws BeansException, IllegalStateException {
		synchronized (this.startupShutdownMonitor) {
			// Prepare this context for refreshing.
			prepareRefresh();

			// Tell the subclass to refresh the internal bean factory.
			ConfigurableListableBeanFactory beanFactory = obtainFreshBeanFactory();

			// Prepare the bean factory for use in this context.
			prepareBeanFactory(beanFactory);

			try {
				// Allows post-processing of the bean factory in context subclasses.
				postProcessBeanFactory(beanFactory);

				// Invoke factory processors registered as beans in the context.
				invokeBeanFactoryPostProcessors(beanFactory);

				// Register bean processors that intercept bean creation.
				registerBeanPostProcessors(beanFactory);

				// Initialize message source for this context.
				initMessageSource();

				// Initialize event multicaster for this context.
				initApplicationEventMulticaster();

				// Initialize other special beans in specific context subclasses.
				onRefresh();

				// Check for listener beans and register them.
				registerListeners();

				// Instantiate all remaining (non-lazy-init) singletons.
				finishBeanFactoryInitialization(beanFactory);

				// Last step: publish corresponding event.
				finishRefresh();
			}

			catch (BeansException ex) {
				if (logger.isWarnEnabled()) {
					logger.warn("Exception encountered during context initialization - " +
							"cancelling refresh attempt: " + ex);
				}

				// Destroy already created singletons to avoid dangling resources.
				destroyBeans();

				// Reset 'active' flag.
				cancelRefresh(ex);

				// Propagate exception to caller.
				throw ex;
			}

			finally {
				// Reset common introspection caches in Spring's core, since we
				// might not ever need metadata for singleton beans anymore...
				resetCommonCaches();
			}
		}
	}
```

# 2.逐个分析

## 2.1.prepareRefresh();

- 

## 2.2.ConfigurableListableBeanFactory beanFactory = obtainFreshBeanFactory();

- 

## 2.3.prepareBeanFactory(beanFactory);

- 

## 2.4.postProcessBeanFactory(beanFactory);





## 2.5.invokeBeanFactoryPostProcessors(beanFactory);





## 2.6.registerBeanPostProcessors(beanFactory);





## 2.7.initMessageSource();





## 2.8.initApplicationEventMulticaster();





## 2.9.onRefresh();





## 2.10.registerListeners();





## 2.11.finishBeanFactoryInitialization(beanFactory);





## 2.12.finishRefresh();



