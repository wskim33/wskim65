package com.team4.Service;

import java.util.List;

import com.team4.vo.LineVO;

public interface LineService {

	List<LineVO> findAvgUnumber();

	List<LineVO> findDateLine();

	List<LineVO> findMonDay();

	List<LineVO> findDay(String month);

	List<LineVO> findAVGandDivision(String month, String days);

	List<LineVO> findAll(String month);

	
	
}
