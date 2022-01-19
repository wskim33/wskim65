package com.team4.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

	private int boardNo;
	private String title;
	private String memberId;
	private String content;
	private int readCount;
	private boolean deleted;
	private Date regDate;
	
}
