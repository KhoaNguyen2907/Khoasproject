package com.javaweb.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.javaweb.model.ProjectModel;

public class ProjectMapper implements RowMapper<ProjectModel> {

	@Override
	public ProjectModel rowMapper(ResultSet rs) {
		ProjectModel project = new ProjectModel();
		try {
			project.setId(rs.getLong("id"));
			project.setTitle(rs.getString("title"));
			project.setLocation(rs.getString("location"));
			project.setInvestor(rs.getString("investor"));
			project.setScale(rs.getString("scale"));
			project.setPrice(rs.getString("price"));
			project.setStatus(rs.getString("status"));
			project.setDayrelease(rs.getString("dayrelease"));
			project.setContent(rs.getString("content"));
			if (rs.getTimestamp("createddate") != null) {
			project.setCreatedDate(rs.getTimestamp("createddate"));
			}
			if (rs.getString("createdby") != null) {
			project.setCreatedBy(rs.getString("createdby"));
			}
			if (rs.getTimestamp("modifieddate") != null) {
				project.setModifiedDate(rs.getTimestamp("modifieddate"));
			}
			if (rs.getString("modifiedby") != null) {
				project.setModifiedBy(rs.getString("modifiedby"));
				}
			
		} catch (SQLException e) {
			return null;
		}
		return project;
	}

}
