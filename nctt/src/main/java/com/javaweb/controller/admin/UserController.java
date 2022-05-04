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
import com.javaweb.model.UserModel;
import com.javaweb.service.ICategoryService;
import com.javaweb.service.IUserService;
import com.javaweb.utils.FormUtil;

@WebServlet(urlPatterns = { "/admin-users" })
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Inject
	private IUserService userService;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String view ="";
		ResourceBundle resourceBundle = ResourceBundle.getBundle("messages_vi");
		UserModel model = FormUtil.toModel(UserModel.class, req);
		String type = req.getParameter("type");
		if (type.equals(SystemConstant.EDIT)) {
			if (model.getId() != null) {
				model = userService.findOne(model.getId());
				view = "/views/admin/users/edit.jsp";
			
			} else {
				view ="/views/admin/users/edit.jsp";
			
			}
			
		} else if(type.equals(SystemConstant.LIST)) {
		model.setListResult(userService.findAll()) ;
		view = "/views/admin/users/list.jsp";
		}
		
		String alert = req.getParameter("alert");
		String message = req.getParameter("message");
		if (alert != null && message != null) {
			req.setAttribute("MessageRespond", resourceBundle.getString(message));
			req.setAttribute("AlertRespond", alert);	
		}
		
		req.setAttribute(SystemConstant.MODEL, model);
		
		RequestDispatcher rd = req.getRequestDispatcher(view);
		rd.forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
