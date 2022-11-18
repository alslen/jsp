package com.product.model;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import com.product.model.ProductDAO;
import com.util.DBConnection;

public class ProductDAOImpl implements ProductDAO{
	private static ProductDAO instance = new ProductDAOImpl();
	public static ProductDAO getInstance() {
		return instance;
	}
	// 추가
	@Override
	public void productInsert(Product product) {
		Connection con = null;
		PreparedStatement ps= null;
		
		try {
			con = DBConnection.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append("insert into product");
			sb.append(" values(product_seq.nextval,?,?,?,?,?,?,?,?)");
			ps = con.prepareStatement(sb.toString());
			ps.setString(1, product.getPname());
			ps.setInt(2, product.getUnitPrice());
			ps.setString(3, product.getDescription());
			ps.setString(4, product.getCategory());
			ps.setString(5, product.getManufacturer());
			ps.setLong(6, product.getUnitsInStcok());
			ps.setString(7, product.getCondition());
			ps.setString(8, product.getFilename());
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, ps, null);
		}
	}

	// 전체보기
	@Override
	public ArrayList<Product> proudctAllfind() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Product> arr = new ArrayList<Product>();
		
		try {
			con = DBConnection.getConnection();
			String sql = "select * from product";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				Product product = new Product();
				product.setCategory(rs.getString("p_category"));
				product.setCondition(rs.getString("p_condition"));
				product.setDescription(rs.getString("p_description"));
				product.setFilename(rs.getString("p_filename"));
				product.setManufacturer(rs.getString("p_manufacturer"));
				product.setPname(rs.getString("p_pname"));
				product.setProductId(rs.getInt("p_productid"));
				product.setUnitPrice(rs.getInt("p_unitprice"));
				product.setUnitsInStcok(rs.getLong("p_unitsinstock"));
				arr.add(product);
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return arr;
	}

	// 상세보기
	@Override
	public Product findById(Long productId) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		Product product = null;
		
		try {
			con = DBConnection.getConnection();
			String sql = "select * from product where p_productid="+productId;
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				product = new Product();
				product.setCategory(rs.getString("p_category"));
				product.setCondition(rs.getString("p_condition"));
				product.setDescription(rs.getString("p_description"));
				product.setFilename(rs.getString("p_filename"));
				product.setManufacturer(rs.getString("p_manufacturer"));
				product.setPname(rs.getString("p_pname"));
				product.setProductId(rs.getLong("p_productid"));
				product.setUnitPrice(rs.getInt("p_unitprice"));
				product.setUnitsInStcok(rs.getInt("p_unitsinstock"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		
		return product;
	}
	
	// 닫기
	private void closeConnection(Connection con, PreparedStatement ps, Statement st, ResultSet rs) {
			try {
						if(con !=null) 			con.close();
						if(ps !=null) 			ps.close();
						if(st !=null) 			st.close();
						if(rs !=null) 			rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
	
}
