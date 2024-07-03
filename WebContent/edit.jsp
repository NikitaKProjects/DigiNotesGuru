<%@page import="com.User.Post"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.DAO.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
UserDetails user4 = (UserDetails) session.getAttribute("UserD");

if (user4 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please login");
	return; // Ensure no further processing happens after redirect
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Content Page</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>

	<%
	Integer noteid = null;
	try {
		noteid = Integer.parseInt(request.getParameter("note_id").trim());
	} catch (NumberFormatException e) {
		e.printStackTrace();
		// Handle the error, possibly by showing an error message or redirecting
	}

	if (noteid != null) {
		PostDAO postDAO = new PostDAO(DBConnect.getConn());
		Post post = postDAO.getDataById(noteid);
		if (post != null) {
	%>
	<div class="container-fluid p-0 mb-4">
		<%@include file="all_component/navbar.jsp"%>
		<h3 class="text-center py-2">EDIT YOUR NOTES</h3>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form action="NoteEditServlet" method="post">
					
						<input type="hidden" value="<%=noteid%>" name="noteid">

						<div class="form-group">
							<label for="exampleInputEmail1">Enter Topic Name</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								placeholder="Enter Topic name" name="title"
								required="required" value="<%=post.getTitle()%>">
						</div>
						<div class="form-group">
							<label for="exampleInputContent">Enter Content</label>
							<textarea rows="10" class="form-control" id="exampleInputContent"
								name="content" required="required"><%=post.getContent()%></textarea>
						</div>

						<div class="container text-center">
							<button type="submit" class="btn btn-primary">Save Notes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%
	} else {
	out.println("<h3 class='text-center py-2'>Note not found</h3>");
	}
	}
	%>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>
