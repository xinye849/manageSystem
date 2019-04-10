package xin.yuan.utils;

import sun.misc.BASE64Encoder;
import sun.net.NetworkServer;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @authorknightx
 * @create2019/4/10
 * @since 1.0.0
 */
public class Md5Encode {
    /*进行md5加密*/
    public static String encodeByMd5(String str) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        //利用Md5加密
      MessageDigest  md5 = MessageDigest.getInstance("MD5");
      //用base64编码
        BASE64Encoder base64En = new BASE64Encoder();
        //开始加密
        String newpsd = base64En.encode(md5.digest(str.getBytes("utf-8")));
        return newpsd;
    }

/*
* 判断用户密码是否正确
* newpasswd 用户输入的密码
* oldpasswd 正确密码
* */
    public static boolean checkPassword(String newPassword,String oldPassword) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        if (encodeByMd5(newPassword).equals(oldPassword)) {
            return true;
        } else {
            return false;
        }
    }

}
