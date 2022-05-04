package com.javaweb.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.javaweb.dao.IProjectDAO;
import com.javaweb.model.ProjectModel;
import com.javaweb.service.IProjectService;

public class ProjectService implements IProjectService {
@Inject
private IProjectDAO projectDAO;

	@Override
	public List<ProjectModel> findByCategoryId(long categoryid) {
		return projectDAO.findByCategoryId(categoryid);
	}
	@Override
	public ProjectModel save(ProjectModel projectModel) {
		projectModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		
		long newid = projectDAO.save(projectModel);
		return projectDAO.findOne(newid);
	}
	@Override
	public ProjectModel modified(ProjectModel updatedNewModel) {
		ProjectModel oldNew = projectDAO.findOne(updatedNewModel.getId());
		updatedNewModel.setCreatedBy(oldNew.getCreatedBy());
		updatedNewModel.setCreatedDate(oldNew.getCreatedDate());
		updatedNewModel.setModifiedDate(new Timestamp(System.currentTimeMillis()));
//		updatedNewModel.setCategoryId(categoryDAO.findOneByCode(updatedNewModel.getCategoryCode()).getId());
		projectDAO.modified(updatedNewModel);
		return projectDAO.findOne(updatedNewModel.getId());
	}
	@Override
	public void delete(long[] ids) {
		for (Long id : ids) {
			projectDAO.delete(id);
		}
		
	}
	@Override
	public List<ProjectModel> findAll() {
		return projectDAO.findAll();
	}
	@Override
	public ProjectModel findOne(long id) {
		ProjectModel project = projectDAO.findOne(id);
//		CategoryModel category = categoryDAO.findOne(project.getCategoryId());
//		project.setCategoryCode(category.getCode());
		return project;
	}

}
