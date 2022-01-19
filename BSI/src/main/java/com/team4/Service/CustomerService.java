package com.team4.Service;

import java.util.List;

import com.team4.vo.CustomerVO;

public interface CustomerService {

	void initData(String csvPath);
	
	List<CustomerVO> readbsiFromCsv(String csvPath);
}