package com.zyx.course.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    /*public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new Interceptor()).addPathPatterns("/**")
                .excludePathPatterns("/test/back-login")
                .excludePathPatterns("/signOut")
                .excludePathPatterns("/");
        // .excludePathPatterns("/layui/**");
    }*/

    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**", "/image/**").addResourceLocations("classpath:/static/").addResourceLocations("file:D://image/");
    }


}
