<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-new" />
<c:url var="ProjectURL" value="/admin-project" />
<c:url var="ProjectEditURL" value="/admin-project?type=edit" />
<c:set var="currentPage" value ="Thông tin dự án"/>
<c:set var="title" value ="Thông tin dự án"/>
<c:set var="subtitle" value ="Quản lý thông tin các dự án"/>
Thông tin dự án
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cập nhật dự án</title>

</head>
<body>
<content tag="project">
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
                                    
                                   
                                    <h3 class="card-title ">Thông tin dự án</h3>
                                   
                                    
                                <div class="card-content">
                                    <div class="card-body">
                                     <c:if test="${not empty MessageRespond}">
                                            <div class="alert alert-${AlertRespond} col-3">${MessageRespond} </div>
                                			</c:if>
                                        <form class="form" id="formSubmit">
                                            <div class="row">
                                                <div class="col-md-6 col-12">
                                                   	<div class="form-group">
								<label>Tên dự án</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="title" name="title"
										value="${model.title}" />
								</div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-12">
                                                    <div class="form-group">
									<label>Vị trí</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="location"
											name="location" value="${model.location}" />
									</div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-12">
                                                    <div class="form-group">
										<label>Chủ đầu tư</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" id="investor"
												name="investor" value="${model.investor}" />
										</div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-12">
                                                   <div class="form-group">
											<label>Quy mô</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="scale"
													name="scale" value="${model.scale}" />
											</div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-12">
                                                   	<div class="form-group">
											<label>Giá bán</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="price"
													name="price" value="${model.price}" />
											</div>
                                                    </div>
                                                </div>
                                                
                                                 <div class="col-md-6 col-12">
                                                   	<div class="form-group">
											<label >Hiện trạng</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="status"
													name="status" value="${model.status}" />
											</div>
                                                    </div>
                                                </div>
                                                
                                                 <div class="col-md-6 col-12">
                                                   	<div class="form-group">
											<label >Ngày ra mắt</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="dayrelease"
													name="dayrelease" value="${model.dayrelease}" />
											</div>
                                                    </div>
                                                </div>
                                                
                                                
                                                 <div class="row">
							                        <div class="form-group">
							                           <label >Nội dung</label>
							                       <br>
							                       <br>
							                        <div class="col-sm-9">
							                       <div id="toolbar-container"></div>
							                       
							                         <div id="editor">${model.content}</div>
							                         </div>
							                        </div>
							                   	 </div>
                                               
											
					
                                                <div class="col-12 d-flex justify-content-start">
                                                    
                                                        <input type="button"
														class="btn btn-primary me-1 mb-1"
														id="btnAddOrUpdateNew" name="addOrUpdate"
														<c:if test="${model.id != null }">value="Cập nhật dự án"</c:if>
														<c:if test="${model.id == null }">value="Thêm dự án"</c:if>	/>											</div>
												<input type="hidden" id="id" name="id" value="${model.id}" />
                                                    
                                                </div>
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
		
		DecoupledEditor
         .create(document.querySelector('#editor'))
         .then( editor => {
            console.log( 'Editor was initialized', editor );
            content = editor;
            const toolbarContainer = document.querySelector( '#toolbar-container' );
            toolbarContainer.appendChild( editor.ui.view.toolbar.element );
        } )
         .catch(error => {
             console.error(error);
         });
		
		
			$("#btnAddOrUpdateNew").click(function(e) {
				e.preventDefault();
				var data = {};
				var formData = $("#formSubmit").serializeArray();
				$.each(formData, function(i, v) {
					data[v.name] = v.value;
				});
				data["content"] = content.getData();
				var id = $("#id").val();
				if (id == "") {
					addNew(data);
				} else {
					updateNew(data);
				}
			});
			function addNew(data) {
				$.ajax({
					url : "${APIurl}",
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
				$.ajax({
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