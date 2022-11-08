package com.jqueryAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JAddressDAOImpl implements JAddressDAO{

	// 인터페이스는 객체를 생성x
	// 앞에 인터페이스형 new 뒤에는 클래스형이 들어가도 상관x
	private static JAddressDAO instance = new JAddressDAOImpl();  
	public static JAddressDAO getInstance() {  // 외부에서 접근하기 위해서 
		return instance;
	}
	
	// DB 연결(dbcp 사용)
	private Connection getConnection() throws Exception {  // naming을 이용해서 DB접근함
		Context initCtx = new InitialContext();  
		Context envCtx = (Context)initCtx.lookup("java:comp/env");  //톰캣에 있는 java:comp/env밑에 이름을 등록해놓고 
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jsp");  // jdbc/jsp를 찾아오겠다.
		return ds.getConnection();
	}
	
	// 추가
	@Override
	public void insert(AddressVO avo) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = getConnection();
			String sql = "insert into address values(address_seq.nextval,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, avo.getName());
			ps.setString(2, avo.getAddr());
			ps.setString(3, avo.getZipcode());
			ps.setString(4, avo.getTel());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, ps, null);
		}
	}

	//전체보기
	@Override
	public ArrayList<AddressVO> list() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<AddressVO> varr = new ArrayList<AddressVO>();
		
		try {
			con = getConnection();
			String sql = "select * from address order by num desc";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				AddressVO vad = new AddressVO();
				vad.setNum(rs.getInt("num"));
				vad.setAddr(rs.getString("addr"));
				vad.setName(rs.getString("name"));
				vad.setTel(rs.getString("tel"));
				vad.setZipcode(rs.getString("zipcode"));
				varr.add(vad);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, null);
		}
		return varr;
	}

	// 상세보기
	@Override
	public AddressVO findByNum(int num) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		AddressVO vad = null;
		
		try {
			con = getConnection();
			String sql = "select * where address num="+num;
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				vad = new AddressVO();
				vad.setAddr(rs.getString("addr"));
				vad.setName(rs.getString("name"));
				vad.setNum(rs.getInt("num"));
				vad.setTel(rs.getString("tel"));
				vad.setZipcode(rs.getString("zipcode"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return vad;
	}

	// 카운트
	@Override
	public int getCount() {
		int count =0;
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			String sql = "select count(*) from address";
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
	
	
	//수정
	@Override
	public void update(AddressVO avo) {
		
	}

	
	// 삭제
	@Override
	public void delete(int num) {
		
	}
	
	// 우편번호 검색
	@Override
	public ArrayList<ZipCodeVO> getZipcode(String dong) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<ZipCodeVO> zarr = new ArrayList<ZipCodeVO>();
				
		try {
			con = getConnection();
			String sql = "select * from zipcode where dong like '%"+dong+"%'";
			//System.out.println(sql);
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				ZipCodeVO z = new ZipCodeVO();
				z.setBunji(rs.getString("bunji"));
				z.setDong(rs.getString("dong"));
				z.setGugun(rs.getString("gugun"));
				z.setSeq(rs.getInt("seq"));
				z.setSido(rs.getString("sido"));
				z.setZipcode(rs.getString("zipcode"));
				zarr.add(z);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return zarr;
	}
	
	
	// DB연결 해제
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
