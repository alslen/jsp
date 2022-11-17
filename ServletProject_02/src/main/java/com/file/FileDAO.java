package com.file;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.addr.model.SAddrDAO;
import com.addr.model.SAddrDAOImpl;

public class FileDAO {
	private static FileDAO instance = new FileDAO();
	public static FileDAO getInstance() {
		return instance;
	}
	
	//디비연결
	private  Connection getConnection() throws Exception {
		Context  initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource  ds = (DataSource)envCtx.lookup("jdbc/jsp");
		return ds.getConnection();
	}
	
	// 추가
	public void fileInsert(FileDTO file) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = getConnection();
			String sql = "insert into imagetest values(?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, file.getName());
			ps.setString(2, file.getTitle());
			ps.setString(3, file.getImage());
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, ps, null);
		}
	}
	
	// 전체보기
	public ArrayList<FileDTO> fileList(){
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<FileDTO> arr = new ArrayList<FileDTO>();
		
		try {
			con = getConnection();
			st = con.createStatement();
			rs = st.executeQuery("select * from imagetest");
			while(rs.next()) {
				String name = rs.getString("name");
				String title = rs.getString("title");
				String image = rs.getString("image");
				FileDTO file = new FileDTO(name,title,image);
				arr.add(file);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, null);
		}
		return arr;
	}
	
	// 닫기
	private void closeConnection(Connection con, PreparedStatement ps, Statement st, ResultSet rs) {
			try {
				if(con !=null) 			con.close();
				if(ps !=null) 			ps.close();
				if(st !=null) 			st.close();
				if(rs !=null) 			rs.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
	}
}
