package com.naka.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.naka.vo.RankVO;
import com.naka.vo.RecruitVO;

public class RankDAOImpl implements RankDAO{
	private static RankDAOImpl instance = new RankDAOImpl();
	private DataSource ds;
	
	public RankDAOImpl() {
		try {
			InitialContext ic = new InitialContext();
			ds = (DataSource)ic.lookup("java:comp/env/jdbc/mysql");
		}catch(Exception e) {
			System.err.println("Datasource create Error");
		}
	}
	
	public static RankDAO getInstance() {
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
		}
	}

	@Override
	public void closeAll(ResultSet rs, PreparedStatement ps, Connection con) {
		closeAll(ps,con);
		try {
			if(rs!=null)
				rs.close();
		}catch (Exception e) {
		}
	}

	@Override
	public ArrayList<RankVO> getTechRank() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		ArrayList<RankVO> list = new ArrayList<RankVO>();
		try {
			con = getConnection();
			
		}catch(Exception e) {
			
		}finally {
			closeAll(rs, ps, con);
		}
		return null;
	}

	@Override
	public ArrayList<RankVO> getPositionRank() {
		return null;
	}

	@Override
	public ArrayList<RankVO> getTypeRate() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void refreshRank() {
		ArrayList<RecruitVO> list = new ArrayList<RecruitVO>();
		list.add(null);
		
		HashMap<String,Integer> tech_map = new HashMap<String,Integer>();
		HashMap<String,Integer> position_map = new HashMap<String,Integer>();
		HashMap<String,Integer> job_type_map = new HashMap<String,Integer>();
		
		for(int i=1;list.size()!=0;i++) {
			list = RecruitDAOImpl.getInstance().getRecruits(i);			
			for(RecruitVO vo : list) {
				for(String s : vo.getTech().split(", ")) {
					tech_map.put(s, tech_map.getOrDefault(s, 0)+1);	
				}
				for(String s : vo.getPosition().split(", ")) {
					position_map.put(s, position_map.getOrDefault(s, 0)+1);
				}
				for(String s : vo.getJob_type().split("/")) {
					job_type_map.put(s, job_type_map.getOrDefault(s, 0)+1);
				}
			}
		}
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int i = 1;
		
		try {
			con = getConnection();
			String query = "INSERT INTO ranking (id, name, value) VALUES(?,?,?)";
			ps = con.prepareStatement(query);
			
			for(Entry<String, Integer> e: tech_map.entrySet()) { 
			ps.setString(1,"t_" + i);
			ps.setString(2, e.getKey());
			ps.setInt(3, e.getValue());
			}
			for(Entry<String, Integer> e: position_map.entrySet()) { 
				ps.setString(1,"p_" + i);
				ps.setString(2, e.getKey());
				ps.setInt(3, e.getValue());
				}
			for(Entry<String, Integer> e: job_type_map.entrySet()) { 
				ps.setString(1,"j_" + i);
				ps.setString(2, e.getKey());
				ps.setInt(3, e.getValue());
				}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(rs,ps, con);
		}
		
	}
}