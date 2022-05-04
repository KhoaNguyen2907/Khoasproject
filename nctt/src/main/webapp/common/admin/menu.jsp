<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

        <div id="sidebar" class="active">
            <div class="sidebar-wrapper active">
                <div class="sidebar-header">
                    <div class="d-flex justify-content-between">
                        <div class="logo">
                            <a href="/trang-chu"><img src="<c:url value='/template/admin/assets/images/logo/logo.png'/>" alt="Logo" srcset=""></a>
                        </div>
                        <div class="toggler">
                            <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                        </div>
                    </div>
                </div>
                <div class="sidebar-menu">
                    <ul class="menu">
                        <li class="sidebar-title">Menu</li>

                        <li class="sidebar-item <dec:getProperty property="page.dashboard"></dec:getProperty> ">
                            <a href="/admin-home" class='sidebar-link'>
                                <i class="bi bi-grid-fill"></i>
                                <span>Dashboard</span>
                            </a>
                        </li>

                        <li class="sidebar-item <dec:getProperty property="page.project"></dec:getProperty>  ">
                            <a href="/admin-project?type=list" class='sidebar-link'>
                                <i class="bi bi-file-earmark-spreadsheet-fill"></i>
                                <span>Thông tin dự án</span>
                            </a>
                        </li>
                        
                        <li class="sidebar-item <dec:getProperty property="page.users"></dec:getProperty>  ">
                            <a href="/admin-users?type=list" class='sidebar-link'>
                                <i class="bi bi-person-badge-fill"></i>
                                <span>Quản lý người dùng</span>
                            </a>
                        </li>

                       

                      
                    </ul>
                </div>
                <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
            </div>
 </div>