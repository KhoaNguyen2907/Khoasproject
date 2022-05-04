package com.javaweb.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.javaweb.dao.ICategoryDAO;
import com.javaweb.model.CategoryModel;
import com.javaweb.service.ICategoryService;

public class CategoryService implements ICategoryService {

	@Inject
	private ICategoryDAO categoryDAO;

	@Override
	public List<CategoryModel> findAll() {
		// TODO Auto-generated method stub
		return categoryDAO.findAll();
	}

	@Override
	public CategoryModel findOne(long id) {
		
		return categoryDAO.findOne(id);
	}

	

}
