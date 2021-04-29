package com.naka.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import com.naka.vo.CompanyVO;
import com.naka.vo.RecruitVO;

public interface RecruitDAO {
	public Connection getConnection() throws SQLException;
	public void closeAll(PreparedStatement ps, Connection con);
	public void closeAll(ResultSet rs,PreparedStatement ps, Connection con);
	public ArrayList<RecruitVO> getRecruits(int pageNumber);
	public RecruitVO getRecruit(int r_id);
	public CompanyVO getCompany(int c_id);
	public ArrayList<RecruitVO> searchRecruits(String position, String job_type, String education, String keyword,
			String scrap,int pageNumber );
}
