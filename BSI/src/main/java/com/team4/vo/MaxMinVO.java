package com.team4.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MaxMinVO {
	
	private String sname;
	private	String date;
	private String hour;
	private String division;
	private int unumber;
	private int sum;
}
