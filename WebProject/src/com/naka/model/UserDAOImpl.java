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
				
		Date utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(vo.getBirth_day());
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime()); 
		//System.out.println("utilDate: "+utilDate);
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

			System.out.println(ps.executeUpdate()+"row가 삽입되었다.");
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
			String query = "SELECT name, address, phone, status, email, job_field, education, birth_day FROM user WHERE u_id=? AND password=?";
			ps = conn.prepareStatement(query);
			
			ps.setString(1, id);
			ps.setString(2,  password);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				vo=  new UserVO(id, 
							      null, 
							      rs.getString("name"), 
							      rs.getString("address"), 
							      rs.getString("phone"), 
							      rs.getString("status"), 
							      rs.getString("email"), 
							      rs.getString("job_field"), 
							      rs.getString("education"), 
							      rs.getString("birth_day"));
			}
			
		}finally {
			closeAll(rs, ps, conn);
		}
		return vo;
	}
	
	@Override
	public UserVO updateInfo(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		UserVO vo = null;
		
		try {
			conn = getConnection();
			String query = "SELECT name, address, phone, status, email, job_field, education, birth_day FROM user WHERE u_id=?";
			ps = conn.prepareStatement(query);
			
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				vo=  new UserVO(id, 
							      null, 
							      rs.getString("name"), 
							      rs.getString("address"), 
							      rs.getString("phone"), 
							      rs.getString("status"), 
							      rs.getString("email"), 
							      rs.getString("job_field"), 
							      rs.getString("education"), 
							      rs.getString("birth_day"));
			}
			
		}finally {
			closeAll(rs, ps, conn);
		}
		return vo;
	}

	@Override
	public void changeUserInfo(UserVO vo) throws SQLException, ParseException {
		Connection conn = null;
		PreparedStatement ps = null;
		try{
			conn=  getConnection();
			String query = "UPDATE user SET name = ?, address=?, phone=?, status=?, email=?, job_field=?, education=? WHERE u_id = ?";
			ps = conn.prepareStatement(query);
			System.out.println("PreparedStatement 생성됨...changeUserInfo");
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getAddress());
			ps.setString(3, vo.getPhone());
			ps.setString(4, vo.getStatus());
			ps.setString(5, vo.getEmail());
			ps.setString(6, vo.getJob_field());
			ps.setString(7, vo.getEducation());
			ps.setString(8, vo.getU_id());
			
			System.out.println(ps.executeUpdate()+"row가 수정되었다.");
		}finally{
			closeAll(ps, conn);
		}
		
	}

	@Override
	public void changePassword(String id, String newPassword, String salt) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try{
			conn=  getConnection();
			String query = "UPDATE user SET password = ?, salt = ? WHERE u_id = ?";
			ps = conn.prepareStatement(query);
			System.out.println("PreparedStatement 생성됨...registerMember");
			ps.setString(1, newPassword);
			ps.setString(2, salt);
			ps.setString(3, id);
			
			System.out.println(ps.executeUpdate()+"row가 수정되었다.");
		}finally{
			closeAll(ps, conn);
		}
		
	}

	@Override
	public String[] checkPassword(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String salt="";
		String password="";
		String[] arr= new String[2];
		try{
			conn=  getConnection();
			String query = "SELECT password, salt FROM user WHERE u_id=?";
			ps = conn.prepareStatement(query);
			System.out.println("PreparedStatement 생성됨...registerMember");
			ps.setString(1, id);
			rs = ps.executeQuery();
			System.out.println("rs: "+rs);
			
			if(rs.next()) {
				password = rs.getString("password");
				salt = rs.getString("salt");
				arr[0]=password;
				arr[1]= salt;
				System.out.println("array: "+arr);
			}
		}finally{
			closeAll(ps, conn);
		}
		return arr;
	}

}
