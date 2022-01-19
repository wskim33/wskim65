package com.team4.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.jdbc.core.JdbcTemplate;

import com.team4.vo.CustomerVO;

import lombok.Setter;

public class CustomerDaoImpl implements CustomerDao {
	
	private final String mapper = "com.team4.mapper.SubwayMapper.";

	@Setter
	private JdbcTemplate jdbcTemplate;
	
	@Setter
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void dropCustomer() {
		String sql = "DROP TABLE customer ";
		jdbcTemplate.update(sql);
		
	}

	@Override
	public void createCustomer() {
		String sql = "CREATE TABLE customer ("
				+ "NUMBER INT NOT NULL PRIMARY KEY AUTO_INCREMEMT, "
				+ "S_NAME varchar(10) null, "
				+ "DATE Date null, "
				+ "Hour VARCHAR(10) NULL, "
				+ "Division VARCHAR(10), "
				+ "U_NUMBER INT NULL"
				+ ")";
		jdbcTemplate.update(sql);
		
	}

	@Override
	public void deleteCustomer() {
		String sql = "DELETE FROM customer";
		jdbcTemplate.update(sql);
		
	}

	@Override
	public void insertCustomer(List<CustomerVO> customers) {
		
		sqlSessionTemplate.insert(mapper + "insertCustomer", customers);
		
	}
}
