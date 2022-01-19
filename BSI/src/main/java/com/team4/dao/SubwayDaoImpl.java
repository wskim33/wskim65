package com.team4.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.jdbc.core.JdbcTemplate;

import com.team4.vo.SubwayVO;

import lombok.Setter;

public class SubwayDaoImpl implements SubwayDao{
	
	private final String mapper = "com.team4.mapper.SubwayMapper.";
	
	@Setter
	private JdbcTemplate jdbcTemplate;
	
	@Setter
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void createSubwayTable() {

		String sql = "CREATE TABLE Subway ("
				+ "s_name varchar primary key, "
				+ "Line int, "
				+ "S_number int"
				+ ")";
		jdbcTemplate.update(sql);	
	}	
	
	@Override
	public void dropSubwayTable() {
		String sql = "DROP TABLE SUBWAY ";
		jdbcTemplate.update(sql);
		
	}

	@Override
	public void deleteSubwayData() {
		String sql = "DELETE FROM SUBWAY";
		jdbcTemplate.update(sql);
		
	}

	@Override
	public void insertSubway(List<SubwayVO> subways) {
		
		sqlSessionTemplate.insert(mapper + "insertSubway", subways);		
	}

}
