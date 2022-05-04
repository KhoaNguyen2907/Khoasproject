<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>

<body>
<content tag="login">
active
</content>
<div class="limiter">
		<div class="container-login100" style="background-image: url('/template/web/assets/images/bg-01.jpg');">
			<div class="wrap-login100 p-t-5 p-b-100">
				<span class="login100-form-title p-b-41">
					Đăng nhập
				</span>
				<form id="loginForm" class="login100-form validate-form p-b-33 p-t-5" method ="POST">

					<div class="wrap-input100 validate-input" data-validate = "Enter username">
						<input class="input100" type="text" name="userName" placeholder="Tài khoản">
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="password" placeholder="Mật khẩu">
						<span class="focus-input100" data-placeholder="&#xe80f;"></span>
					</div>
				 	<c:if test="${not empty MESSAGE }">
				 	<div class="alert alert-${ALERT} text-center myAlert">
							${MESSAGE}
					</div>
				 	</c:if>
					<div class="container-login100-form-btn m-t-32">
						<button class="login100-form-btn">
							Đăng nhập
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>

</body>
</html>