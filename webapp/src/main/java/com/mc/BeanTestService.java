package com.mc;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "test")
public class BeanTestService {

    @GetMapping
    public String hello() {
        return "Hello, there";
    }
}
