package com.gdu.app06.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardDTO {
	
	public int board_no;
	public String title;
	public String content;
	public String writer;
	public String created_at;
	public String modified_at;

}