package com.member.board.dto;

import lombok.Data;

@Data
public class CommentDTO {
	private long c_number;
	private long b_number;
	private String c_writer;
	private String c_contents;
	private String c_date;
}
