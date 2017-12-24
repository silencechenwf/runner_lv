package com.chinasofti.util;

import java.util.UUID;

/**
 * Created by Administrator on 2017/7/31.
 */
public class UUIDUtil {
    public static String random(){
        return UUID.randomUUID().toString().replace("-","");

    }
}
