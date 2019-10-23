package com.lewdx.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * Created by wdx on 2019/10/14 20:56
 */
@ControllerAdvice
public class HandleShiroException {
    @ExceptionHandler
    public String handleShiroException(Exception e){
        return "error";
    }
}
