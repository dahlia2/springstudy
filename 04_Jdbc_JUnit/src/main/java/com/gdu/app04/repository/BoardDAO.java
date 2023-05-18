package com.gdu.app04.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.gdu.app04.domain.BoardDTO;

@Repository  // DAO가 사용하는 @Component
             // Spring Container에 Bean이 등록될 때 Singleton으로 등록되기 때문에 별도의 Singleton Pattern 코드를 작성할 필요가 없다.
public class BoardDAO {

	// jdbc 방식
	private Connection con;
	private PreparedStatement ps;  // 쿼리문의 ? 채워줄 때
	private ResultSet rs;		   // SELECT할 때 사용 
	private String sql;
	
	
	// [공통 메소드] 데이터베이스 가져옴
	// private 메소드 - 1 (BoardDAO 클래스 내부에서만 사용)
	public Connection getConnection() {
		try {
			
			Class.forName("oracle.jdbc.OracleDriver");  // ojdbc8.jar 메모리 로드  (DriverManager에 등록)
			return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "GDJ61", "1111");
		
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// [공통 메소드] 자원 받납
	// private 메소드 - 2 (BoardDAO 클래스 내부에서만 사용)
	private void close() {
		try {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(con != null) con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// DAO 메소드 (BoardServiceImpl 클래스에서 사용하는 메소드)
	// DAO 메소드명
	// 방법1. BoardServiceImpl의 메소드와 이름을 맞춤
	// 방법2. DB 친화적으로 새 이름을 부여 (이론상 권장)
	
	// [ 1. 게시글 목록 ] 호출하면 -> List<BoardDTO> board의 배열(게시글들) 반납
	public List<BoardDTO> selectBoardList() {
		
		
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			con = getConnection();
			sql = "SELECT BOARD_NO, TITLE, CONTENT, WRITER, CREATED_AT, MODIFIED_AT FROM BOARD ORDER BY BOARD_NO DESC";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				// rs가 쿼리 한 줄씩 읽어온 걸로 DTO 생성자를 통해 필드값을 넣어줌
				BoardDTO board = new BoardDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
				// 모든 쿼리를 넣은 board을 list에 추가
				list.add(board);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	// [ 2. 상세 조회 ] 게시글 번호 주면 -> board(게시글 하나) 객체 반납
	public BoardDTO selectBoardByNo(int board_no) {
		BoardDTO board = null;
		try {
			con = getConnection();
			sql = "SELECT BOARD_NO, TITLE, CONTENT, WRITER, CREATED_AT, MODIFIED_AT FROM BOARD WHERE BOARD_NO = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, board_no);
			rs = ps.executeQuery();  // ps 덕분에 ?에 boardno을 넣은 쿼리가 업데이트! -> rs가 한 줄씩 담음. 
			if(rs.next()) {
				board = new BoardDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return board;
	}
	
	// [ 3. 게시글 삽입 ] board 객체를 주면 -> 성공 1, 실패 0 번호 반납
	public int insertBoard(BoardDTO board) {
		int result = 0;
		try {
			con = getConnection();
			sql = "INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL), ?, ?, ?, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'), TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'))";
			ps = con.prepareStatement(sql);
			ps.setString(1, board.getTitle());
			ps.setString(2, board.getContent());
			ps.setString(3, board.getWriter());
			result = ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	// [ 4. 게시글 수정 ] 게시글 번호 주면 -> board(게시글 하나) 객체 반납
	public int updateBoard(BoardDTO board) {
		int result = 0;
		try {
			con = getConnection();
			// 작성자와 생성날짜는 수정할 수 없으니 작성 X
			sql = "UPDATE BOARD SET TITLE = ?, CONTENT = ?, MODIFIED_AT = TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') WHERE BOARD_NO = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, board.getTitle());
			ps.setString(2, board.getContent());
			ps.setInt(3, board.getBoard_no());
			result = ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	// [ 5. 게시글 삭제 ] 게시글 번호 주면 -> 성공 1, 실패 0 번호반납
	public int deleteBoard(int board_no) {
		int result = 0;
		try {
			con = getConnection();
			sql = "DELETE FROM BOARD WHERE BOARD_NO = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, board_no);
			result = ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
}