package com.address;

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

public class AddressDAO {  

	private static AddressDAO instance = new AddressDAO();
	public static AddressDAO getInstance() {  // 외부에서 접근하기 위해서 
		return instance;
	}
	
	// DB 연결(dbcp 사용)
	private Connection getConnection() throws Exception {  // naming을 이용해서 DB접근함
		Context initCtx = new InitialContext();  
		Context envCtx = (Context)initCtx.lookup("java:comp/env");  //톰캣에 있는 java:comp/env밑에 이름을 등록해놓고 
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jsp");  // jdbc/jsp를 찾아오겠다.
		return ds.getConnection();
	}
	
	// 추가(DB에 값 넣는것)
	public void addrInsert(Address ad) {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = getConnection();  // 연결을 설정
			String sql="insert into address values(address_seq.nextval, ?,?,?,?)"; // address_seq.nextval : 해당 시퀀스의 값을 증가시키고 싶다면
			ps=con.prepareStatement(sql);  // sql을 전달
			ps.setString(1, ad.getName());
			ps.setString(2, ad.getZipcode());
			ps.setString(3, ad.getAddr());
			ps.setString(4, ad.getTel());
			ps.executeUpdate();  // 반드시 executeUpdate()를 불러야 실행된다.
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con,ps,null,null);
		}
	}
	
	// 전체보기
	public ArrayList<Address> addressList() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Address>arr = new ArrayList<Address>();  // Address형의 값들을 저장할 참조형
		
		try {
			con = getConnection();  // 연결
			String sql = "select * from address";
			st = con.createStatement();  
			rs = st.executeQuery(sql);  // sql문 실행
			while(rs.next()) {
				Address ad = new Address();
				ad.setNum(rs.getInt("num"));
				ad.setAddr(rs.getString("addr"));
				ad.setName(rs.getString("name"));
				ad.setTel(rs.getString("tel"));
				ad.setZipcode(rs.getString("zipcode"));
				arr.add(ad);  // ArrayList에 추가함
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);  // DB연결해제
		}
		return arr;
	}
	
	// 수정
	
	// 삭제
	
	
	private void closeConnection(Connection con, PreparedStatement ps, Statement st, ResultSet rs) { // 연결 종료하는 함수
		
			try {
				if(con != null) con.close();
				if(ps != null) ps.close();
				if(st != null) st.close();
				if(rs != null) rs.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
	}
}
