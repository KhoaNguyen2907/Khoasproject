package com.javaweb.service;

import java.util.List;

import com.javaweb.model.UserModel;

public interface IUserService {
	List <UserModel> findAll();
	UserModel findOne(long id);
	UserModel findByUserNameAndPasswordAndStatus(String userName, String password, int status);
}
