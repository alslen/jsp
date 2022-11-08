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

	// �������̽��� ��ü�� ����x
	// �տ� �������̽��� new �ڿ��� Ŭ�������� ���� ���x
	private static JAddressDAO instance = new JAddressDAOImpl();  
	public static JAddressDAO getInstance() {  // �ܺο��� �����ϱ� ���ؼ� 
		return instance;
	}
	
	// DB ����(dbcp ���)
	private Connection getConnection() throws Exception {  // naming�� �̿��ؼ� DB������
		Context initCtx = new InitialContext();  
		Context envCtx = (Context)initCtx.lookup("java:comp/env");  //��Ĺ�� �ִ� java:comp/env�ؿ� �̸��� ����س��� 
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jsp");  // jdbc/jsp�� ã�ƿ��ڴ�.
		return ds.getConnection();
	}
	
	// �߰�
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

	//��ü����
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

	// �󼼺���
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

	// ī��Ʈ
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
	
	
	//����
	@Override
	public void update(AddressVO avo) {
		
	}

	
	// ����
	@Override
	public void delete(int num) {
		
	}
	
	// �����ȣ �˻�
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
	
	
	// DB���� ����
	private void closeConnection(Connection con, PreparedStatement ps, Statement st, ResultSet rs) { // ���� �����ϴ� �Լ�
		
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
