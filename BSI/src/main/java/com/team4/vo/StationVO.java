package com.team4.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class StationVO {
	private String sname;
	private int snumber;
	private String date;
	private String hour;
	private String division;
	private int unumber;
	private int ranking;
}
