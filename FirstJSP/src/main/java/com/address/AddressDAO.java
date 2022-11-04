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
	public static AddressDAO getInstance() {  // �ܺο��� �����ϱ� ���ؼ� 
		return instance;
	}
	
	// DB ����(dbcp ���)
	private Connection getConnection() throws Exception {  // naming�� �̿��ؼ� DB������
		Context initCtx = new InitialContext();  
		Context envCtx = (Context)initCtx.lookup("java:comp/env");  //��Ĺ�� �ִ� java:comp/env�ؿ� �̸��� ����س��� 
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jsp");  // jdbc/jsp�� ã�ƿ��ڴ�.
		return ds.getConnection();
	}
	
	// �߰�(DB�� �� �ִ°�)
	public void addrInsert(Address ad) {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = getConnection();  // ������ ����
			String sql="insert into address values(address_seq.nextval, ?,?,?,?)"; // address_seq.nextval : �ش� �������� ���� ������Ű�� �ʹٸ�
			ps=con.prepareStatement(sql);  // sql�� ����
			ps.setString(1, ad.getName());
			ps.setString(2, ad.getZipcode());
			ps.setString(3, ad.getAddr());
			ps.setString(4, ad.getTel());
			ps.executeUpdate();  // �ݵ�� executeUpdate()�� �ҷ��� ����ȴ�.
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con,ps,null,null);
		}
	}
	
	// ��ü����
	public ArrayList<Address> addressList() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Address>arr = new ArrayList<Address>();  // Address���� ������ ������ ������
		
		try {
			con = getConnection();  // ����
			String sql = "select * from address";
			st = con.createStatement();  
			rs = st.executeQuery(sql);  // sql�� ����
			while(rs.next()) {
				Address ad = new Address();
				ad.setNum(rs.getInt("num"));
				ad.setAddr(rs.getString("addr"));
				ad.setName(rs.getString("name"));
				ad.setTel(rs.getString("tel"));
				ad.setZipcode(rs.getString("zipcode"));
				arr.add(ad);  // ArrayList�� �߰���
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);  // DB��������
		}
		return arr;
	}
	
	// ����
	
	// ����
	
	
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