package com.hfwas.java.chapter13;

/**
 * @Author: HFwas
 * @Date: 2021/1/25
 * @Description: com.hfwas.java.chapter13
 * 面试题
 *
 * 如何保证变量S指向的是字符牢常量池中的数据呢？
 * 有两种方式：
 *      方式一：String s=" shkstart"；//字面量定义的方式
 *      方式二：String s= new String("shkstart").intern();
 *          String s=new StringBuilder("shkstart").tostring().intern()
 * @version: 1.0
 */
public class StringIntern {
    public static void main(String[] args) {
        String s1 = new String("1");
        //调用此方法之前，字符串常量池中已经存在"1"
        s1.intern();
        String s2 = "1";
        //jdk6:false   jdk7/8:false
        System.out.println(s1 == s2);

        //s3变量记录的地址为：new String("11")
        String s3 = new String("1") + new String("1");
        //执行完上一行代码以后，字符串常量池中，是否存在"11"呢??答案是：不存在！！
        //在字符串常量池中生成"11",如何理解：jdk1.6:创建了一个新的对象"11",也就是新的地址
        //                      jdk7:此时常量中并没有创建"11",而是创建一个执行堆空间的new String("11")的地址
        s3.intern();

        //s4变量记录的地址：使用的是上一行代码代码执行时，在常量池生成的"11"的地址
        String s4 = "11";
        //jdk6:false    jdk7/8:true
        System.out.println(s3 == s4);
    }
}
