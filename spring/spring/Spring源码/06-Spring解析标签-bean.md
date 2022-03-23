# 07-Spring解析标签-bean

GitHub地址：

- https://github.com/HFwas
- 主要是[ notes](https://github.com/HFwas/notes)仓库下`Spring`文件夹和[spring-framework](https://github.com/HFwas/spring-framework)仓库的`hfwas`分支

[toc]



解析标签代码：

```java
private void parseDefaultElement(Element ele, BeanDefinitionParserDelegate delegate) {
		if (delegate.nodeNameEquals(ele, IMPORT_ELEMENT)) {
			importBeanDefinitionResource(ele);
		}
		else if (delegate.nodeNameEquals(ele, ALIAS_ELEMENT)) {
			processAliasRegistration(ele);
		}
		else if (delegate.nodeNameEquals(ele, BEAN_ELEMENT)) {
			processBeanDefinition(ele, delegate);
		}
		else if (delegate.nodeNameEquals(ele, NESTED_BEANS_ELEMENT)) {
			// recurse
			doRegisterBeanDefinitions(ele);
		}
	}
```

# processBeanDefinition

```java
/**
	 * Process the given bean element, parsing the bean definition
	 * and registering it with the registry.
	 */
	protected void processBeanDefinition(Element ele, BeanDefinitionParserDelegate delegate) {
		// 1.1.解析 Element 当中的name,id,class之类的属性，返回一个 BeanDefinitionHolder 实例
		BeanDefinitionHolder bdHolder = delegate.parseBeanDefinitionElement(ele);
		if (bdHolder != null) {
			// 1.2.当返回的bdHolder不为空的情况下若存在默认标签的子节点下再有自定义属性，还需要再次对自定义标签进行解析。
			bdHolder = delegate.decorateBeanDefinitionIfRequired(ele, bdHolder);
			try {
				// Register the final decorated instance.
				// 1.3.解析完成后，需要对解析后的bdHolder进行注册，同样，注册操作委托给了BeanDefinitionReaderUtils的registerBeanDefinition方法。
				BeanDefinitionReaderUtils.registerBeanDefinition(bdHolder, getReaderContext().getRegistry());
			}
			catch (BeanDefinitionStoreException ex) {
				getReaderContext().error("Failed to register bean definition with name '" +
						bdHolder.getBeanName() + "'", ele, ex);
			}
			// Send registration event.
			// 1.4.最后发出响应事件，通知想关的监听器，这个bean已经加载完成了
			getReaderContext().fireComponentRegistered(new BeanComponentDefinition(bdHolder));
		}
	}
```

- #1，首先委托`org.springframework.beans.factory.xml.BeanDefinitionParserDelegate#parseBeanDefinitionElement(org.w3c.dom.Element, org.springframework.beans.factory.config.BeanDefinition)`方法解析`id,name`之类的属性，返回BeanDefinitionHolder的实例，这个实例当中就包含了配置文件当中定义的name,id之类的属性了
- #2，当返回的bdHolder不为空的情况下若存在默认标签的子节点下再有自定义属性，还需要再次对自定义标签进行解析。
- #3，解析完成后，需要对解析后的bdHolder进行注册，同样，注册操作委托给了BeanDefinitionReaderUtils的registerBeanDefinition方法。
- #4，最后发出响应事件，通知想关的监听器，这个bean已经加载完成了

# parseBeanDefinitionElement

```java
/**
	 * Parses the supplied {@code <bean>} element. May return {@code null}
	 * if there were errors during parse. Errors are reported to the
	 * {@link org.springframework.beans.factory.parsing.ProblemReporter}.
	 */
	@Nullable
	public BeanDefinitionHolder parseBeanDefinitionElement(Element ele, @Nullable BeanDefinition containingBean) {
		// 1.1.解析 id 属性
		String id = ele.getAttribute(ID_ATTRIBUTE);
		// 1.2.解析 name 属性
		String nameAttr = ele.getAttribute(NAME_ATTRIBUTE);

		List<String> aliases = new ArrayList<>();
		if (StringUtils.hasLength(nameAttr)) {
			// 1.3.分割 name 属性
			String[] nameArr = StringUtils.tokenizeToStringArray(nameAttr, MULTI_VALUE_ATTRIBUTE_DELIMITERS);
			aliases.addAll(Arrays.asList(nameArr));
		}

		String beanName = id;
		if (!StringUtils.hasText(beanName) && !aliases.isEmpty()) {
			beanName = aliases.remove(0);
			if (logger.isTraceEnabled()) {
				logger.trace("No XML 'id' specified - using '" + beanName +
						"' as bean name and " + aliases + " as aliases");
			}
		}

    // 1.4.
		if (containingBean == null) {
			// 检查 beanName 的唯一性
			// 检查 beanName 是否被使用过， alias是否被使用过
			checkNameUniqueness(beanName, aliases, ele);
		}

    // 1.5.parseBeanDefinitionElement三个参数
		AbstractBeanDefinition beanDefinition = parseBeanDefinitionElement(ele, beanName, containingBean);
		if (beanDefinition != null) {
			if (!StringUtils.hasText(beanName)) {
				try {
					// 1.6.如果不存在 beanName ,则根据Spring提供的默认的命名负责提供对应的beanName
					if (containingBean != null) {
						beanName = BeanDefinitionReaderUtils.generateBeanName(
								beanDefinition, this.readerContext.getRegistry(), true);
					}
					else {
						beanName = this.readerContext.generateBeanName(beanDefinition);
						// Register an alias for the plain bean class name, if still possible,
						// if the generator returned the class name plus a suffix.
						// This is expected for Spring 1.2/2.0 backwards compatibility.
						String beanClassName = beanDefinition.getBeanClassName();
						if (beanClassName != null &&
								beanName.startsWith(beanClassName) && beanName.length() > beanClassName.length() &&
								!this.readerContext.getRegistry().isBeanNameInUse(beanClassName)) {
							aliases.add(beanClassName);
						}
					}
					if (logger.isTraceEnabled()) {
						logger.trace("Neither XML 'id' nor 'name' specified - " +
								"using generated bean name [" + beanName + "]");
					}
				}
				catch (Exception ex) {
					error(ex.getMessage(), ele);
					return null;
				}
			}
			String[] aliasesArray = StringUtils.toStringArray(aliases);
			//
			return new BeanDefinitionHolder(beanDefinition, beanName, aliasesArray);
		}

		return null;
	}
```

- 

# parseBeanDefinitionElement三个参数

```java
/**
	 * Parse the bean definition itself, without regard to name or aliases. May return
	 * {@code null} if problems occurred during the parsing of the bean definition.
	 */
	@Nullable
	public AbstractBeanDefinition parseBeanDefinitionElement(
			Element ele, String beanName, @Nullable BeanDefinition containingBean) {

		this.parseState.push(new BeanEntry(beanName));

		String className = null;
		// 1.1.解析 class  属性
		if (ele.hasAttribute(CLASS_ATTRIBUTE)) {
			className = ele.getAttribute(CLASS_ATTRIBUTE).trim();
		}
		String parent = null;
		// 1.2.解析 parent 属性
		if (ele.hasAttribute(PARENT_ATTRIBUTE)) {
			parent = ele.getAttribute(PARENT_ATTRIBUTE);
		}

		try {
			// 1.3.用来承载属性的 AbstractBeanDefinition 类型的 GenericBeanDefinition
			AbstractBeanDefinition bd = createBeanDefinition(className, parent);
			// 1.4.硬解码解析默认 bean 的各种属性
			parseBeanDefinitionAttributes(ele, beanName, containingBean, bd);
			bd.setDescription(DomUtils.getChildElementValueByTagName(ele, DESCRIPTION_ELEMENT));

			// 1.5.解析 meta 元数据
			parseMetaElements(ele, bd);
			// 1.6.解析 look-up-method 属性
			parseLookupOverrideSubElements(ele, bd.getMethodOverrides());
			// 1.7.解析 replaced-method 属性
			parseReplacedMethodSubElements(ele, bd.getMethodOverrides());

			// 1.8.解析 构造方法 子元素
			parseConstructorArgElements(ele, bd);
			// 1.9.解析 property 子元素
			parsePropertyElements(ele, bd);
			// 1.10.解析 qualifier 子元素
			parseQualifierElements(ele, bd);

			bd.setResource(this.readerContext.getResource());
			bd.setSource(extractSource(ele));

			return bd;
		}
		catch (ClassNotFoundException ex) {
			error("Bean class [" + className + "] not found", ele, ex);
		}
		catch (NoClassDefFoundError err) {
			error("Class that bean class [" + className + "] depends on not found", ele, err);
		}
		catch (Throwable ex) {
			error("Unexpected failure during bean definition parsing", ele, ex);
		}
		finally {
			// 解析完成
			this.parseState.pop();
		}

		return null;
	}
```

- 在当前类，Spring做了以下事情：
- 解析了class属性和parent属性，创建了承载属性的GenericBeanDefinition，解析拿到name, alias,相关属性值，设置GenericBeanDefinition的参数值
- #1.6.如果 不存在beanName，那么按照Spring的name逻辑为beanName生成一个别名
- #1.6.填充 BeanDefinitionHolder 属性，包括：beanBeanDefinition，beanName，alias
- 最后返回一个BeanDefinitionHolder

# createBeanDefinition

```java
/**
	 * Create a new GenericBeanDefinition for the given parent name and class name,
	 * eagerly loading the bean class if a ClassLoader has been specified.
	 * @param parentName the name of the parent bean, if any
	 * @param className the name of the bean class, if any
	 * @param classLoader the ClassLoader to use for loading bean classes
	 * (can be {@code null} to just register bean classes by name)
	 * @return the bean definition
	 * @throws ClassNotFoundException if the bean class could not be loaded
	 */
	public static AbstractBeanDefinition createBeanDefinition(
			@Nullable String parentName, @Nullable String className, @Nullable ClassLoader classLoader) throws ClassNotFoundException {
		// 创建了一个GenericBeanDefinition对象
		GenericBeanDefinition bd = new GenericBeanDefinition();
    // 设置了父类名称
		bd.setParentName(parentName);
		if (className != null) {
			if (classLoader != null) {
        // 设置了BeanClass
				bd.setBeanClass(ClassUtils.forName(className, classLoader));
			}
			else {
        // 设置了BeanClass名称
				bd.setBeanClassName(className);
			}
		}
		return bd;
	}
```

- 上述方法是用来创建承载BeanDefinition各种属性的GenericBeanDefinition类型的bean，因为BeanDefinition是顶层接口，而AbstractBeanDefinition是BeanDefinition的默认实现，GenericBeanDefinition继承自AbstractBeanDefinition
- RootBeanDefinition是最常用的实现类，它对应一般性的<bean>元素标签，GenericBeanDefinition是自2.5版本以后新加入的bean文件配置属性定义类，是一站式服务类。
- GenericBeanDefinition可以设置类的父类名称，beanClass和对应的名称