<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-4">
					<div class="card-header text-center text-white bg-custom">
						<i class="fa-solid fa-user-plus fa-3x"></i>
						<h4>Registration</h4>
					</div>

					<%
					String regMsg = (String) session.getAttribute("reg-success");
					if (regMsg != null) {
					%>
					<div class="alert alert-success" role="alert">
						<%=regMsg%><a href="login.jsp "> Click Here to Login</a>
					</div>
					<%
					session.removeAttribute("reg-success");
					}
					%>

					<%
					String failedMsg = (String) session.getAttribute("failed-msg");
					if (failedMsg != null) {
					%>
					<div class="alert alert-danger" role="alert">
						<%=failedMsg%>
					</div>
					<%
					session.removeAttribute("failed-msg");
					}
					%>

					<div class="card-body">
						<form action="UserServlet" method="post">
							<div class="mb-3">
								<label class="form-label">Enter Full Name</label> <input
									type="text" class="form-control" id="username" name="fname">
							</div>
							<div class="mb-3">
								<label class="form-label">Enter Email address</label> <input
									type="email" class="form-control" id="email" name="uemail">
							</div>
							<div class="mb-3">
								<label class="form-label">Enter Password</label> <input
									type="password" class="form-control" id="password"
									name="upassword">
							</div>
							<button type="submit" class="btn btn-primary btn-block">Register</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>
