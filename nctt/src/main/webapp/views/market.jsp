<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thị trường</title>
</head>
<body>
<content tag="market">
active
</content>

	<div class="px-4">
		<div class="col-xs-12">
			<div class="table-responsive">
				<table id="table_id" class="display border" style="width: 100%">
					<thead>
						<tr>
							<th>Tên dự án</th>
							<th>Vị trí</th>
							<th>Chủ đầu tư</th>
							<th>Quy mô</th>
							<th>Giá bán</th>
							<th>Hiện trạng</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${model.listResult}">
							<tr style="cursor: pointer;" onclick="window.open('/thi-truong?read=chi-tiet&id=${item.id}');"> 
								<td>${item.title}</td>
								<td>${item.location}</td>
								<td>${item.investor}</td>
								<td>${item.scale}</td>
								<td>${item.price}</td>
								<td>${item.status}</td>
								
							</tr>
						</c:forEach>
					</tbody>

				</table>
			</div>
		</div>
	</div>
	<br>
</body>
</html>