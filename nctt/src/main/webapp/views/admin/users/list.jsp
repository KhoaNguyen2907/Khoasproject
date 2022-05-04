<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="ProjectURL" value="/admin-project" />
<c:url var="APIurl" value="/api-admin-new" />
<c:set var="currentPage" value ="Quản lý người dùng"/>
<c:set var="title" value ="Quản lý người dùng"/>
<c:set var="subtitle" value ="Quản lý danh sách người dùng"/>
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
			<div class="page-content">
				<div class="row">
					<div class="col-12 d-flex justify-content-start"></div>
					<c:if test="${MessageResponse != null}">
						<div class="alert alert-${AlertRespond}">${MessageRespond}</div>
					</c:if>
					<div class="widget-box table-filter">

						<div class="table-btn-controls">
							<div class="col-12 d-flex justify-content-end ">
									<button  id="btnAdd" type="button" onclick="location.href='<c:url value="/admin-users?type=edit"/>'" class=" float-right btn btn-light-secondary me-1 mb-1 float-right" data-toggle="tooltip" title='Thêm dự án'
									 > Thêm người dùng</button>
									<button id="btnDelete" type="button" class="btn btn-light-secondary me-1 mb-1 " data-toggle="tooltip" title='Xóa dự án'
									 >Xóa người dùng</button>
								
								</div>

							</div>
							<br>
						</div>
					</div>



					<div class="row">

						<div class="col-xs-12">

							<div class="table-responsive">

								<table id="table_id" class="table border">
									<thead>
										<tr>
											<th scope="col">#</th>
											<th scope="col">Tài khoản</th>
											<th scope="col">Mật khẩu</th>
											<th scope="col">Họ tên</th>
											<th scope="col">Quyền</th>
											<th scope="col">Trạng thái</th>
											<th scope="col">Chỉnh sửa</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${model.listResult}">

											<tr>
												<td><div class="form-check">
														<input class="form-check-input" type="checkbox"
															id="checkbox_${item.id}" name="checkbox_${item.id}"
															value="${item.id}">
													</div></td>
												<td>${item.userName}</td>
												<td>${item.password}</td>
												<td>${item.fullName}</td>
												<td>${item.roleName}</td>
												<td>${item.status}</td>
												<td><c:url var="editURL" value="/admin-users">
														<c:param name="type" value="edit" />
														<c:param name="id" value="${item.id}" />
													</c:url> 
													<button  id="btnUpdate" type="button" onclick="location.href='${editURL}'" class=" float-right btn btn-light-secondary me-1 mb-1" data-toggle="tooltip" title='Cập nhật dự án'
									 > Cập nhật</button>
													
											</tr>
										</c:forEach>
									</tbody>
								</table>


							</div>
						</div>
					</div>

					<script>
					
						$("#btnDelete")
								.click(
										function(e) {
											e.preventDefault();
											var data = {};

											var ids = $(
													'tbody input[type=checkbox]:checked')
													.map(function() {
														return $(this).val();
													}).get();
											data['ids'] = ids;
											deleteNew(data);
										});

						function deleteNew(data) {
							$
									.ajax({
										url : " ${APIurl} ",
										type : "DELETE",
										contentType : "application/json",
										data : JSON.stringify(data),

										success : function(result) {
											window.location.href = "${ProjectURL}?type=list&message=deletesuccess&alert=success"

										},
										error : function(error) {
											window.location.href = "${ProjectURL}?tye=list&message=deletefail&alert=danger"
										},

									});
						}
					</script>
</body>
</html>