<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>

<!-- Navigation -->
 <nav class="navbar navbar-expand-lg navbar-light">
      <div class="container">
        
        <a class="navbar-brand" href="/trang-chu">
          <img src="<c:url value='/template/web/assets/img/logo.png'/>" alt="logo" height="50">
        </a>

        <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="navbar-collapse collapse" id="navbarContent">
          <ul class="navbar-nav ml-auto pt-3 pt-lg-0">
            <li class="nav-item <dec:getProperty property="page.homepage"></dec:getProperty>">
              <a href="/trang-chu" class="nav-link">Trang chủ</a>
            </li>
            
         
           
            <li class="nav-item <dec:getProperty property="page.market"></dec:getProperty>">
              <a href="/thi-truong" class="nav-link">Thị trường</a>
            </li>
            <li class="nav-item">
              <a href="/trang-chu#contact" class="nav-link">Liên hệ</a>
            </li>
            <c:if test="${not empty USERMODEL}">
              <li class="nav-item">
              <c:if test="${USERMODEL.roleId eq 1 }"><a class="nav-link" href='/admin-home'>Xin chào, ${USERMODEL.fullName}</a></c:if>
              <c:if test="${USERMODEL.roleId eq 2 }"><a class="nav-link" href='/trang-chu'>Xin chào, ${USERMODEL.fullName}</a></c:if>
              </li>
              <li class="nav-item">
                <a class="nav-link" href='<c:url value="/thoat?action=logout"/>'>Thoát</a>
              </li>
            </c:if>
            <c:if test="${empty USERMODEL}">
              <li class="nav-item <dec:getProperty property="page.login"></dec:getProperty>">
              <a href="<c:url value="/dang-nhap?action=login"/>" class="nav-link">Đăng nhập</a>
            </li>
            </c:if>
          </ul>
        </div>
      </div> <!-- .container -->
    </nav> <!-- .navbar -->