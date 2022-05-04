package com.javaweb.controller.admin;

import java.io.IOException;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaweb.constant.SystemConstant;
import com.javaweb.model.ProjectModel;
import com.javaweb.service.ICategoryService;
import com.javaweb.service.IProjectService;
import com.javaweb.utils.FormUtil;

@WebServlet(urlPatterns = { "/admin-project" })
public class MarketController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Inject
	private IProjectService projectService;
	@Inject
	private ICategoryService categoryService;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String view ="";
		ResourceBundle resourceBundle = ResourceBundle.getBundle("messages_vi");
		ProjectModel model = FormUtil.toModel(ProjectModel.class, req);
		String type = req.getParameter("type");
		if (type.equals(SystemConstant.EDIT)) {
			if (model.getId() != null) {
				model = projectService.findOne(model.getId());
				view = "/views/admin/project/edit.jsp";
			
			} else {
				view ="/views/admin/project/edit.jsp";
			
			}
			
		} else if(type.equals(SystemConstant.LIST)) {
		model.setListResult(projectService.findAll()) ;
		view = "/views/admin/project/list.jsp";
		}
		
		String alert = req.getParameter("alert");
		String message = req.getParameter("message");
		if (alert != null && message != null) {
			req.setAttribute("MessageRespond", resourceBundle.getString(message));
			req.setAttribute("AlertRespond", alert);	
		}
		
		req.setAttribute(SystemConstant.MODEL, model);
		req.setAttribute("categories", categoryService.findAll());
		RequestDispatcher rd = req.getRequestDispatcher(view);
		rd.forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
