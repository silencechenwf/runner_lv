package com.chinasofti.util;

/**
 * Created by Administrator on 2017/7/31.
 */
public class JSONResult {
    private boolean success=true;
    private String msg;
    private Object result;

    @Override
    public String toString() {
        return "JSONResult{" +
                "success=" + success +
                ", msg='" + msg + '\'' +
                ", result=" + result +
                '}';
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getResult() {
        return result;
    }

    public void setResult(Object result) {
        this.result = result;
    }

    public JSONResult(boolean success, String msg, Object result) {

        this.success = success;
        this.msg = msg;
        this.result = result;
    }

    public JSONResult() {

    }
}
