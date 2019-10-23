package com.lewdx.common;

/**
 * Created by wdx on 2019/9/27 11:13
 */
public class SysResult {
    private boolean result;
    private String data;

    public boolean isResult() {
        return result;
    }

    public void setResult(boolean result) {
        this.result = result;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public SysResult() {
    }

    public SysResult(boolean result, String data) {
        this.result = result;
        this.data = data;
    }
}
