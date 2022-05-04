package com.javaweb.dao;

import java.util.List;

import com.javaweb.model.ProjectModel;

public interface IProjectDAO extends GenericDAO<ProjectModel> {
List<ProjectModel> findByCategoryId(long categoryid);
List<ProjectModel> findAll();
ProjectModel findOne(long id) ;
Long save(ProjectModel newModel);
void modified (ProjectModel newModel);
void delete (Long id);
}

