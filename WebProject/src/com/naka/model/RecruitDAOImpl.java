package com.naka.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

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
			String query = "select * from recruit where limit ? offset ?";
			ps = con.prepareStatement(query);
			ps.setInt(1, 4*4*pageNumber);
			ps.setInt(2, 4*4);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new RecruitVO(rs.getInt("r_id"), rs.getString("position"), rs.getString("language"),
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
			
			rs = ps.executeQuery();
			if(rs.next()) {
				vo =new RecruitVO(rs.getInt("r_id"), rs.getString("position"), rs.getString("language"),
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
	public ArrayList<RecruitVO> searchRecruits(String position, String job_type, String education, String keyword,
			String scrap,int pageNumber ) {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		ArrayList<RecruitVO> list = new ArrayList<RecruitVO>();
		try {
			con = getConnection();
			String query = "select * from recruit where";

			if(position!=null)
				query+=" position = ? and";
			if(job_type!=null)
				query+=" job_type = ? and";
			if(education!=null) 
				query+=" education = ? and";
			if(keyword!=null)
				query+=" title = ? and";
			
			String[] scraps = scrap.split(" ");
			if(scraps.length>0) {
				query+=" r_id in (";
				for(int i=0;i<scraps.length;i++) {
					query+= " ?, ";
				}
				query+=" )";
			}
			
			query += "limit ? offset ?";
			
			// query 작성끝
			
			int index=0;
			ps = con.prepareStatement(query);
			if(position!=null)
				ps.setString(++index, position);
			if(job_type!=null)
				ps.setString(++index, job_type);
			if(education!=null) 
				ps.setString(++index, education);
			if(keyword!=null)
				ps.setString(++index, keyword);
			
			for(int i=0;i<scraps.length;i++) {
				ps.setString(++index, scraps[i]);
			}
			
			ps.setInt(++index, 4*4*pageNumber);
			ps.setInt(++index, 4*4);		
			
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new RecruitVO(rs.getInt("r_id"), rs.getString("position"), rs.getString("language"),
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

}
