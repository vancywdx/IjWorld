package com.lewdx.utils;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

/**
 * Created by wdx on 2019/10/16 11:53
 */
public class MD5AddSolt {
    public static String addSolt(String username,String password){
        // 1.加密算法
        String algorithmName = "MD5";

        // 2.密码
        Object source = password;

        // 3.盐值
        Object salt = ByteSource.Util.bytes(username); // 盐值一般是用户名或者userId

        // 4.加密次数
        int hashIterations = 1024;
        // 5.得到加密后的密码
        SimpleHash simpleHash = new SimpleHash(algorithmName, source, salt, hashIterations);
        return simpleHash.toString();
    }
}
