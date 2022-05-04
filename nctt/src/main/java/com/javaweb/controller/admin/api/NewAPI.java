package com.javaweb.controller.admin.api;

import java.io.BufferedReader;
import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.javaweb.model.ProjectModel;
import com.javaweb.model.UserModel;
import com.javaweb.service.ICategoryService;
import com.javaweb.service.IProjectService;
import com.javaweb.utils.HttpUtil;
import com.javaweb.utils.SessionUtil;

@WebServlet(urlPatterns = { "/api-admin-new" })

public class NewAPI extends HttpServlet {
	@Inject
	IProjectService projectService;


	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF8");
		resp.setContentType("application/json");
		BufferedReader br = req.getReader();
		ProjectModel projectModel = HttpUtil.of(br).toModel(ProjectModel.class);
		projectModel.setCreatedBy(((UserModel) (SessionUtil.getInstance().getValue(req, "USERMODEL"))).getUserName());
		projectModel = projectService.save(projectModel);
		System.out.println("Them moi id " + projectModel.getId());
		ObjectMapper map = new ObjectMapper();
		map.writeValue(resp.getOutputStream(), projectModel);
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF8");
		resp.setContentType("application/json");
		BufferedReader br = req.getReader();
		ProjectModel projectModel = HttpUtil.of(br).toModel(ProjectModel.class);
		projectModel.setModifiedBy(((UserModel) (SessionUtil.getInstance().getValue(req, "USERMODEL"))).getUserName());
		projectModel = projectService.modified(projectModel);
		System.out.println("Da cap nhat bai viet id " + projectModel.getId());
		ObjectMapper map = new ObjectMapper();
		map.writeValue(resp.getOutputStream(), projectModel);
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF8");
		resp.setContentType("application/json");
		BufferedReader br = req.getReader();
		ProjectModel projectModel = HttpUtil.of(br).toModel(ProjectModel.class);
		projectService.delete(projectModel.getIds());
		ObjectMapper map = new ObjectMapper();
		map.writeValue(resp.getOutputStream(), "Done");
	}
}
