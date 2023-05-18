package com.gdu.app06.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdu.app06.domain.BoardDTO;
import com.gdu.app06.repository.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	
	// [ 게시판 목록 ]
	@Override
	public List<BoardDTO> getBoardList() {
		return boardDAO.selectBoardList();
	}

	
	// [ 상세 조회 ]
	@Override
	public BoardDTO getBoardByNo(int board_no) {
		return boardDAO.selectBoardByNo(board_no);
	}
	
	
	// [ 게시판 작성 추가]
	@Override
	public int addBoard(BoardDTO board) {
		return boardDAO.insertBoard(board);
	}

	
	// [ 게시판 수정 ]
	@Override
	public int modifyBoard(BoardDTO board) {
		return boardDAO.updateBoard(board);
	}

	
	// [ 게시판 삭제 ]
	@Override
	public int removeBoard(int board_no) {
		return boardDAO.deleteBoard(board_no);
	}
	
	
	// AOP를 활용한 트랜잭션 처리 테스트
	@Override
	public void testTx() {
		
		// 2개 이상의 삽입, 수정, 삭제가 하나의 서비스에서 진행되는 경우에 트랜잭션 처리가 필요하다.
		// -> 여러 번의 데베 건들이는 작업 발생시 모두 성공해야 적용시켜줌. 하나라도 안 되면 모두 실패 처리.
		
		// 성공하는 작업
		boardDAO.insertBoard(new BoardDTO(0, "트랜잭션제목", "트랜잭션내용", "트랜잭션작성자", null, null));  // RollBack
		
		// 실패하는 작업
		boardDAO.insertBoard(new BoardDTO());  // TITLE 칼럼은 NOT NULL이기 때문에 Exception이 발생한다.
		
		// 트랜잭션 처리가 된다면 모든 insert가 실패해야 한다.
		
	}

}