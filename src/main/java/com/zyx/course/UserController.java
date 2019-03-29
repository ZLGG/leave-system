package com.zyx.course;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
    @RequestMapping("/test/{page}")
    public String toPage(@PathVariable String page) {
        return page;
    }

}
