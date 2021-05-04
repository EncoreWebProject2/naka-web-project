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
	public void addScrap(String id, int r_id) throws SQLException;
	public String getScrap(String id) throws SQLException;
	public void deleteScrap(String id, int r_id) throws SQLException;
	UserVO login(String id, String password) throws SQLException;
	public boolean passcheck(String id, String password) throws SQLException;
	public void changeUserInfo(UserVO vo) throws SQLException, ParseException;
	UserVO updateInfo(String id) throws SQLException;
	public void changePassword(String id, String newPassword, String salt) throws SQLException;
	public String[] checkPassword(String id) throws SQLException;
	public boolean signout(String id, String password) throws SQLException;
}
