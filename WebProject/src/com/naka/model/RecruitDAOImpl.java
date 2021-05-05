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
	private int totalCount=0;
	private static RecruitDAOImpl instance = new RecruitDAOImpl();
	private DataSource ds;
	
	public RecruitDAOImpl() {
		try {
			InitialContext ic = new InitialContext();
			ds = (DataSource)ic.lookup("java:comp/env/jdbc/mysql");
			setTotalCount();
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
			String query = "select R.* from (select * from recruit) R limit ? , ?";
			ps = con.prepareStatement(query);
			ps.setInt(1, 4*4*(pageNumber-1));
			ps.setInt(2, 4*4);
			
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
	
	private void setTotalCount() {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		ArrayList<RecruitVO> list = new ArrayList<RecruitVO>();
		try {
			con = getConnection();
			String query = "select count(*) from recruit";
			ps = con.prepareStatement(query);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				this.totalCount=rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(rs,ps, con);
		}
	}
	
	@Override
	public int getTotalCount() {
		return totalCount;
	}
	
	@Override
	public int getSearchCount(String position, String job_type, String education, String keyword,String scrap) {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String[][] inputs = new String[][] {{"position",position},{"job_type",job_type},{"education",education},{"title",keyword}};
		
		ArrayList<RecruitVO> list = new ArrayList<RecruitVO>();
		try {
			con = getConnection();
			String query = "select count(*) from recruit ";
			boolean flag=false;
			for(int i=0;i<4;i++) {
				if(inputs[i][1]!=null&&!inputs[i][1].equals("")) {
					if(!flag) {
						query+="where ";
						flag=true;
					}
					else {
						query+="and ";
					}
					query+=inputs[i][0]+" like '%"+inputs[i][1]+"%' ";
				}
			}
			
			if(scrap!=null&&!scrap.equals("")) {
				if(!flag) query+="where ";
				query+= "scrap in (";
				String[] s = scrap.split(",");
				for(int i=0;i<s.length;i++) {
					query+= "'"+s[i]+(i!=s.length-1?"',":"')");
				}
			}
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;	
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
		String[][] inputs = new String[][] {{"position",position},{"job_type",job_type},{"education",education},{"title",keyword}};
		
		ArrayList<RecruitVO> list = new ArrayList<RecruitVO>();
		try {
			con = getConnection();
			String query = "select R.* from (select * from recruit ";
			boolean flag=false;
			for(int i=0;i<4;i++) {
				if(inputs[i][1]!=null&&!inputs[i][1].equals("")) {
					if(!flag) {
						query+="where ";
						flag=true;
					}
					else {
						query+="and ";
					}
					query+=inputs[i][0]+" like '%"+inputs[i][1]+"%' ";
				}
			}
			
			if(scrap!=null&&!scrap.equals("")) {
				if(!flag) query+="where ";
				query+= "scrap in (";
				String[] s = scrap.split(",");
				for(int i=0;i<s.length;i++) {
					query+= "'"+s[i]+(i!=s.length-1?"',":"')");
				}
			}
			
			
			query+=")R limit ?,?";
			
			ps = con.prepareStatement(query);
			ps.setInt(1, 4*4*(pageNumber-1));
			ps.setInt(2, 4*4);
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

}
