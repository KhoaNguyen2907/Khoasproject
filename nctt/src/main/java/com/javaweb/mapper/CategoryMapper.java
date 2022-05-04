package com.javaweb.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.javaweb.model.CategoryModel;

public class CategoryMapper implements RowMapper<CategoryModel> {

	@Override
	public CategoryModel rowMapper(ResultSet rs) {
		CategoryModel category = new CategoryModel();
		try {
			category.setId(rs.getLong("id"));
			category.setName(rs.getString("name"));
			category.setCode(rs.getString("code"));
		} catch (SQLException e) {
			return null;
		}
		
		return category;
	}

}
