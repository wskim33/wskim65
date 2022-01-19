package com.team4.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.team4.vo.LineVO;

@Mapper
public interface LineMapper {


	List<LineVO> selectAvgUnumber();

	List<LineVO> selectDateLine();

	List<LineVO> selectMonDay();

	List<LineVO> selectDay(@Param("month") String month);

	List<LineVO> selectAVGandDivision(@Param("month") String month,@Param("days") String days);

	List<LineVO> sAll(String month);


	
	

}
