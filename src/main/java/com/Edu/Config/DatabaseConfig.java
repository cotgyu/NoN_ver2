package com.Edu.Config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.tomcat.jdbc.pool.DataSource;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Primary;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

public abstract class DatabaseConfig {

	@Bean
	public abstract DataSource dataSource();

	protected void configureDataSource(DataSource dataSource, DataSourceProperties databaseProperties) {
		dataSource.setDriverClassName(databaseProperties.getDriverClassName());
		dataSource.setUrl(databaseProperties.getUrl());
		dataSource.setUsername(databaseProperties.getUsername());
		dataSource.setPassword(databaseProperties.getPassword());
		dataSource.setTestOnBorrow(false);
		dataSource.setTestOnReturn(false);
	}
}

@Configuration
@Lazy
@MapperScan(basePackages = { "com.Edu.Dao" })
@EnableTransactionManagement
class eduDataSourceConfig extends DatabaseConfig {

	@Autowired
	private ApplicationContext applicationContext;

	@Bean(name = "eduDataSource", destroyMethod = "close")
	@Primary
	@ConfigurationProperties(prefix = "spring.datasource")
	public DataSource dataSource() {
		DataSource dataSource = new DataSource();
		return dataSource;
	}

	// 트랜잭션
	@Bean
	public DataSourceTransactionManager transactionManager(@Qualifier("eduDataSource") DataSource dataSource) {
		DataSourceTransactionManager transactionManager = new DataSourceTransactionManager(dataSource);
		transactionManager.setGlobalRollbackOnParticipationFailure(false);
		return transactionManager;
	}

	@Bean
	@ConfigurationProperties(prefix = "mybatis")
	public SqlSessionFactory sqlSessionFactory(@Qualifier("eduDataSource") DataSource dataSource) throws Exception {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(dataSource);
		sqlSessionFactoryBean.setTypeAliasesPackage("com.Edu.Domain");
		sqlSessionFactoryBean
				.setConfigLocation(applicationContext.getResource("classpath:static/mybatis/mybatis-config.xml"));
		sqlSessionFactoryBean
				.setMapperLocations(applicationContext.getResources("classpath:static/mybatis/mappers/mysql-*.xml"));
		return sqlSessionFactoryBean.getObject();
	}

	@Bean
	public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) throws Exception {
		return new SqlSessionTemplate(sqlSessionFactory);
	}
}

//
// @Configuration
// @Lazy
// @MapperScan(basePackages = {"com.Edu.Board"})
// @EnableTransactionManagement
// class DataSourceConfig extends DatabaseConfig {
//
// @Autowired
// private ApplicationContext applicationContext;
//
// @Bean(name="eduDataSource", destroyMethod="close")
// @Primary
// @ConfigurationProperties(prefix = "spring.datasource")
// public DataSource dataSource() {
// DataSource eduDataSource = new DataSource();
// return eduDataSource;
// }
//
// // 트랜잭션
// @Bean
// public DataSourceTransactionManager
// transactionManager(@Qualifier("eduDataSource") DataSource eduDataSource) {
// DataSourceTransactionManager transactionManager = new
// DataSourceTransactionManager(eduDataSource);
// transactionManager.setGlobalRollbackOnParticipationFailure(false);
// return transactionManager;
// }
//
// @Bean
// public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory
// sqlSessionFactory) throws Exception {
// return new SqlSessionTemplate(sqlSessionFactory);
// }
// }

//
// @Bean
// public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws
// Exception {
// final SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
// sessionFactory.setDataSource(dataSource);
// return sessionFactory.getObject();
// }

// @Primary
// @Bean(name = "eduManagerFactory")
// public LocalContainerEntityManagerFactoryBean
// eduManagerFactory(EntityManagerFactoryBuilder builder) {
// return
// builder.dataSource(eduDataSource()).packages("com.Edu.Domain").build();
// }
//
// @Primary
// @Bean(name = "eduManager")
// PlatformTransactionManager eduManager(EntityManagerFactoryBuilder builder) {
// return new JpaTransactionManager(eduManagerFactory(builder).getObject());
// }
// }
