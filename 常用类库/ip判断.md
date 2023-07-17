# ip判断

- 判断ip是否属于某一个ip集合的子集或者

# 工具类

## 自己实现

```java
private final int nMaskBits;
    private final InetAddress requiredAddress;

    /**
     * Takes a specific IP address or a range specified using the IP/Netmask (e.g.
     * 192.168.1.0/24 or 202.24.0.0/14).
     *
     * @param ipAddress the address or range of addresses from which the request must
     * come.
     */
    public IpAddressMatcher(String ipAddress) {

        if (ipAddress.indexOf('/') > 0) {
            String[] addressAndMask = ipAddress.split("/");
            ipAddress = addressAndMask[0];
            nMaskBits = Integer.parseInt(addressAndMask[1]);
        }
        else {
            nMaskBits = -1;
        }
        requiredAddress = parseAddress(ipAddress);
        assert  (requiredAddress.getAddress().length * 8 >= nMaskBits) :
                String.format("IP address %s is too short for bitmask of length %d",
                        ipAddress, nMaskBits);
    }

    public boolean matches(String address) {
        InetAddress remoteAddress = parseAddress(address);

        if (!requiredAddress.getClass().equals(remoteAddress.getClass())) {
            return false;
        }

        if (nMaskBits < 0) {
            return remoteAddress.equals(requiredAddress);
        }

        byte[] remAddr = remoteAddress.getAddress();
        byte[] reqAddr = requiredAddress.getAddress();

        int nMaskFullBytes = nMaskBits / 8;
        byte finalByte = (byte) (0xFF00 >> (nMaskBits & 0x07));

        // System.out.println("Mask is " + new sun.misc.HexDumpEncoder().encode(mask));

        for (int i = 0; i < nMaskFullBytes; i++) {
            if (remAddr[i] != reqAddr[i]) {
                return false;
            }
        }

        if (finalByte != 0) {
            return (remAddr[nMaskFullBytes] & finalByte) == (reqAddr[nMaskFullBytes] & finalByte);
        }

        return true;
    }

    private InetAddress parseAddress(String address) {
        try {
            return InetAddress.getByName(address);
        }
        catch (UnknownHostException e) {
            throw new IllegalArgumentException("Failed to parse address" + address, e);
        }
    }
```



# spring security

```java
import org.springframework.security.web.util.matcher.IpAddressMatcher;
...

private void checkIpMatch() {
    matches("192.168.2.1", "192.168.2.1"); // true
    matches("192.168.2.1", "192.168.2.0/32"); // false
    matches("192.168.2.5", "192.168.2.0/24"); // true
    matches("92.168.2.1", "fe80:0:0:0:0:0:c0a8:1/120"); // false
    matches("fe80:0:0:0:0:0:c0a8:11", "fe80:0:0:0:0:0:c0a8:1/120"); // true
    matches("fe80:0:0:0:0:0:c0a8:11", "fe80:0:0:0:0:0:c0a8:1/128"); // false
    matches("fe80:0:0:0:0:0:c0a8:11", "192.168.2.0/32"); // false
}

private boolean matches(String ip, String subnet) {
    IpAddressMatcher ipAddressMatcher = new IpAddressMatcher(subnet);
    return ipAddressMatcher.matches(ip);
}
```







# 参考资料

- https://stackoverflow.com/questions/577363/how-to-check-if-an-ip-address-is-from-a-particular-network-netmask-in-java
- 