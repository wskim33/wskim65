package com.team4.dao;

import java.util.List;

import com.team4.vo.SubwayVO;

public interface SubwayDao {

	void createSubwayTable();

	void insertSubway(List<SubwayVO> subways);

	void dropSubwayTable();
	
	void deleteSubwayData();

	



}
