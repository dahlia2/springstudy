package com.gdu.app05.service;

import java.util.List;

import com.gdu.app05.domain.BoardDTO;


public interface BoardService {
	
	// 서비스 계층의 메소드명은 가급적 "사용자 친화적"으로 작성하자.
	public List<BoardDTO> getBoardList();
	public BoardDTO getBoardByNo(int board_no);
	public int addBoard(BoardDTO board);
	public int modifyBoard(BoardDTO board);
	public int removeBoard(int board_no);

}
