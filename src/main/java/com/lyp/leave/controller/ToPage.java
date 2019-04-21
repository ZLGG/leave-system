package com.lyp.leave.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class ToPage {
    @RequestMapping("/")
    public String toPage() {
        return "back-login";
    }

    @RequestMapping("/test/{page}")
    public String toPage(@PathVariable String page) {
        return page;
    }

    @RequestMapping("/test/{page}/{page1}")
    public String toPage(@PathVariable String page, @PathVariable String page1) {
        return page + "/" + page1;
    }

    @RequestMapping("/signOut")
    public String signOut(HttpSession session) {
        session.invalidate();
        return "back-login";
    }
}
