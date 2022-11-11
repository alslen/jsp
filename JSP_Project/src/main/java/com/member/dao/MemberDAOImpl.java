package com.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.member.dto.MemberDTO;

public class MemberDAOImpl implements MemberDAO{
	
	private static MemberDAO instance = new MemberDAOImpl();
	public static MemberDAO getInstance() {
		return instance;
	}
	// 디비 연결
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context evnCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)evnCtx.lookup("jdbc/jsp");
		return ds.getConnection();
		
	}
	
	// 추가
	@Override
	public void memberInsert(MemberDTO member) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = getConnection();
			String sql = "insert into memberdb(name,userid,pwd,email,phone,admin)"
					+ " values(?,?,?,?,?,?)";
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
	public ArrayList<MemberDTO> memberList() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<MemberDTO> arr = new ArrayList<MemberDTO>();
		
		try {
			con = getConnection();
			String sql ="select * from memberdb";
			st = con.createStatement();
			rs = st.executeQuery(sql);

			while(rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setEmail(rs.getString("email"));
				member.setName(rs.getString("name"));
				member.setPhone(rs.getString("phone"));
				member.setUserid(rs.getString("userid"));
				member.setPwd(rs.getString("pwd"));
				member.setAdmin(rs.getInt("admin"));
				arr.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			closeConnection(con, null, st, rs);
		}
		return arr;
	}

	// 수정
	@Override
	public void memberUpdate(MemberDTO member) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = getConnection();
			String sql ="update memberdb set name=?, pwd=?, phone=?, email=?, admin=? where userid=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getName());
			ps.setString(2, member.getPwd());
			ps.setString(3, member.getPhone());
			ps.setString(4, member.getEmail());
			ps.setInt(5, member.getAdmin());
			ps.setString(6, member.getUserid());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, ps, null);
		}
	}

	// 삭제
	@Override
	public void memberDelete(String userid) {
		Connection con=null;
		Statement st= null;
		
		try {
			con = getConnection();
			String sql= "delete from memberdb where userid='"+userid+"'";
			st = con.createStatement();
			st.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, null);
		}
		
	}

	// 상세보기
	@Override
	public MemberDTO findById(String userid) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		MemberDTO member = null;
		
		try {
			con = getConnection();
			String sql = "select * from memberdb where userid='"+userid+"'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				member = new MemberDTO();
				member.setAdmin(rs.getInt("admin"));
				member.setEmail(rs.getString("email"));
				member.setName(rs.getString("name"));
				member.setPhone(rs.getString("phone"));
				member.setPwd(rs.getString("pwd"));
				member.setUserid(rs.getString("userid"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return member;
	}

	// 아이디 중복확인
	@Override
	public String idCheck(String userid) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		String flag = "yes";  // 사용가능
		try {
			con = getConnection();
			// sql에서 문자열이 나오는 값은 꼭 따옴표를 입력해줘야한다.
			String sql = "select * from memberdb where userid ='"+userid+"'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				flag = "no";  // 사용불가
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return flag;
	}

	// 로그인체크
	@Override
	public int loginCheck(String userid, String pwd) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int flag = -1;  // 회원아님(-1), 회원 성공(0), 비번 오류(2)
	
		try {
			con = getConnection();
			String sql = "select pwd,admin from memberdb where userid='"+userid+"'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {  // 회원이거나 비번오류
				if(rs.getString("pwd").equals(pwd)) {  // 회원(입력한 비번이 맞는지 검사)
					flag = rs.getInt("admin");  // 1: 관리자, 0 : 일반회원
				} else {   // 회원이지만 비번오류
					flag = 2;
				}
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return flag;
	}

	// 회원수
	@Override
	public int getCount() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			con = getConnection();
			String sql = "select count(*) from memberdb";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return count;
	}
	

	// 닫기
	private void closeConnection(Connection con, PreparedStatement ps,
			Statement st, ResultSet rs) {
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
