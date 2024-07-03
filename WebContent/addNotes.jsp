<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
UserDetails user1=(UserDetails)session.getAttribute("UserD");
 
if(user1==null){
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please login");
} 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
    <div class="container-fluid p-0 mb-4 ">
        <%@include file="all_component/navbar.jsp"%>
        <h3 class="text-center py-2">ADD YOUR NOTES HERE</h3>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <form action="AddNotesServlet" method="post">
                        <div class="form-group">
                            <% 
                            UserDetails ud = (UserDetails) session.getAttribute("UserD");
                            if (ud != null) { 
                            %>
                            <input  value="<%=ud.getId()%>" name="uid" hidden>
                            <% }  %>
                            
                            <label for="exampleInputEmail1">Enter Topic Name</label> 
                            <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter Topic name" name="topicName" required="required">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputContent">Enter Content</label>
                            <textarea rows="10" class="form-control" id="exampleInputContent" name="content" required="required"></textarea>
                        </div>

                        <div class="container text-center">
                            <button type="submit" class="btn btn-primary">Save Notes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <%@include file="all_component/footer.jsp"%>
</body>
</html>
