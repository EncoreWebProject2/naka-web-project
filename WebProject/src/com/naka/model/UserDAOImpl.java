package com.naka.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.naka.vo.CompanyVO;
import com.naka.vo.RecruitVO;
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

		
	public void register(UserVO vo) throws SQLException, ParseException{
		
		int result = 0;
		
		Date utilDate = new SimpleDateFormat("YYYY-mm-dd").parse(vo.getBirth_day());
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime()); 
		Connection conn = null;
		PreparedStatement ps = null;
		try{
			conn=  getConnection();
			String query = "INSERT INTO user VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(query);
			System.out.println("PreparedStatement 생성됨...registerMember");
			ps.setString(1, vo.getU_id());
			ps.setString(2, vo.getPassword());
			ps.setString(3, vo.getName());
			ps.setString(4, vo.getAddress());
			ps.setString(5, vo.getPhone());
			ps.setString(6, vo.getStatus());
			ps.setString(7, vo.getEmail());
			ps.setString(8, vo.getJob_field());
			ps.setString(9, vo.getEducation());
			ps.setDate(10,  sqlDate);
			ps.setString(11, vo.getScrap());
			ps.setString(12, vo.getSalt());
			
			result = ps.executeUpdate();
		}finally{
			closeAll(ps, conn);
		}
		
	}
	
	public boolean isExist(String id) throws SQLException {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String query = "SELECT u_id FROM user WHERE u_id=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			
			return rs.next();
		}finally {
			closeAll(rs, ps, conn);
		}
	}
	
	public boolean passcheck(String id, String password) throws SQLException {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String query = "SELECT u_id FROM user WHERE u_id=? AND password=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			ps.setString(2, password);
			
			rs = ps.executeQuery();
			
			return rs.next();
		}finally {
			closeAll(rs, ps, conn);
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
