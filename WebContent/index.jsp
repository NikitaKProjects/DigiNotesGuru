<%@page import="java.sql.Connection"%>
<%@page import="com.Db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style type="text/css">
        .back-img {
            background: url("img/bg2.jpg") no-repeat;
            background-size: cover;
            width: 100%;
            height: 86vh;
        }
        /* Adjusted .btn-custom to increase specificity */
        .btn-custom.btn {
            width: 200px; /* Adjust width as needed */
            border: 2px solid #ff6d00 !important; /* Orange border */
            border-radius:1em;
            color: black !important; /* Text color */
             font-size: 18px;	
            transition: all 0.3s ease; /* Smooth transition for hover effect */
            display: inline-block; /* Ensure button takes full width */
            text-align: center; /* Center text */
            padding: 8px 16px; /* Adjust padding */
            margin-top: 10px; /* Adjust margin */
        }
        .btn-custom.btn:hover {
            background-color: #ff6d00  !important; /* Change background on hover */
            color: black !important; /* Text color on hover */
        } 
        .btn-custom i {
            margin-right: 5px; /* Optional: Add space between icon and text */
        }
    </style>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <%@include file="all_component/allcss.jsp"%>
</head>
<body>
    <%@include file="all_component/navbar.jsp"%>
    

    <div class="container-fluid back-img">
        <div class="text-center">
            <h1 class="pt-3 text-white">
                <i class="fa-solid fa-swatchbook"></i> DigiNotesGuru - Save Your Notes
            </h1>

            <a href="login.jsp" class="btn btn-light btn-custom btn"><i class="fa-solid fa-circle-user fs-4 "></i> Login</a>
            <a href="register.jsp" class="btn btn-light btn-custom btn"><i class="fa-solid fa-user-plus fs-5"></i> Register</a>
        </div>
    </div>
    <%@include file="all_component/footer.jsp"%>

</body>
</html>
