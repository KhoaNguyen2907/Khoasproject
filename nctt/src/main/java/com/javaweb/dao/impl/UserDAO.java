package com.javaweb.dao.impl;

import java.util.List;

import com.javaweb.dao.IUserDAO;
import com.javaweb.mapper.UserMapper;
import com.javaweb.model.UserModel;

public class UserDAO extends AbstractDAO<UserModel> implements IUserDAO {

	@Override
	public UserModel findByUserNameAndPasswordAndStatus(String userName, String password, int status) {
		StringBuilder sql = new StringBuilder("SELECT * FROM user AS u ");
		sql.append("INNER JOIN role AS r ON r.id = u.roleid "  );
		sql.append("WHERE username = ? AND password =? AND status = ?");
		
		
		List<UserModel> users =  query(sql.toString(),new UserMapper(),userName, password,status);
		return users.isEmpty()? null: users.get(0);
		
	
	}

	@Override
	public UserModel findOne(long id) {
		String sql = "SELECT * FROM user AS u INNER JOIN role AS r ON r.id = u.roleid WHERE u.id = ?";
		List<UserModel> users = query(sql, new UserMapper(), id);
		return users.isEmpty()? null: users.get(0); 
	}

	@Override
	public List<UserModel> findAll() {
		String sql = "SELECT * FROM user AS u INNER JOIN role AS r ON r.id = u.roleid";
		List<UserModel> um = query(sql, new UserMapper());
		
		return um;
	}

}
