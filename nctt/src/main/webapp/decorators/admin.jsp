<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title><dec:title default="Dashboard" /></title>
<link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/bootstrap.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/assets/vendors/iconly/bold.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/assets/vendors/perfect-scrollbar/perfect-scrollbar.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/assets/vendors/bootstrap-icons/bootstrap-icons.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/app.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/style.css'/>">
    <link rel="shortcut icon" href="<c:url value='/template/admin/assets/images/favicon.svg'/>" type="image/x-icon">
	
 <link rel="stylesheet" type="text/css" href="<c:url value='/template/market/jquery.dataTables.css'/>">
 <script src="<c:url value='/template/admin/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.jsg'/>"></script>
    <script src="<c:url value='/template/admin/assets/js/bootstrap.bundle.min.js'/>"></script>
<script src="<c:url value='/ckeditor/ckeditor.js'/>"></script>
	
	

	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
 <script src="<c:url value='/template/market/jquery.dataTables.min.js'/>"></script>
</head>
<body>
<div id="app">

	<!-- menu -->
	<%@ include file="/common/admin/menu.jsp"%>
	<!-- menu -->
<div id="main">
<dec:body/>
<!-- footer -->
	<%@ include file="/common/admin/footer.jsp"%>
	<!-- footer -->

</div>
</div>
 
  
  <script>
  $(document).ready(function() {
    $('#table_id').DataTable({
    	"oLanguage": {
    	    "sSearch": "Tìm kiếm: ",
    	    "sLengthMenu": "Hiển thị _MENU_ dự án",
    	    "sInfo": "Đang hiển thị trang _PAGE_ trên _PAGES_",
    	    "oPaginate": {
                "sNext": "Trang sau",
                "sPrevious": "Trang trước"
    	    }
    	  }
    });
} );
  </script>
 


	
    <script src="<c:url value='/template/admin/assets/vendors/apexcharts/apexcharts.js'/>"></script>
    <script src="<c:url value='/template/admin/assets/js/pages/dashboard.js'/>"></script>
    <script src="<c:url value='/template/admin/assets/js/main.js'/>"></script>
</body>
</html>