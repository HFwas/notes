# 03-Spring加载bean

# 调试环境

- maos
- idea

# 调试样例

- 类名：`package org.springframework.context.support;`
- 单元测试：`public void testSingleConfigLocation() `

# 加载BeanDefinition

- 真正加载BeanDefinition的逻辑是在org.springframework.beans.factory.xml.XmlBeanDefinitionReader#loadBeanDefinitions(org.springframework.core.io.Resource)当中

```java
/**
	 * 加载资源的真正实现
	 * Load bean definitions from the specified XML file.
	 * @param resource the resource descriptor for the XML file
	 * @return the number of bean definitions found
	 * @throws BeanDefinitionStoreException in case of loading or parsing errors
	 */
	@Override
	public int loadBeanDefinitions(Resource resource) throws BeanDefinitionStoreException {
		// new EncodedResource(resource)作为参数的原因：
		// 1.对Resource进行编码，保证内容的正确性，防止乱码
		return loadBeanDefinitions(new EncodedResource(resource));
	}
```

- 这里使用到了new EncodedResource(resource)作为参数
  - 考虑到Spring可能有编码的要求，需要先进行resource封装
- 然后调用loadBeanDefinitions(new EncodedResource(resource))执行真正的加载BeanDefinition的代码逻辑

```java
/**
	 * 从配置文件当中加载 bean definition, 返回 bean definition 的个数
	 * Load bean definitions from the specified XML file.
	 * @param encodedResource the resource descriptor for the XML file,
	 * allowing to specify an encoding to use for parsing the file
	 * @return the number of bean definitions found
	 * @throws BeanDefinitionStoreException in case of loading or parsing errors
	 */
	public int loadBeanDefinitions(EncodedResource encodedResource) throws BeanDefinitionStoreException {
		Assert.notNull(encodedResource, "EncodedResource must not be null");
		if (logger.isTraceEnabled()) {
			logger.trace("Loading XML bean definitions from " + encodedResource);
		}

		// 1.1. 获取已经加载的资源
		Set<EncodedResource> currentResources = this.resourcesCurrentlyBeingLoaded.get();
		if (currentResources == null) {
			currentResources = new HashSet<>(4);
			this.resourcesCurrentlyBeingLoaded.set(currentResources);
		}
		if (!currentResources.add(encodedResource)) {
			throw new BeanDefinitionStoreException(
					"Detected cyclic loading of " + encodedResource + " - check your import definitions!");
		}
		try {
			// 1.2.从当前资源获取封装的Resource， 并从中获取InputStream
			InputStream inputStream = encodedResource.getResource().getInputStream();
			try {
				InputSource inputSource = new InputSource(inputStream);
				if (encodedResource.getEncoding() != null) {
					// 设置编码
					inputSource.setEncoding(encodedResource.getEncoding());
				}
				// 1.3.核心逻辑，真正执行加载BeanDefinition
				return doLoadBeanDefinitions(inputSource, encodedResource.getResource());
			}
			finally {
				// 关闭InputStream
				inputStream.close();
			}
		}
		catch (IOException ex) {
			throw new BeanDefinitionStoreException(
					"IOException parsing XML document from " + encodedResource.getResource(), ex);
		}
		finally {
			// 移除当前线程加载的资源
			currentResources.remove(encodedResource);
			if (currentResources.isEmpty()) {
				this.resourcesCurrentlyBeingLoaded.remove();
			}
		}
	}
```

- 

# doLoadBeanDefinitions

```java
protected int doLoadBeanDefinitions(InputSource inputSource, Resource resource)
			throws BeanDefinitionStoreException {

		try {
			// 1.1. 根据 xml 文件， 获取 Document 实例
			Document doc = doLoadDocument(inputSource, resource);
			// 1.2. 根据 Document 实例，注册 bean 信息
			int count = registerBeanDefinitions(doc, resource);
			if (logger.isDebugEnabled()) {
				logger.debug("Loaded " + count + " bean definitions from " + resource);
			}
			return count;
		}
		.....
	}
```

- 根据传入的xml文件，获取Document 实例`doLoadDocument(inputSource, resource);`
- 根据获取的Document实例，解析配置 文件当中bean实例个数

# doLoadDocument

```java
/**
	 * Actually load the specified document using the configured DocumentLoader.
	 * @param inputSource the SAX InputSource to read from
	 * @param resource the resource descriptor for the XML file
	 * @return the DOM Document
	 * @throws Exception when thrown from the DocumentLoader
	 * @see #setDocumentLoader
	 * @see DocumentLoader#loadDocument
	 */
	protected Document doLoadDocument(InputSource inputSource, Resource resource) throws Exception {
		// 1. getValidationModeForResource(resource) : 获取执行xml文件的验证模式
		// 2. getEntityResolver() ： 获取实体解析器
		// 3. isNamespaceAware() ： 命名空间支持，如果提供命名空间支持，则为true
		return this.documentLoader.loadDocument(inputSource, getEntityResolver(), this.errorHandler,
				getValidationModeForResource(resource), isNamespaceAware());
	}
```

- #getEntityResolver()获取解析器
- #this.errorHandler获取错误处理器
- #getValidationModeForResource(resource)获取资源的验证模式
- #isNamespaceAware()是否设置Namespace

# 参考资料

- http://svip.iocoder.cn/Spring/IoC-load-BeanDefinitions/
- 《Spring源码深度解析》
