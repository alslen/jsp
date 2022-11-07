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
			ps.setString(2, ad.getAddr());
			ps.setString(3, ad.getZipcode());
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
			String sql = "select * from address order by num desc";
			st = con.createStatement();  
			rs = st.executeQuery(sql);  // sql�� ����
			while(rs.next()) {
				Address ad = new Address();
				ad.setNum(rs.getInt("num"));  // get�÷�����("�÷���")
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
	
	// ī��Ʈ
	public int getCount() {
		int count = 0;
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();  // ��� ���� ����
			String sql = "select count(*) from address";  // ������ sql�� ����
			st = con.createStatement(); // Statement�ν��Ͻ��� �����Ǵ� ResultSet�ν��Ͻ��� ���¸� �ٲ��ִ� �޼ҵ�
			rs = st.executeQuery(sql);
			if(rs.next()) {
				count = rs.getInt(1); //get�÷�����(��ġ��), ��ġ���� ó�� ��ġ�� ���� 1�̴�.
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return count;
	}
	
	// �󼼺���
	public Address getDetail(int num) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		Address ad = null;  // ��ü�� �ν��ϱ� ���ؼ� ���⿡ ����
		
		try {
			con = getConnection();
			String sql = "select * from address where num="+num;  // ������ ""�ȿ� ���� ����.
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
	
	// ����
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
			ps.executeUpdate();  // sql�� �����ϱ� ���� executeUpdate()�� �� �����������
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, ps, null);
		}
	}
	// ����
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
	
	// �����ȣ �˻�
	public ArrayList<ZipCode> zipcodeRead(String dong) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<ZipCode> zarr = new ArrayList<ZipCode>();
		
		try {
			con = getConnection();
			String sql = "select * from zipcode where dong like '%"+dong+"%'"; // sql������ ���ڿ��� ǥ���� ���� ''�� �����ؾ���.
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
