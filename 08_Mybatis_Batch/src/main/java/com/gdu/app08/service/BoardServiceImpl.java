package com.gdu.app08.service;

import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdu.app08.domain.BoardDTO;
import com.gdu.app08.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	// [ 게시판 전체 조회 ]
	@Override
	public List<BoardDTO> getBoardList() {
		return boardMapper.selectBoardList();
	}

	// [ 게시판 상세 조회 ]
	@Override
	public BoardDTO getBoardByNo(HttpServletRequest request) {
		// 파라미터 boardNo가 없으면(null, "") 0을 사용한다.
		String strBoardNo = request.getParameter("boardNo");
		int boardNo = 0;
		if(strBoardNo != null && strBoardNo.isEmpty() == false) {
			boardNo = Integer.parseInt(strBoardNo);
		}
		return boardMapper.selectBoardByNo(boardNo);
	}

	
	// [ 게시글 삽입 ] -> 성공시 list로 이동
	@Override
	public void addBoard(HttpServletRequest request, HttpServletResponse response) {

		// 파라미터 title, content, writer를 받아온다.
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		
		// BoardDAO로 전달할 BoardDTO를 만든다.
		BoardDTO board = new BoardDTO();
		board.setTitle(title);
		board.setContent(content);
		board.setWriter(writer);
		
		int addResult = boardMapper.insertBoard(board);
		
		try {
			
			// PrintWriter을 이용해서 response으로 jsp에 나타날 기능을 작성하기. (jspServlet에서 했던 기능)
			// Controller에서 response까지 전달하여 Service에서 응답으로 페이지 이동할 수 있게 됨
		
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			if(addResult == 1) {
				out.println("alert('게시글이 등록되었습니다.')");
				out.println("location.href='" + request.getContextPath() + "/board/list.do'");
			} else {
				out.println("alert('게시글이 등록되지 않았습니다.')");
				out.println("history.back()");
			}
			out.println("</script>");
			out.flush();
			out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	// [ 게시글 수정 ] -> 성공시 detail로 이동
	@Override
	public void modifyBoard(HttpServletRequest request, HttpServletResponse response) {
		
		// 파라미터 title, content, boardNo를 받아온다.
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		// BoardDAO로 전달할 BoardDTO를 만든다.
		BoardDTO board = new BoardDTO();
		board.setTitle(title);
		board.setContent(content);
		board.setBoardNo(boardNo);
		
		int modifyResult = boardMapper.updateBoard(board);
		
		try {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			if(modifyResult == 1) {
				out.println("alert('게시글이 수정되었습니다.')");
				out.println("location.href='" + request.getContextPath() + "/board/detail.do?boardNo=" + boardNo + "'");
			} else {
				out.println("alert('게시글이 수정되지 않았습니다.')");
				out.println("history.back()");
			}
			out.println("</script>");
			out.flush();
			out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	// [ 게시판 '하나' 삭제 ] -> 성공 시 list로 이동
	@Override
	public void removeBoard(HttpServletRequest request, HttpServletResponse response) {

		// 파라미터 boardNo를 받아온다.
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));

		int removeResult = boardMapper.deleteBoard(boardNo);
		
		try {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			if(removeResult == 1) {
				out.println("alert('게시글이 삭제되었습니다.')");
				out.println("location.href='" + request.getContextPath() + "/board/list.do'");
			} else {
				out.println("alert('게시글이 삭제되지 않았습니다.')");
				out.println("history.back()");
			}
			out.println("</script>");
			out.flush();
			out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	// [ 게시판'들' 삭제 ] -> 성공 시 list로 이동
	@Override
	public void removeBoardList(HttpServletRequest request, HttpServletResponse response) {
		
		// 파라미터 boardNoList
		// 파라미터의 배열값 -> request의 getParameterValues 메소드 활용
		String[] boarNoList = request.getParameterValues("boardNoList");
		
		int removeResult = boardMapper.deleteBoardList(Arrays.asList(boarNoList));  // Arrays.asList(boarNoList) : String[] boarNoList를 ArrayList로 바꾸는 코드
		
		try {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			if(removeResult == boarNoList.length) {
				out.println("alert('선택된 모든 게시글이 삭제되었습니다.')");
				out.println("location.href='" + request.getContextPath() + "/board/list.do'");
			} else {
				out.println("alert('선택된 게시글이 삭제되지 않았습니다.')");
				out.println("history.back()");
			}
			out.println("</script>");
			out.flush();
			out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	// [ 게시판 갯수 조회 ]
	@Override
	public void getBoardCount() {
		int boardCount = boardMapper.selectBoardCount();
		String msg = "[" + LocalDateTime.now().toString() + "] 게시글 갯수는 " + boardCount + "개입니다.";
		System.out.println(msg);
	}
	
}
