package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.naka.vo.RecruitVO;


public class RecruitDAO {
	private DataSource ds;
	
	private static RecruitDAO dao = new RecruitDAO();
	
	private RecruitDAO() {
		try {
			InitialContext ic = new InitialContext();
			ds = (DataSource)ic.lookup("java:comp/env/jdbc/mysql");
			System.out.println("DataSource Lookup....OK");
		} catch (NamingException e) {
			System.out.println("DataSource Lookup....Fail");
		}		
	}	
	public static RecruitDAO getInstance() {
		return dao;
	}
	

	public Connection getConnection() throws SQLException {	
		return ds.getConnection(); 
	}


	public void closeAll(PreparedStatement ps, Connection conn) throws SQLException{
		if(ps!=null) ps.close();		
		if(conn != null) conn.close();
	}


	public void closeAll(ResultSet rs, PreparedStatement ps, Connection conn) throws SQLException{		
		if(rs != null)	rs.close();
		closeAll(ps, conn);		
	}
	
	public RecruitVO getRecruit(int r_id) throws SQLException {
		RecruitVO vo = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		
		try {
			conn = ds.getConnection();
			
			String query = "select * from recruit where r_id=?";
			ps = conn.prepareStatement(query);
			
			ps.setInt(1, r_id);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				vo = new RecruitVO(rs.getInt("r_id"), 
									rs.getString("position"), 
									rs.getString("tech"), 
									rs.getString("job_type"), 
									rs.getString("education"), 
									rs.getString("img"), 
									rs.getString("link"), 
									rs.getInt("c_id"), 
									rs.getDate("exp_date"), 
									rs.getDate("exp_date"), 
									rs.getString("title"));
			}
			
		}finally {
			closeAll(rs, ps, conn);
		}
		
		
		
		return vo;
	}
	
}
