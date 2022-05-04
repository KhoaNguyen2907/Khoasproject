<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
</head>

<body>
<content tag="homepage">
active
</content>
	  <div class="page-banner home-banner mb-5">
      <div class="slider-wrapper">
        <div class="owl-carousel hero-carousel">
          <div class="hero-carousel-item">
            <img src="<c:url value='/template/web/assets/img/realestate 1.jpg'/>" alt="">
            <div class="img-caption">
              <div class="subhead">NEW WORLD CAPITAL</div>
              <h1 class="mb-4">Phòng Nghiên Cứu Thị Trường</h1>
              <a href="/dang-nhap?action=login" class="btn btn-outline-light">ĐĂNG NHẬP</a>
            </div>
          </div>
          <div class="hero-carousel-item">
            <img src="<c:url value='/template/web/assets/img/realestate 2.jpg'/>" alt="">
            <div class="img-caption">
              <h1 class="mb-4">Tổng Hợp Thông Tin Thị Trường</h1>
              <a href="/thi-truong" class="btn btn-outline-light">THAM KHẢO</a>
            
            </div>
          </div>
          <div class="hero-carousel-item">
            <img src="<c:url value='/template/web/assets/img/bg_image_3.jpg'/>" alt="">
            <div class="img-caption">
              
              <h1 class="mb-4">Báo Cáo Thị Trường</h1>
              <a href="#" class="btn btn-primary">XEM BÁO CÁO</a>
            </div>
          </div>
        </div>
      </div> <!-- .slider-wrapper -->
    </div> <!-- .page-banner -->
 

  <main>
    <div class="page-section">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-6 py-3">
            <div class="subhead">Giới thiệu</div>
            <h2 class="title-section">Phòng  <span class="fg-primary">Nghiên Cứu Thị Trường</span> New World Capital</h2>

            <p>Phụ trách việc tổng hợp thông tin thị trường bất động sản, thực hiện các báo cáo, phân tích thị trường chuyên sâu, hỗ trợ các phòng ban trong việc thu thập dữ liệu các dự án trên thị trường</p>

            <a href="#contact" class="btn btn-primary mt-4">Liên hệ</a>
          </div>
          <div class="col-lg-6 py-3">
            <div class="about-img">
              <img src="<c:url value='/template/web/assets/img/realestate 3.jpg'/>" alt="">
            </div>
          </div>
        </div>
      </div>
    </div> <!-- .page-section -->

  </main>
</body>
</html>