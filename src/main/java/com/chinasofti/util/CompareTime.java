package com.chinasofti.util;

/**
 * Created by Administrator on 2017/8/1.
 */
public class CompareTime{
    public static boolean compareTime(String str1,String str2,String str3){
        int res1=str1.compareTo(str2);
        int res2=str1.compareTo(str3);
        if(res1>0&&res2<0){
            return true;
        }
        return false;
    }
    public static boolean compTwoStr(String str1,String str2){
        int res=str1.compareTo(str2);
        if(res>=0){return true;}
        return false;
    }
}
