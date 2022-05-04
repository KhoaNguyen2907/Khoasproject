package com.javaweb.dao.impl;

import java.util.List;

import com.javaweb.dao.IProjectDAO;
import com.javaweb.mapper.ProjectMapper;
import com.javaweb.model.ProjectModel;

public class ProjectDAO extends AbstractDAO<ProjectModel> implements IProjectDAO {

	@Override
	public List<ProjectModel> findByCategoryId(long categoryid) {
		String sql = "SELECT * FROM project WHERE categoryid = ?";
		return query(sql, new ProjectMapper(), categoryid);
	}

	@Override
	public Long save(ProjectModel projectModel) {
		StringBuilder sql = new StringBuilder("INSERT INTO project (title, location,");
		sql.append(" investor, scale, price, status, dayrelease, content, createddate, createdby)");
		sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?,?)");
		return insert(sql.toString(), projectModel.getTitle(), projectModel.getLocation(), 
				projectModel.getInvestor(), projectModel.getScale(), projectModel.getPrice(),projectModel.getStatus(),
				projectModel.getDayrelease(),projectModel.getContent(), projectModel.getCreatedDate(), projectModel.getCreatedBy());
	}

	@Override
	public void modified(ProjectModel projectModel) {
		StringBuilder sql = new StringBuilder("UPDATE project SET title = ?, location = ?,");
		sql.append(" investor = ?, scale = ?, price = ?, status= ?, dayrelease=?, content= ?,");
		sql.append(" createddate = ?, createdby = ?, modifieddate = ?, modifiedby = ? WHERE id = ?");
		update(sql.toString(), projectModel.getTitle(), projectModel.getLocation(), 
				projectModel.getInvestor(), projectModel.getScale(), projectModel.getPrice(),projectModel.getStatus(),projectModel.getDayrelease(),projectModel.getContent(),
				projectModel.getCreatedDate(), projectModel.getCreatedBy(), projectModel.getModifiedDate(), 
				projectModel.getModifiedBy(), projectModel.getId());
	}

	@Override
	public void delete(Long id) {
		String sql = " DELETE FROM project WHERE id = ?";
		update(sql, id);
	}

	@Override
	public ProjectModel findOne(long id) {
		String sql = "SELECT * FROM project WHERE id = ?";
		List<ProjectModel> projectModel = query(sql, new ProjectMapper(), id);
		return projectModel.isEmpty()? null: projectModel.get(0);
	}

	@Override
	public List<ProjectModel> findAll() {
		String sql = "SELECT * FROM project";
		return query(sql, new ProjectMapper());
	}
}
