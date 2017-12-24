package com.chinasofti.util;

import com.sun.tools.internal.xjc.reader.xmlschema.bindinfo.BIConversion;

/**
 * Created by Administrator on 2017/8/2.
 */
public class ConvertTime {
    public static String convertTime(String date){

        String year =date.substring(0,4);
        String month=date.substring(5,7);
        String day=date.substring(8,10);
        String date1=year+"年"+month+"月"+day+"日";
        return date1;
    }
}
