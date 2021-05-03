package com.naka.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.naka.vo.UserVO;

public interface UserDAO {
	public Connection getConnection() throws SQLException;
	public void closeAll(PreparedStatement ps, Connection con);
	public void closeAll(ResultSet rs, PreparedStatement ps, Connection con);
	UserVO login(String id, String password) throws SQLException;	
}
