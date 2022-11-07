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
			ps.setString(2, ad.getAddr());
			ps.setString(3, ad.getZipcode());
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
			String sql = "select * from address order by num desc";
			st = con.createStatement();  
			rs = st.executeQuery(sql);  // sql문 실행
			while(rs.next()) {
				Address ad = new Address();
				ad.setNum(rs.getInt("num"));  // get컬럼유형("컬럼명")
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
	
	// 카운트
	public int getCount() {
		int count = 0;
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();  // 디비 연결 설정
			String sql = "select count(*) from address";  // 실행할 sql문 지정
			st = con.createStatement(); // Statement인스턴스로 생성되는 ResultSet인스턴스의 형태를 바꿔주는 메소드
			rs = st.executeQuery(sql);
			if(rs.next()) {
				count = rs.getInt(1); //get컬럼유형(위치값), 위치값은 처음 위치의 값이 1이다.
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return count;
	}
	
	// 상세보기
	public Address getDetail(int num) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		Address ad = null;  // 객체를 인식하기 위해서 여기에 선언
		
		try {
			con = getConnection();
			String sql = "select * from address where num="+num;  // 변수는 ""안에 들어가지 못함.
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				ad = new Address();
				ad.setAddr(rs.getString("addr"));
				ad.setName(rs.getString("name"));
				ad.setNum(rs.getInt("num"));
				ad.setTel(rs.getString("tel"));
				ad.setZipcode(rs.getString("zipcode"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return ad;
	}
	
	// 수정
	public void addrUpdate(Address ad) {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = getConnection();
			String sql="update address set name=?, tel=?, zipcode=?, addr=? where num=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, ad.getName());
			ps.setString(2, ad.getTel());
			ps.setString(3, ad.getZipcode());
			ps.setString(4, ad.getAddr());
			ps.setInt(5, ad.getNum());
			ps.executeUpdate();  // sql문 실행하기 위해 executeUpdate()를 꼭 선언해줘야함
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, ps, null);
		}
	}
	// 삭제
	public void addrDelete(int num) {
		Connection con = null;
		Statement st = null;
		
		try {
			con = getConnection();
			String sql="delete from address where num="+num;
			st = con.createStatement();
			st.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, null);
		}
	}
	
	// 우편번호 검색
	public ArrayList<ZipCode> zipcodeRead(String dong) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<ZipCode> zarr = new ArrayList<ZipCode>();
		
		try {
			con = getConnection();
			String sql = "select * from zipcode where dong like '%"+dong+"%'"; // sql문에서 문자열을 표현할 때는 ''을 포함해야함.
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				ZipCode zip = new ZipCode();
				zip.setBunji(rs.getString("bunji"));
				zip.setDong(rs.getString("dong"));
				zip.setGugun(rs.getString("gugun"));
				zip.setSeq(rs.getInt("seq"));
				zip.setSido(rs.getString("sido"));
				zip.setZipcode(rs.getString("zipcode"));
				zarr.add(zip);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return zarr;
		
	}
	
	
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
