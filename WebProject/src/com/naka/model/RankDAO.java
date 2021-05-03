package com.naka.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.naka.vo.RankVO;


public interface RankDAO {
	public Connection getConnection() throws SQLException;
	public void closeAll(PreparedStatement ps, Connection con);
	public void closeAll(ResultSet rs,PreparedStatement ps, Connection con);
	public ArrayList<RankVO> getLangRank();
	public ArrayList<RankVO> getPositionRank();
	public ArrayList<RankVO> getTypeRate();
	public void refreshRank();
}
