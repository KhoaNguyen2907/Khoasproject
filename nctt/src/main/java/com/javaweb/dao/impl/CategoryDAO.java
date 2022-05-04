package com.javaweb.dao.impl;

import java.util.List;

import com.javaweb.dao.ICategoryDAO;
import com.javaweb.mapper.CategoryMapper;
import com.javaweb.model.CategoryModel;

public class CategoryDAO extends AbstractDAO<CategoryModel> implements ICategoryDAO {
	
@Override
public List<CategoryModel> findAll() {
	String sql = "SELECT * FROM category";
	return query(sql, new CategoryMapper());
	
}

@Override
public CategoryModel findOne(long id) {
	String sql = "SELECT * FROM category WHERE id = ?";
	List <CategoryModel> categories = query(sql, new CategoryMapper(),id);
	return categories.isEmpty()? null: categories.get(0);
}

@Override
public CategoryModel findOneByCode(String categoryCode) {
	String sql = "SELECT * FROM category WHERE code = ?";
	List <CategoryModel> categories = query(sql, new CategoryMapper(),categoryCode);
	return categories.isEmpty()? null: categories.get(0);
}
}
