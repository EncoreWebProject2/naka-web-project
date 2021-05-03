package com.naka.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.naka.vo.RankVO;

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
	public ArrayList<RankVO> getLangRank() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<RankVO> getPositionRank() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<RankVO> getTypeRate() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void refreshRank() {
		// TODO Auto-generated method stub
		
	}

}
