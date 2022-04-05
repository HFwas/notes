# 当没有URI时

- 站长A欲分享一部电影Forrest Gump给B,需要告诉:
  - 请使用FTP协议访问mysite.net,端口是8502
  - 登录用户名是user,密码pass
  - 进入到/shared/movie目录下
  - 转换为二进制模式
  - 下载名为Forrest Gump.mkv格式的文件
- 有了 URI:ftp://user:pass@mysite.net:8502/shared/movie/Forrest Gump.mkv

# 什么是URI

- URL: RFC1738 (1994.12)Uniform Resource Locator,表示资源的位置,期望提供查找资源的方法
- URN: RFC2141 (1997.5) Uniform Resource Name,期望为资源提供持久的、位置无关的标识方式,并允许简单地将多个命名空间映射到单个URN命名空间
  - 例如磁力链接 magnet:?xt=urn:sha1:YNCKHTQC5C 
- URI: RFC1630 (1994.6)、RFC3986 (2005.1,取代RFC2396和 RFC2732) Uniform Resource Identifier,用以区分资源,是URL 和URN的超集,用以取代URL和URN概念

# Uniform Resource Identifier 统-资源标识符

- Resource 资源
  - 可以是图片、文档、今天杭州的温度等,也可以是不能通过互联网访问的实体,例如人、公司、实体书,也可以是抽象的概念,例如亲属关系或者数字符号
  - 一个资源可以有多个 URI
- Identifier 标识符
  - 将当前资源与其他资源区分开的名称
- Uniform统一
  - 允许不同种类的资源在同一上下文中出现
  - 对不同种类的资源标识符可以使用同一种语义进行解读
  - 引入新标识符时,不会对已有标识符产生影响
  - 允许同一资源标识符在不同的、internet规模下的上下文中出现

# URI的组成

- 组成: schema, user information, host, port, path, query, fragment

![image-20220405155738869](images/image-20220405155738869.png)

# 为什么要进行URI编码

- 传递数据中,如果存在用作分隔符的保留字符怎么办?   
- 对可能产生歧义性的数据编码
  - 不在ASCII码范围内的字符
  - ASCII 码中不可显示的字符
  - URI中规定的保留字符
  - 不安全字符(传输环节中可能会被不正确处理),如空格、引号、尖括号等

# 保留字符与非保留字符

- 保留字符
  - reserved = gen-delims / sub-delims
    - gen-delims = ":" / "/" / "?" / "#" / "[" / "]
    - sub-delims = "!" / "$"
- 非保留字符
  - unreserved = ALPHA / DIGITI "-"
    - ALPHA: %41-%5A and %61-%7A
    - DIGIT: %30-%39
    - -: %2D   :%2E    _: %5F
    - ~:%7E,某些实现将其认为保留字符

# URI百分号编码

- 百分号编码的方式
  - pct-encoded = "%" HEXDIG HEXDIG
    - US-ASCII: 128个字符(95个可显示字符,33个不可显示字符)	
    - 参见: https://zh.wikipedia.org/wiki/ASCIl
  - 对于HEXDIG十六进制中的字母,大小写等价
- 非ASCII码字符(例如中文):建议先UTF8编码,再US-ASCII编码
- 对URI合法字符,编码与不编码是等价的
  - 例如, “URI 转换"既可以"URI%e8%bd%ac%e6%8d%a",也可以"%55%52%49%e8%bd%ac%e6%8d%a2"
    - https://www.baidu.com/s?wd=URI%20%e8%bd%ac%e6%8d%a2
    - https://www.baidu.com/s?wd=%55%52%49%20%e8%bd%ac%e6%8d%a2

