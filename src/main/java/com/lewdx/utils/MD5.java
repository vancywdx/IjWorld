package com.lewdx.utils;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

public class MD5 {
    public static void main(String[] args) {
        // 1.加密算法
        String algorithmName = "MD5";

        // 2.密码
        Object source = "77777";

        // 3.盐值
        Object salt = ByteSource.Util.bytes("李四"); // 盐值一般是用户名或者userId

        // 4.加密次数
        int hashIterations = 1024;

        SimpleHash simpleHash = new SimpleHash(algorithmName, source, salt, hashIterations);
        // 5.得到加密后的密码
        System.out.println(simpleHash);

    }
}
