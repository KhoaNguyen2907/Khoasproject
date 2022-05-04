package com.javaweb.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.javaweb.model.RoleModel;
import com.javaweb.model.UserModel;

public class UserMapper implements RowMapper<UserModel> {

	@Override
	public UserModel rowMapper(ResultSet rs) {
		UserModel user = new UserModel();
		try {
			user.setId(rs.getLong("id"));
			user.setUserName(rs.getString("username"));
			user.setFullName(rs.getString("fullname"));
			user.setPassword(rs.getString("password"));
			user.setRoleId(rs.getLong("roleid"));
			user.setStatus(rs.getInt("status"));
			RoleModel role = new RoleModel();
			role.setCode(rs.getString("code"));
			role.setName(rs.getString("name"));
			user.setRole(role);
			user.setRoleName(rs.getString("name"));
			user.setCreatedDate(rs.getTimestamp("createddate"));
			user.setCreatedBy(rs.getString("createdby"));
			if (rs.getTimestamp("modifieddate") != null) {
				user.setModifiedDate(rs.getTimestamp("modifieddate"));
			}
			if (rs.getString("modifiedby") != null) {
				user.setModifiedBy(rs.getString("modifiedby"));
				}
			
		} catch (SQLException e) {
			return null;
		}
		return user;
		
	}

}
