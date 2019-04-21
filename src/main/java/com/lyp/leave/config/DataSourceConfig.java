package com.lyp.leave.config;

import com.alibaba.druid.pool.DruidDataSource;
import org.apache.ibatis.logging.slf4j.Slf4jImpl;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan(basePackages = {"com.lyp.leave.mapper"},sqlSessionFactoryRef = "sqlSessionFactory")
public class DataSourceConfig {
    @Bean(name = "datasource",destroyMethod = "close")
    public DruidDataSource dataSource() throws Exception{
        /*String config = ConfigService.getConfig("ds.zlg.user.datasourcevo", "zlg", 3000);

        DataSourceVo dataSourceVo = JSONObject.parseObject(config, DataSourceVo.class);*/

        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://127.0.0.1:3306/leavesystem?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true");
        dataSource.setUsername("root");
        dataSource.setPassword("root");
        dataSource.setMaxActive(6);
        dataSource.setValidationQuery("SELECT");
        dataSource.setInitialSize(1);
        dataSource.setMinIdle(0);
        dataSource.setMaxWait(60000);
        return dataSource;
    }
    @Bean(name = "sqlSessionFactory")
    public SqlSessionFactory sqlsessionFactoryBean(@Qualifier("datasource") DruidDataSource dataSource) throws Exception{
        org.apache.ibatis.session.Configuration config = new org.apache.ibatis.session.Configuration();
        config.setMapUnderscoreToCamelCase(true);
        config.setLogImpl(Slf4jImpl.class);
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource);
        sqlSessionFactoryBean.setConfiguration(config);

        return sqlSessionFactoryBean.getObject();
    }

}
