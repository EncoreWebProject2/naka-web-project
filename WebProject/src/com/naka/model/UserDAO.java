package com.naka.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

import javax.sql.DataSource;

import com.naka.vo.CompanyVO;
import com.naka.vo.RecruitVO;
import com.naka.vo.UserVO;

public interface UserDAO {
	public Connection getConnection() throws SQLException;
	public void closeAll(PreparedStatement ps, Connection con);
	public void closeAll(ResultSet rs,PreparedStatement ps, Connection con);
	public void register(UserVO user) throws SQLException, ParseException;
	public boolean isExist(String id) throws SQLException;
	
}
