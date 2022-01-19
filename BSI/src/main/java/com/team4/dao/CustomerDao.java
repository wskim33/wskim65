package com.team4.dao;

import java.util.List;

import com.team4.vo.CustomerVO;

public interface CustomerDao {

	void insertCustomer(List<CustomerVO> customers);

	void deleteCustomer();

	void dropCustomer();

	void createCustomer();

}