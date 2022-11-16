package com.addr.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SAddrDAOImpl implements SAddrDAO{
	private static SAddrDAO instance = new SAddrDAOImpl();
	public static SAddrDAO getInstance() {
		return instance;
	}
	//��񿬰�
	private  Connection getConnection() throws Exception {
		Context  initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource  ds = (DataSource)envCtx.lookup("jdbc/jsp");
		return ds.getConnection();
	}
	
	// �߰�
	@Override
	public void addrInsert(AddrDTO addr) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = getConnection();
			String sql = "insert into address(num, name, addr, zipcode, tel) values(address_seq.nextval,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, addr.getName());
			ps.setString(2, addr.getAddr());
			ps.setString(3, addr.getZipcode());
			ps.setString(4, addr.getTel());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, ps, null);
		}
	}

	// ��ü����(�˻�x)
	@Override
	public ArrayList<AddrDTO> addrList() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<AddrDTO> arr = new ArrayList<AddrDTO>();
		
		try {
			con = getConnection();
			String sql = "select * from address order by num desc";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				AddrDTO addr = new AddrDTO();
				addr.setAddr(rs.getString("addr"));
				addr.setName(rs.getString("name"));
				addr.setNum(rs.getInt("num"));
				addr.setTel(rs.getString("tel"));
				addr.setZipcode(rs.getString("zipcode"));
				arr.add(addr);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return arr;
	}

	// �󼼺���
	@Override
	public AddrDTO addrDetail(int num) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		AddrDTO addr = null;
		
		try {
			con = getConnection();
			String sql = "select * from address where num="+num;
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				addr = new AddrDTO();
				addr.setAddr(rs.getString("addr"));
				addr.setName(rs.getString("name"));
				addr.setTel(rs.getString("tel"));
				addr.setZipcode(rs.getString("zipcode"));
				addr.setNum(rs.getInt("num"));
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return addr;
	}

	// ����
	@Override
	public void addrUpdate(AddrDTO addr) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = getConnection();
			String sql = "update address set name=?, addr=?, zipcode=?, tel=? where num=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, addr.getName());
			ps.setString(2, addr.getAddr());
			ps.setString(3, addr.getZipcode());
			ps.setString(4, addr.getTel());
			ps.setInt(5, addr.getNum());
			ps.executeUpdate();
	 } catch (Exception e) {
		e.printStackTrace();
	} finally {
		closeConnection(con, ps, ps, null);
	}
}

	// ����
	@Override
	public void addrDelete(int num) {
		Connection con = null;
		Statement st = null;
		
		try {
			con = getConnection();
			String sql = "delete from address where num="+num;
			st = con.createStatement();
			st.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, null);
		}
		
		
	}

	// ��ü����(�˻�)
	@Override
	public ArrayList<AddrDTO> addrSearchList(String field, String word) {
		
		return null;
	}

	// ����(�˻�x)
	@Override
	public int addrCount() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		
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
		}
		return count;
	}

	// ����(�˻�)
	@Override
	public int addrSearchCount(String field, String word) {
		return 0;
	}

	// �����ȣ �˻�
	@Override
	public ArrayList<ZipDTO> addrZipRead(String dong) {
		Connection con = null;
		Statement st= null;
		ResultSet rs = null;
		ArrayList<ZipDTO> zarr = new ArrayList<ZipDTO>();
		
		try {
			con = getConnection();
			String sql = "select * from zipcode where dong like '%"+dong+"%'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				ZipDTO z = new ZipDTO();
				z.setBunji(rs.getString("bunji"));
				z.setDong(rs.getString("dong"));
				z.setGugun(rs.getString("gugun"));
				z.setSido(rs.getString("sido"));
				z.setZipcode(rs.getString("zipcode"));
				z.setSeq(rs.getInt("seq"));
				zarr.add(z);
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return zarr;
	}
	
	// �ݱ�
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
