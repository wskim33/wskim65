package com.team4.vo;

import lombok.Data;

@Data
public class SubwayVO {
	
	private String sname;
	private int line;
	private	int snumber;
	
	public SubwayVO(String sname, int line, int snumber) {
		this.sname = sname;
		this.line = line;
		this.snumber = snumber;
	}
	
	
}