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

import com.javaweb.model.UserModel;
import com.javaweb.service.IUserService;
import com.javaweb.utils.FormUtil;
import com.javaweb.utils.SessionUtil;

@WebServlet(urlPatterns = { "/trang-chu", "/dang-nhap", "/thoat" })
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	private IUserService userService;

	ResourceBundle resourceBundle = ResourceBundle.getBundle("messages_vi");

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String action = req.getParameter("action");
		if (action != null && action.equals("login")) {
			if (action != null && action.equals("login")) {
				UserModel user = (UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL");
				if(user != null) {
					resp.sendRedirect(req.getContextPath()+"/trang-chu");
				} else if (user == null) {
				String alert = req.getParameter("alert");
				String message = req.getParameter("message");
				if (alert != null && message != null) {
					req.setAttribute("MESSAGE", resourceBundle.getString(message));
					req.setAttribute("ALERT", alert);
					
				}

				RequestDispatcher rd = req.getRequestDispatcher("/views/login.jsp");
				rd.forward(req, resp);
			}
			}
		} else if (action != null && action.equals("logout")) {
			SessionUtil.getInstance().removeValue(req, "USERMODEL");
			resp.sendRedirect(req.getContextPath() + "/trang-chu");
		} else {
			RequestDispatcher rd = req.getRequestDispatcher("/views/web/home.jsp");
			rd.forward(req, resp);
		}
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String action = req.getParameter("action");
		if (action != null && action.equals("login")) {
			UserModel model = FormUtil.toModel(UserModel.class, req);
			model = userService.findByUserNameAndPasswordAndStatus(model.getUserName(), model.getPassword(), 1);
			if (model != null) {
				SessionUtil.getInstance().putValue(req, "USERMODEL", model);
				if (model.getRole().getCode().equals("USER")) {

					resp.sendRedirect(req.getContextPath() + "/trang-chu");
				} else if (model.getRole().getCode().equals("ADMIN")) {
					resp.sendRedirect(req.getContextPath() + "/admin-home");
				}
			} 
				
			
			else {
				resp.sendRedirect(req.getContextPath()
						+ "/dang-nhap?action=login&message=username_password_invalid&alert=danger");
			}
		}
	}
}
