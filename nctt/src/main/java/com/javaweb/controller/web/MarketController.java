package com.javaweb.controller.web;

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
import com.javaweb.model.UserModel;
import com.javaweb.service.IProjectService;
import com.javaweb.service.IUserService;
import com.javaweb.utils.FormUtil;
import com.javaweb.utils.SessionUtil;

@WebServlet(urlPatterns = { "/thi-truong" })
public class MarketController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Inject
	private IUserService userService;
	@Inject
	private IProjectService projectService;

	ResourceBundle resourceBundle = ResourceBundle.getBundle("messages_vi");

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserModel model = (UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL");
		ProjectModel projectModel = FormUtil.toModel(ProjectModel.class, req);
		if (model != null) {
			String read = req.getParameter("read");
			if (read == null) {
				projectModel.setListResult(projectService.findAll()) ;
				req.setAttribute(SystemConstant.MODEL, projectModel);
				RequestDispatcher rd = req.getRequestDispatcher("/views/market.jsp");
				rd.forward(req, resp);
			} else if (read.equals("chi-tiet")) {
				
				projectModel = projectService.findOne(projectModel.getId());
				req.setAttribute(SystemConstant.MODEL, projectModel);
				RequestDispatcher rd = req.getRequestDispatcher("/views/web/detail.jsp");
				rd.forward(req, resp);
			}
			
		} else {
			resp.sendRedirect(req.getContextPath()
					+ "/dang-nhap?action=login&message=not_login&alert=danger");
		}
//		
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
