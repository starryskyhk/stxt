package com.core.stxt.common.model;

/**
 * 自定义异常
 */
public class MyException extends RuntimeException {
    public MyException(String message) {
        super(message);
    }
}
