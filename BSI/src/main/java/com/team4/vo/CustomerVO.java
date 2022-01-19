package com.team4.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CustomerVO {
	private int number;
	private int snumber;
	private Date date;
	private String hour;
	private String division;
	private int unumber;
	
	public CustomerVO(int number, int snumber, Date date, String hour, String division, int unumber) {
		this.number = number;
		this.snumber = snumber;
		this.date = date;
		this.hour = hour;
		this.division = division;
		this.unumber = unumber;
	}
	
	

}

