<%@page import="com.User.Post"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
UserDetails user3 = (UserDetails) session.getAttribute("UserD");

if (user3 == null) {
    response.sendRedirect("login.jsp");
    session.setAttribute("Login-error", "Please login");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Notes</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
    <%@include file="all_component/navbar.jsp"%>
    
    <% 
    String updateMsg = (String) session.getAttribute("update-msg");
    if (updateMsg != null) {
    %>
        <div class="alert alert-success" role="alert">
            <%= updateMsg %>
        </div>
    <%
        session.removeAttribute("update-msg");
    }
    %>
    
    <% 
    String wrongMsg = (String) session.getAttribute("wrongMessage");
    if (wrongMsg != null) {
    %>
        <div class="alert alert-danger" role="alert">
            <%= wrongMsg %>
        </div>
    <%
        session.removeAttribute("wrongMessage");
    }
    %>
    

    <div class="container">
        <h2 class="text-center">All Notes:</h2>
        <div class="row">
            <div class="col-md-12">
                <%
                if (user3 != null) {
                    PostDAO ob = new PostDAO(DBConnect.getConn());
                    List<Post> posts = ob.getData(user3.getId());
                    for (Post post : posts) {
                %>
                    <div class="card mt-3">
                        <img alt="Note Image" src="img/paper.png" class="card-img-top mt-2 mx-auto" style="max-width: 100px">
                        <div class="card-body p-4">
                            <h5 class="card-title"><%= post.getTitle() %></h5>
                            <p><%= post.getContent() %>.</p>
                            <p>
                                <b class="text-success">Published By: <%= user3.getName() %></b>
                            </p>
                            <p>
                                <b class="text-primary">Published Date: <%= post.getPdate() %></b><br>
                            </p>
                            <div class="container text-center mt-2">
                                <a href="deleteServlet?note_id=<%= post.getId() %>" class="btn btn-danger">Delete</a>
                                <a href="edit.jsp?note_id=<%= post.getId() %>" class="btn btn-primary">Edit</a>
                            </div>
                        </div>
                    </div>
                <%
                    }
                }
                %>
            </div>
        </div>
    </div>

    
</body>
</html>
