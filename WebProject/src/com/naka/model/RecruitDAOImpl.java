package com.naka.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.naka.vo.CompanyVO;
import com.naka.vo.RecruitVO;

public class RecruitDAOImpl implements RecruitDAO {
	private static RecruitDAOImpl instance = new RecruitDAOImpl();
	private DataSource ds;
	
	public RecruitDAOImpl() {
		try {
			InitialContext ic = new InitialContext();
			ds = (DataSource)ic.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			System.err.println("Datasource create Error");
		}
	}

	public static RecruitDAO getInstance() {
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
	public ArrayList<RecruitVO> getRecruits(int pageNumber) {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		ArrayList<RecruitVO> list = new ArrayList<RecruitVO>();
		try {
			con = getConnection();
			String query = "select R.* from (select * from recruit) R limit ? offset ?";
			ps = con.prepareStatement(query);
			ps.setInt(1, 4*4);
			ps.setInt(2, 4*4*pageNumber);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new RecruitVO(rs.getInt("r_id"), rs.getString("position"), rs.getString("tech"),
						rs.getString("job_type"), rs.getString("education"), rs.getString("img"), rs.getString("link"), 
						rs.getInt("c_id"), rs.getDate("exp_date"), rs.getDate("start_date"),rs.getString("title")));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(rs,ps, con);
		}
		
		return list;
	}

	@Override
	public RecruitVO getRecruit(int r_id) {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		RecruitVO vo = null;
		
		try {
			con = getConnection();
			String query = "select * from recruit where r_id=?";
			ps = con.prepareStatement(query);
			
			ps.setInt(1, r_id);			
			rs = ps.executeQuery();
			System.out.println("ok");
			if(rs.next()) {
				vo =new RecruitVO(rs.getInt("r_id"), rs.getString("position"), rs.getString("tech"),
						rs.getString("job_type"), rs.getString("education"), rs.getString("img"), rs.getString("link"), 
						rs.getInt("c_id"), rs.getDate("exp_date"), rs.getDate("start_date"),rs.getString("title"));
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(rs,ps, con);
		}
		return vo;
	}
	
	@Override
	public CompanyVO getCompany(int c_id) {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		CompanyVO vo = null;
		
		try {
			con = getConnection();
			String query = "select * from company where c_id=?";
			ps = con.prepareStatement(query);
			
			ps.setInt(1, c_id);			
			rs = ps.executeQuery();
			System.out.println("company ok");
			if(rs.next()) {
				vo =new CompanyVO(rs.getInt("c_id"),rs.getString("company_name"),rs.getString("logo_img"));					
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(rs,ps, con);
		}
		return vo;
	}
	

	@Override
	public ArrayList<RecruitVO> searchRecruits(String position, String job_type, String education, String keyword,
			String scrap,int pageNumber ) {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		ArrayList<RecruitVO> list = new ArrayList<RecruitVO>();
		try {
			con = getConnection();
			String query = "select R.* from (select * from recruit where position=? and job_type=? and education = ? and r_id in (?) ) R limit 0,10";
			ps = con.prepareStatement(query);
	
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(rs,ps, con);
		}

		return list;
	}

}
