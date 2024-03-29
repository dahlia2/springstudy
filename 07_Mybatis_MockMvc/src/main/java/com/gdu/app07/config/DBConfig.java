package com.gdu.app07.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.TransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@PropertySource(value={"classpath:application.properties"})  // application.properties 파일의 속성을 읽어 오자!
@EnableTransactionManagement(proxyTargetClass=true)          // 트랜잭션 처리를 허용한다.

// Auto Proxy(인터페이스를 찾아서 바인딩 하는 것 : @Autowired BoardService boardService)
// @Transactional은 Auto Proxy이기 때문에 인터페이스가 아닌 자바 클래스를 이용하려면(@Autowired BoardServiceImpl boardService)
// 클래스로 바인딩을 할 수 있도록 proxyTargetClass를 true로 해 준다. 

@Configuration
public class DBConfig {
	
	// app 06에서는 스프링 관점에서 트랜잭션이 필요할 때 발생시키도록 설정
	// app 07에서는 사용자 관점에서 트랜잭션이 발생하도록 설정.

	@Autowired
	private Environment env;    // Environment : 스프링이 가지고 있는 bean이라 별도의 생성 코드가 보이지 않음.
	
	// HikaryConfig Bean
	@Bean
	public HikariConfig hikariConfig() {
		HikariConfig hikariConfig = new HikariConfig();
		hikariConfig.setDriverClassName(env.getProperty("spring.datasource.hikari.driver-class-name"));
		hikariConfig.setJdbcUrl(env.getProperty("spring.datasource.hikari.jdbc-url"));
		hikariConfig.setUsername(env.getProperty("spring.datasource.hikari.username"));
		hikariConfig.setPassword(env.getProperty("spring.datasource.hikari.password"));
		return hikariConfig;
	}
	
	// HikariDataSource Bean
	@Bean(destroyMethod="close")
	public HikariDataSource hikariDataSource() {
		return new HikariDataSource(hikariConfig());
	}
	
	// SqlSessionFactory Bean 
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
		bean.setDataSource(hikariDataSource());
		bean.setConfigLocation(new PathMatchingResourcePatternResolver().getResource(env.getProperty("mybatis.config-location")));
		bean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources(env.getProperty("mybatis.mapper-locations")));
		return bean.getObject();
	}
	
	// SqlSessionTemplate Bean (기존의 SqlSession)
	@Bean
	public SqlSessionTemplate sqlSessionTemplate() throws Exception {
		return new SqlSessionTemplate(sqlSessionFactory());
	}
	
	// TransactionManager Bean (정상적으로 동작하기 위해선 트랜잭션 허용이 필요 -> 위에 적은 @EnableTransactionManagement)
	@Bean
	public TransactionManager transactionManager() {
		return new DataSourceTransactionManager(hikariDataSource());
	}
	
}