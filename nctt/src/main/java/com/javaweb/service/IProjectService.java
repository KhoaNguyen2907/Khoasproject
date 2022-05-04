package com.javaweb.service;

import java.util.List;

import com.javaweb.model.ProjectModel;

public interface IProjectService {
List<ProjectModel> findByCategoryId(long categoryid);
List<ProjectModel> findAll();
ProjectModel findOne(long id);
ProjectModel save(ProjectModel projectModel);
ProjectModel modified (ProjectModel projectModel);
void delete (long[] ids);

}
