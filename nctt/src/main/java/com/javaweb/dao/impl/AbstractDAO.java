package com.javaweb.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import com.javaweb.dao.GenericDAO;
import com.javaweb.mapper.RowMapper;

public class AbstractDAO<T> implements GenericDAO<T> {
	  ResourceBundle resourceBundle = ResourceBundle.getBundle("db");
	public Connection getConnection() {
		try {
//			Class.forName("com.mysql.cj.jdbc.Driver");
//			String url = "jdbc:mysql://127.0.0.1:3306/javaweb";
//			String userName = "root";
//			String password = "Sdt0337246997";
			
			Class.forName(resourceBundle.getString("driverName"));
			String url = resourceBundle.getString("url");
			String userName = resourceBundle.getString("userName");
			String password = resourceBundle.getString("password");
			
			return DriverManager.getConnection(url, userName, password);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}

	public void setParameters(PreparedStatement stm, Object... parameters) {
		for (int i = 0; i < parameters.length; i++) {
			Object parameter = parameters[i];
			int index = i + 1;
			try {
			if (parameter instanceof Long) {
					stm.setLong(index, (Long) parameter);
			}
			if (parameter instanceof String) {
				stm.setString(index, (String) parameter);
			}
			if (parameter instanceof java.sql.Timestamp) {
				stm.setTimestamp(index, (java.sql.Timestamp) parameter);
			}
			if (parameter instanceof Integer) {
				stm.setInt(index, (Integer) parameter);
			}
		
		
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
	}

	@Override
	public List<T> query(String sql, RowMapper<T> rm, Object... parameters) {
		List<T> results = new ArrayList<T>();
		//String sql = "SELECT * FROM news WHERE categoryid = ?";
		PreparedStatement stm = null;
		//Ket noi mysql
		Connection conn = getConnection();
		ResultSet resultSet = null;
		
		if (conn != null) {
			try {
				stm = conn.prepareStatement(sql);
				setParameters(stm, parameters);
				resultSet = stm.executeQuery();
				while(resultSet.next()) {
					results.add(rm.rowMapper(resultSet));
				}
				return results;
			} catch (SQLException e) {
				return null;
			} finally {
				try {
					if (conn != null) {
						conn.close();
					}
					if (stm != null) {
						stm.close();
					}
					if (resultSet != null) {
						resultSet.close();
					}
				} catch (SQLException e) {
					return null;
				}
				
			}
		}
		return null;
	}

	@Override
	public Long insert(String sql, Object... parameters) {
		Connection conn = null;
		PreparedStatement stm = null;
		ResultSet resultSet = null;
		Long id = null;
		try {
			conn = getConnection();
			if (conn != null) {
				conn.setAutoCommit(false);
				stm = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				setParameters(stm, parameters);
				stm.executeUpdate();
				resultSet = stm.getGeneratedKeys();
				if (resultSet.next()) {
					id = resultSet.getLong(1);
				}
				conn.commit();
				return id;
			}

		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			return null;
		}
		return id;
	}
	

	@Override
	public void update(String sql, Object... parameters) {
		Connection conn = null;
		PreparedStatement stm = null;

		try {
			conn = getConnection();
			if (conn != null) {
				conn.setAutoCommit(false);
				stm = conn.prepareStatement(sql);
				setParameters(stm, parameters);
				stm.executeUpdate();
				conn.commit();
			}

		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
	}
		

}
