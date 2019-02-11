package com.example.demo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by Administrator on 2019/2/11 0011.
 */
@RestController
public class HelloController {
    @RequestMapping(value="/hello",method = RequestMethod.GET)
    public String say(){
        return "hello china";
    }
}
