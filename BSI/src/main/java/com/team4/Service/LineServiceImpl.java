package com.team4.Service;

import java.util.List;

import com.team4.mapper.LineMapper;
import com.team4.vo.LineVO;

import lombok.Setter;

public class LineServiceImpl implements LineService{

	@Setter
	private LineMapper lineMapper;

	@Override
	public List<LineVO> findAvgUnumber() {
		
		List<LineVO> lines = lineMapper.selectAvgUnumber();
		
		return lines;
	}

	@Override
	public List<LineVO> findDateLine() {

		List<LineVO> lines2 = lineMapper.selectDateLine();
		
		return lines2;
	}

	@Override
	public List<LineVO> findMonDay() {

		List<LineVO> date = lineMapper.selectMonDay();
		
		return date;
	}

	@Override
	public List<LineVO> findDay(String month) {

		List<LineVO> day = lineMapper.selectDay(month);
		
		return day;
	}

	@Override
	public List<LineVO> findAVGandDivision(String month, String days) {
		List<LineVO> vo = lineMapper.selectAVGandDivision(month, days);
		return vo;
	}
	
	@Override
	public List<LineVO> findAll(String month) {

		List<LineVO> vo = lineMapper.sAll(month);
		
		return vo;
	}

	
	

}
