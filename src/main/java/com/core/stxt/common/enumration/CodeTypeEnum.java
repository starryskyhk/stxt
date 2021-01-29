package com.core.stxt.common.enumration;

/**
 * 预留状态处理
 */
public enum CodeTypeEnum {
    SUCCESS(200,"请求成功"),
    ERROR(444,"请求出错");

    private int code;
    private String msg;
    CodeTypeEnum(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
