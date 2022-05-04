package com.javaweb.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.javaweb.dao.IUserDAO;
import com.javaweb.model.UserModel;
import com.javaweb.service.IUserService;

public class UserService implements IUserService {
@Inject
private IUserDAO userDAO;
	@Override
	public UserModel findByUserNameAndPasswordAndStatus(String userName, String password, int status) {
		return userDAO.findByUserNameAndPasswordAndStatus(userName, password, status);
	}
	@Override
	public UserModel findOne(long id) {
		
		return userDAO.findOne(id);
	}
	@Override
	public List <UserModel> findAll() {
		
		return userDAO.findAll();
	}

}
