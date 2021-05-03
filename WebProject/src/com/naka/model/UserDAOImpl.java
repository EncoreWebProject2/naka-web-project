package com.naka.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.naka.vo.UserVO;

public class UserDAOImpl implements UserDAO {

	private static UserDAOImpl instance = new UserDAOImpl();
	private DataSource ds;
	
	public UserDAOImpl() {
		try {
			InitialContext ic = new InitialContext();
			ds = (DataSource)ic.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			System.err.println("Datasource create Error");
		}
	}

	public static UserDAO getInstance() {
		return instance;
	}

	@Override
	public Connection getConnection() throws SQLException {
		return ds.getConnection();
	}

	@Override
	public void closeAll(PreparedStatement ps, Connection con) {
		try {
			if(ps!=null)
				ps.close();
			if(con!=null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void closeAll(ResultSet rs, PreparedStatement ps, Connection con) {
		closeAll(ps,con);
		try {
			if(rs!=null)
				rs.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public UserVO login(String id, String password) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		UserVO vo = null;
		
		try {
			conn = getConnection();
			String query = "SELECT name, email FROM user WHERE u_id=? AND password=?";
			ps = conn.prepareStatement(query);
			
			ps.setString(1, id);
			ps.setString(2,  password);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				vo=  new UserVO(id, 
							      password, 
							      rs.getString("name"), 
							      rs.getString("email"));
			}
			
		}finally {
			closeAll(rs, ps, conn);
		}
		return vo;
	}

}
