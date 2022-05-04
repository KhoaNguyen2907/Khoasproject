<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-new" />
<c:url var="ProjectURL" value="/admin-project" />
<c:url var="ProjectEditURL" value="/admin-project?type=edit" />
<c:set var="currentPage" value ="Thông tin dự án"/>
<c:set var="title" value ="Thông tin dự án"/>
<c:set var="subtitle" value ="Quản lý thông tin các dự án"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý người dùng</title>

</head>
<body>
<content tag="users">
active
</content>
<header class="mb-3">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>

            <div class="page-heading">
                <div class="page-title">
                    <div class="row">
                        <div class="col-12 col-md-6 order-md-1 order-last">
                            <h3>${title}</h3>
                            <p class="text-subtitle text-muted">${subtitle}</p>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/admin-home">Dashboard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">${currentPage}</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>	
 <section id="multiple-column-form">
                    <div class="row match-height">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Thông tin dự án</h4>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <form class="form">
                                            <div class="row">
                                                <div class="col-md-6 col-12">
                                                   	<div class="form-group">
								<label class="col-sm-3 control-label nopadding-right">Tài khoản</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="userName" name="userName"
										value="${model.userName}" />
								</div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-12">
                                                    <div class="form-group">
									<label class="col-sm-3 control-label nopadding-right">Mật khẩu</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="password"
											name="password" value="${model.password}" />
									</div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-12">
                                                    <div class="form-group">
										<label class="col-sm-3 control-label nopadding-right">Họ tên</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" id="fullName"
												name="fullName" value="${model.fullName}" />
										</div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-12">
                                                   <div class="form-group">
											<label class="col-sm-3 control-label nopadding-right">Quyền</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="roleName"
													name="roleName" value="${model.roleName}" />
											</div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-12">
                                                   	<div class="form-group">
											<label class="col-sm-3 control-label nopadding-right">Trang thái</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="status"
													name="status" value="${model.status}" />
											</div>
                                                    </div>
                                                </div>
                                                
                                                 <div class="col-md-6 col-12">
                                                   	<div class="form-group">
											<label class="col-sm-3 control-label nopadding-right">Hiện trạng</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="price"
													name="price" value="${model.status}" />
											</div>
                                                    </div>
                                                </div>
                                                
                                               
                                                
                                                <div class="col-12 d-flex justify-content-start">
                                                    
                                                        <input type="button"
														class="btn btn-primary me-1 mb-1"
														id="btnAddOrUpdateNew" name="addOrUpdate"
														<c:if test="${model.id != null }">value="Cập nhật dự án"</c:if>
														<c:if test="${model.id == null }">value="Thêm dự án"</c:if> />
												</div>
												<input type="hidden" id="id" name="id" value="${model.id}" />
                                                    
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- // Basic multiple Column Form section end -->
            </div>


						


			

		<script>
			$("#btnAddOrUpdateNew").click(function(e) {
				e.preventDefault();
				var data = {};
				var formData = $("#formSubmit").serializeArray();
				$.each(formData, function(i, v) {
					data[v.name] = v.value;
				});

				var id = $("#id").val();
				if (id == "") {
					addNew(data);
				} else {
					updateNew(data);
				}
			});
			function addNew(data) {
				$.ajax({
					url : " ${APIurl} ",
					type : "POST",
					contentType : "application/json",
					data : JSON.stringify(data),
					dataType : "json",
					success : function(result) {
						window.location.href = "${ProjectEditURL}&id=" + result.id
								+ "&message=createsuccess&alert=success"

					},
					error : function(error) {
						window.location.href = "${ProjectEditURL}&id=" + result.id
								+ "&message=createfail&alert=danger"
					},

				});
			}
			function updateNew(data) {
				$
						.ajax({
							url : " ${APIurl} ",
							type : "PUT",
							contentType : "application/json",
							data : JSON.stringify(data),
							dataType : "json",
							success : function(result) {
								window.location.href = "${ProjectEditURL}&id=${model.id}&message=editsuccess&alert=success"
							},
							error : function(error) {
								window.location.href = "${ProjectEditURL}&id=${model.id}&message=editfail&alert=danger"
							},
						});

			}
		</script>
</body>
</html>