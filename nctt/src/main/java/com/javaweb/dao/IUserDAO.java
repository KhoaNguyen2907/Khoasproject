package com.javaweb.dao;

import java.util.List;

import com.javaweb.model.UserModel;

public interface IUserDAO extends GenericDAO<UserModel> {
	List<UserModel> findAll();
	UserModel findOne(long id);
UserModel findByUserNameAndPasswordAndStatus(String userName, String password, int status);
}

