package com.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConnection;

public class SBoardDAOImpl implements SBoardDAO {
	private static SBoardDAO instance = new SBoardDAOImpl();
	public static SBoardDAO getInstance() {
		return instance;
	}
	
	// 추가
	@Override
	public void boardInsert(BoardDTO board) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = DBConnection.getConnection();
			String sql = "insert into simpleboard(num,userid,subject,email,content,regdate) values(simpleboard_seq.nextval, ?,?,?,?,sysdate)";
			ps = con.prepareStatement(sql);
			ps.setString(1, board.getUserid());
			ps.setString(2, board.getSubject());
			ps.setString(3, board.getEmail());
			ps.setString(4, board.getContent());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, ps, null);
		}
	}

	// 수정
	@Override
	public void boardUpdate(BoardDTO board) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = DBConnection.getConnection();
			String sql = "update simpleboard set subject=?, content=?, email=? where num=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, board.getSubject());
			ps.setString(2, board.getContent());
			ps.setString(3, board.getEmail());
			ps.setInt(4, board.getNum());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, ps, null);
		}
	}

	// 전체보기
	@Override
	public ArrayList<BoardDTO> boardList() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<BoardDTO> arr = new ArrayList<BoardDTO>();
		
		try {
			con = DBConnection.getConnection();
			String sql = "select * from simpleboard";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setContent(rs.getString("content"));
				board.setEmail(rs.getString("email"));
				board.setNum(rs.getInt("num"));
				board.setReadcount(rs.getInt("readcount"));
				board.setRegdate(rs.getString("regdate"));
				board.setSubject(rs.getString("subject"));
				board.setUserid(rs.getString("userid"));
				arr.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		
		return arr;
	}

	// 전체보기(검색)
	@Override
	public ArrayList<BoardDTO> boardList(int startRow, int endRow, String field, String word) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<BoardDTO> arr = new ArrayList<BoardDTO>();
		try {
			con = DBConnection.getConnection();
			StringBuilder sb = new StringBuilder();
			
			if(word.equals("")) {  // 검색 아님
				sb.append("select * from (");
				sb.append(" select rownum rn, aa.* from("); // aa의 모든 컬럼과 rn을 조회
				sb.append(" select * from simpleboard) aa");
				sb.append(" where rownum <= ?");
				sb.append(") where rn >= ?");
			} else {  // 검색을 하면
				sb.append("select * from (");
				sb.append(" select rownum rn, aa.* from(");
				sb.append("select * from simpleboard");
				sb.append(" where "+field+" like '%"+word+"%') aa");
				sb.append(" where rownum <= ?");
				sb.append(") where rn>=?");
			}
			//System.out.println(sb.toString());
			ps = con.prepareStatement(sb.toString());
			ps.setInt(1, endRow);
			ps.setInt(2, startRow);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setContent(rs.getString("content"));
				board.setEmail(rs.getString("email"));
				board.setReadcount(rs.getInt("readcount"));
				board.setRegdate(rs.getString("regdate"));
				board.setSubject(rs.getString("subject"));
				board.setUserid(rs.getString("userid"));
				arr.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, ps, rs);
		}
		return arr;
	}

	// 삭제
	@Override
	public void boardDelete(int num) {
		Connection con = null;
		Statement st = null;
		
		try {
			con = DBConnection.getConnection();
			String sql = "delete from simpleboard where num="+num;
			st = con.createStatement();
			st.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, null);
		}
	}

	// 게시글 수
	@Override
	public int boardCount(String field, String word) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		String sql = "";
		int count = 0;
		
		try {
			con = DBConnection.getConnection();
			if(word.equals("")) {  // 검색이 아님
				sql = "select count(*) from simpleboard";
			} else {
				sql = "select count(*) from simpleboard where "+field+" like '%"+word+"%'";
			}
			System.out.println(sql);
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	// 상세보기
	@Override
	public BoardDTO findByNum(int num) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		BoardDTO board = null;
		String sql = "";
		try {
			con = DBConnection.getConnection();
			st = con.createStatement();
			// 상세보기할 때마다 readcount(조회수) 1 증가
			sql = "update simpleboard set readcount = readcount+1 where num="+num;
			st.executeUpdate(sql);
			
			sql = "select * from simpleboard where num="+num;
			rs = st.executeQuery(sql);
			if(rs.next()) {
				board = new BoardDTO();
				board.setContent(rs.getString("content"));
				board.setEmail(rs.getString("email"));
				board.setNum(rs.getInt("num"));
				board.setReadcount(rs.getInt("readcount"));
				board.setRegdate(rs.getString("regdate"));
				board.setSubject(rs.getString("subject"));
				board.setUserid(rs.getString("userid"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return board;
	}

	// 댓글 추가
	@Override
	public void commentInsert(CommentDTO comment) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = DBConnection.getConnection();
			String sql ="insert into comboard values(comboard_seq.nextval,?,?,sysdate,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, comment.getUserid());
			ps.setString(2, comment.getMsg());
			ps.setInt(3, comment.getBnum());
			ps.executeUpdate();
		} catch (Exception e) {
			
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, ps, null);
		}
	}

	// 댓글 전체보기
	@Override
	public ArrayList<CommentDTO> findAllComment(int bnum) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<CommentDTO> carr = new ArrayList<CommentDTO>();
		try {
			con = DBConnection.getConnection();
			String sql ="select * from comboard where bnum="+bnum;
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				CommentDTO comment = new CommentDTO();
				comment.setBnum(rs.getInt("bnum"));
				comment.setCnum(rs.getInt("cnum"));
				comment.setMsg(rs.getString("msg"));
				comment.setRegdate(rs.getString("regdate"));
				comment.setUserid(rs.getString("userid"));
				carr.add(comment);
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return carr;
	}

	@Override
	public int commentCount(int bnum) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			con = DBConnection.getConnection();
			String sql = "select count(*) from comboard where bnum="+bnum;
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	// 닫기
	private void closeConnection(Connection con, PreparedStatement ps, Statement st, ResultSet rs) {
		try {
				if(con !=null) 			con.close();
				if(ps !=null) 				ps.close();
				if(st !=null) 				st.close();
				if(rs !=null) 				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}	
	}

}
