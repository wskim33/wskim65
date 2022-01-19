package com.team4.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TimeCustomersVO {
	private String sname;
	private String date;
	private String hour;
	private String division;
	private int unumber;
	private int avgnumber;

	
}
