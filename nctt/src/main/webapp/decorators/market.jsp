<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title><dec:title default="Thị trường" /></title>

  <link rel="stylesheet" type="text/css" href="<c:url value='/template/market/jquery.dataTables.css'/>">
<link rel="stylesheet"
	href="<c:url value='/template/web/assets/css/bootstrap.css'/>">
<link rel="stylesheet"
	href="<c:url value='/template/web/assets/css/maicons.css'/>">
<link rel="stylesheet"
	href="<c:url value='/template/web/assets/vendor/animate/animate.css'/>">
<link rel="stylesheet"
	href="<c:url value='/template/web/assets/vendor/owl-carousel/css/owl.carousel.css'/>">
<link rel="stylesheet"
	href="<c:url value='/template/web/assets/vendor/fancybox/css/jquery.fancybox.css'/>">
<link rel="stylesheet"
	href="<c:url value='/template/web/assets/css/theme.css'/>">
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
 <script src="/template/market/jquery.dataTables.min.js"></script>

</head>
<body class="mb-0">
<!-- header -->
	<%@ include file="/common/web/header.jsp"%>
	<!-- header -->

<dec:body/>


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
 
	<script src="<c:url value='/template/web/assets/js/bootstrap.bundle.min.js'/>"></script>

	
</body>
</html>