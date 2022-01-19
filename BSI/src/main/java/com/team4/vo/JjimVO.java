package com.team4.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class JjimVO {
	
	private	int snumber;
	private String sname;
	private String memberId;
	private Date regDate;
	private int count;
	
}