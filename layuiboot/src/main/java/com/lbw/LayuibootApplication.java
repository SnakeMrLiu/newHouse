package com.lbw;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.support.SpringBootServletInitializer;

@SpringBootApplication
@ServletComponentScan
@MapperScan(value = "com.lbw.mapper")
public class LayuibootApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(LayuibootApplication.class, args);
	}

	/**
	 * 支持jsp需要重写此方法
	 * @param builder
	 * @return
	 */
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(this.getClass());
	}
}
