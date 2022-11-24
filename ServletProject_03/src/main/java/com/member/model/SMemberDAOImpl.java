package com.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConnection;

public class SMemberDAOImpl implements SMemberDAO{

	private static SMemberDAO instance = new SMemberDAOImpl();
	public static SMemberDAO getInstance() {
		return instance;
	}
	
	// 추가
	@Override
	public void memberJoin(SMemberDTO member) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = DBConnection.getConnection();
			String sql = "insert into memberdb values(?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getName());
			ps.setString(2, member.getUserid());
			ps.setString(3, member.getPwd());
			ps.setString(4, member.getEmail());
			ps.setString(5, member.getPhone());
			ps.setInt(6, member.getAdmin());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, ps, null);
		}
	}

	// 전체보기
	@Override
	public ArrayList<SMemberDTO> getMember() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<SMemberDTO> arr = new ArrayList<SMemberDTO>();
		try {
			con = DBConnection.getConnection();
			String sql = "select * from memberdb";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				SMemberDTO member = new SMemberDTO();
				member.setAdmin(rs.getInt("admin"));
				member.setEmail(rs.getString("email"));
				member.setName(rs.getString("name"));
				member.setPhone(rs.getString("phone"));
				member.setPwd(rs.getString("pwd"));
				member.setUserid(rs.getString("userid"));
				arr.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return arr;
	}

	// 삭제
	@Override
	public int memberDelete(String userid) {
		Connection con = null;
		Statement st = null;
		int flag = 0;
		try {
			con = DBConnection.getConnection();
			String sql = "delete from memberdb where userid='"+userid+"'";
			System.out.println(sql);
			st = con.createStatement();
			flag = st.executeUpdate(sql);
		} catch (Exception e) {
		
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, null);
		}
		return flag;
	}

	// 수정(비밀번호가 맞을 때만 수정)
	@Override
	public int memberUpdate(SMemberDTO member) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql ="";
		int flag = 0;
		
		try {
			con = DBConnection.getConnection();
			sql = "select pwd from memberdb where userid='"+member.getUserid()+"'";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			System.out.println(sql);
			if(rs.next()) {
				if(rs.getString(1).equals(member.getPwd())) {
					sql = "update memberdb set name=?, email=?, phone=? where userid=?";
					System.out.println(sql);
					ps = con.prepareStatement(sql);
					ps.setString(1, member.getName());
					ps.setString(2, member.getEmail());
					ps.setString(3, member.getPhone());
					ps.setString(4, member.getUserid());
					flag = ps.executeUpdate();
				}
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, ps, rs);
		}
		
		return flag;
	}

	// 상세보기
	@Override
	public SMemberDTO findById(String userid) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		SMemberDTO member = null;
		
		try {
			con = DBConnection.getConnection();
			String sql ="select * from memberdb where userid='"+userid+"'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				member = new SMemberDTO();
				member.setAdmin(rs.getInt("admin"));
				member.setEmail(rs.getString("email"));
				member.setName(rs.getString("name"));
				member.setPhone(rs.getString("phone"));
				member.setPwd(rs.getString("pwd"));
				member.setUserid(rs.getString("userid"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}

	// 회원수
	@Override
	public int memberCount() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			con = DBConnection.getConnection();
			String sql = "select count(*) from memberdb";
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

	// 아이디 중복확인
	@Override
	public String memberIdCheck(String userid) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		String flag = "yes";  // 사용가능
		
		try {
			con = DBConnection.getConnection();
			String sql = "select * from memberdb where userid='"+userid+"'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {  // userid가 있으면
				flag = "no";  // 사용불가
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		
		return flag;
	}

	// 로그인 체크
	@Override
	public SMemberDTO memberLoginCheck(String userid, String pwd) {
		
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		SMemberDTO member = new SMemberDTO();
		
		// 비회원 (-1)
		member.setAdmin(-1);  // 강제적으로 값을 넣어둠
		// 회원 : 일반회원(0), 관리자(1)
		// 회원이지만 비번오류(2)
		
		try {
			con = DBConnection.getConnection();
			String sql = "select * from memberdb where userid='"+userid+"'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {  // id맞음(회원은 맞음)
				if(rs.getString("pwd").equals(pwd)) {  // 비번 맞음
					member.setAdmin(rs.getInt("admin"));
					member.setEmail(rs.getString("email"));
					member.setName(rs.getString("name"));
					member.setPhone(rs.getString("phone"));
					member.setPwd(rs.getString("pwd"));
					member.setUserid(rs.getString("userid"));					
				} else {  // 비번 틀림
					member.setAdmin(2);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return member;
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
