package com.team4.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LineVO {

	private int line;
	private String division;
	private String sname;
	private String date;
	private int totalNumber;
	private int avgNumber;
	private String day;
	
}
