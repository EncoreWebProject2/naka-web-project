package com.naka.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.naka.vo.RankVO;
import com.naka.vo.RecruitVO;

public class RankDAOImpl implements RankDAO {
	private static RankDAOImpl instance = new RankDAOImpl();
	private DataSource ds;

	public RankDAOImpl() {
//		try {
//			Class.forName(ServerInfo.DRIVER_NAME);
//			System.out.println("드라이버 로딩 성공...");
//			
//		}catch(ClassNotFoundException e) {
//			System.out.println("드라이버 로딩 실패...");
//		}
		try {
			InitialContext ic = new InitialContext();
			ds = (DataSource) ic.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
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

//	public Connection getConnection() throws SQLException {		
//		System.out.println("디비연결 성공....");
//		return DriverManager.getConnection(ServerInfo.URL,ServerInfo.USER, ServerInfo.PASS);
//	}
	@Override
	public void closeAll(PreparedStatement ps, Connection con) {
		try {
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
		}
	}

	@Override
	public void closeAll(ResultSet rs, PreparedStatement ps, Connection con) {
		closeAll(ps, con);
		try {
			if (rs != null)
				rs.close();
		} catch (Exception e) {
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
			String query = "SELECT name,value FROM ranking WHERE id LIKE 't%' ORDER BY value DESC LIMIT 20;";
			ps = con.prepareStatement(query);

			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new RankVO(rs.getString("name"), rs.getInt("value")));	
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, ps, con);
		}
		return list;
	}

	@Override
	public ArrayList<RankVO> getPositionRank() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		ArrayList<RankVO> list = new ArrayList<RankVO>();
		try {
			con = getConnection();
			String query = "SELECT name,value FROM ranking WHERE id LIKE 'p%' ORDER BY value DESC LIMIT 10;";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(new RankVO(rs.getString("name"), rs.getInt("value")));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, ps, con);
		}
		return list;
	}

	@Override
	public ArrayList<RankVO> getTypeRate() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		ArrayList<RankVO> list = new ArrayList<RankVO>();
		try {
			con = getConnection();
			String query = "SELECT name,value FROM ranking WHERE id LIKE 'j%' ORDER BY value DESC;";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new RankVO(rs.getString("name"), rs.getInt("value")));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, ps, con);
		}
		return list;
	}

	@Override
	public void refreshRank() {
		ArrayList<RecruitVO> list = new ArrayList<RecruitVO>();
		list.add(null);

		HashMap<String, Integer> tech_map = new HashMap<String, Integer>();
		HashMap<String, Integer> position_map = new HashMap<String, Integer>();
		HashMap<String, Integer> job_type_map = new HashMap<String, Integer>();

		for (int i = 1; list.size() != 0; i++) {
			list = RecruitDAOImpl.getInstance().getRecruits(i);
			for (RecruitVO vo : list) {
				for (String s : vo.getTech().split(", ")) {
					if(s.equals(""))continue;
					tech_map.put(s, tech_map.getOrDefault(s, 0) + 1);
				}
				for (String s : vo.getPosition().split(", ")) {
					if(s.equals(""))continue;
					position_map.put(s, position_map.getOrDefault(s, 0) + 1);
				}
				for (String s : vo.getJob_type().split("/")) {
					if(s.equals(""))continue;
					job_type_map.put(s, job_type_map.getOrDefault(s, 0) + 1);
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

			for (Map.Entry<String, Integer> entry : tech_map.entrySet()) {
				ps.setString(1, "t_" + i++);
				ps.setString(2, entry.getKey());
				ps.setInt(3, entry.getValue());
				ps.executeUpdate();
			}
			for (Map.Entry<String, Integer> entry : position_map.entrySet()) {
				ps.setString(1, "p_" + i++);
				ps.setString(2, entry.getKey());
				ps.setInt(3, entry.getValue());
				ps.executeUpdate();
			}
			for (Map.Entry<String, Integer> entry : job_type_map.entrySet()) {
				ps.setString(1, "j_" + i++);
				ps.setString(2, entry.getKey());
				ps.setInt(3, entry.getValue());
				ps.executeUpdate();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, ps, con);
		}

	}
//	public static void main(String[] args) throws Exception {
//		RankDAOImpl dao = new RankDAOImpl();
//		ArrayList<RankVO> list1 = dao.getTechRank();
//		ArrayList<RankVO> list2 = dao.getPositionRank();
//		ArrayList<RankVO> list3 = dao.getTypeRate();
//		for(RankVO vo : list3) System.out.println(vo);
//		
//	}
}