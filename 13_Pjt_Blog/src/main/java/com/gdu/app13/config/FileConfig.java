package com.gdu.app13.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Configuration
public class FileConfig {   // maven의 commons-fileupload 사용할 때 가져다 쓰기 위해 bean로 만드는 config
	
	@Bean
	public MultipartResolver multipartResolver() {    // Bean 타입은 설정해야 한다. (인터페이스 타입)
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("UTF-8");
		multipartResolver.setMaxUploadSize(1024 * 1024 * 10);         // 전체 첨부 파일의 크기 100MB
		multipartResolver.setMaxUploadSizePerFile(1024 * 1024 * 10);  // 첨부 파일 하나의 크기 10MB
		return multipartResolver;
	}

}
