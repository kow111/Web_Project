package com.example.Config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
@Configuration
public class WebSiteMeshConfig implements WebMvcConfigurer {
    @Bean
    public FilterRegistrationBean siteMeshFilter() {
        FilterRegistrationBean filter = new FilterRegistrationBean();
        CustomSiteMeshFilter siteMeshFilter = new CustomSiteMeshFilter();
        filter.setFilter(siteMeshFilter);
        return filter;
    }
}
