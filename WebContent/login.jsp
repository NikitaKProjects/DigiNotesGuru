<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<%@include file="all_component/allcss.jsp"%>
<style>
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

.wrapper {
	display: flex;
	flex-direction: column;
	min-height: 96vh;
	/* Ensure the wrapper spans the full viewport height */
}

.content {
	flex: 1; /* Allow the content to expand to fill available space */
}
</style>
</head>
<body>
	<div class="wrapper">
		<%@include file="all_component/navbar.jsp"%>

		<div class="container-fluid div-color content">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card mt-4">
						<div class="card-header text-center text-white bg-custom">
							<i class="fa-solid fa-right-to-bracket fs-1"></i>
							<h4>Login</h4>
						</div>



						<%
						String failedMsg = (String) session.getAttribute("login-failed");
						if (failedMsg != null) {
						%>
						<div class="alert alert-danger" role="alert">
							<%=failedMsg%>
						</div>
						<%
						session.removeAttribute("login-failed");
						}
						%>
						
						<% String withoutLogin = (String)session.getAttribute("Login-error");
						if(withoutLogin!=null){%>
							<div class="alert alert-danger" role="alert">
							<%=withoutLogin%>
						</div>
						<%
						session.removeAttribute("Login-error");
						}
						%>
						
						<% String loggedOut = (String)session.getAttribute("logoutMsg");
						if(loggedOut!=null){%>
							<div class="alert alert-info" role="alert">
							<%=loggedOut%>
						</div>
						<%
						session.removeAttribute("logoutMsg");
						}
						%>
						
						
						<div class="card-body">
							<form action="loginServlet" method="post">

								<div class="mb-3">
									<label class="form-label">Enter Email address</label> <input
										type="email" class="form-control" id="email" name="uemail">
								</div>
								<div class="mb-3">
									<label class="form-label">Enter Password</label> <input
										type="password" class="form-control" id="password"
										name="upassword">
								</div>
								<button type="submit" class="btn btn-primary btn-block">Login</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>
