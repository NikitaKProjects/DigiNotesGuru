package com.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.Db.DBConnect;
import com.User.UserDetails;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("uemail");
        String password = req.getParameter("upassword");
        
        UserDetails us = new UserDetails();
        us.setEmail(email); // Set email retrieved from the form
        us.setPassword(password); // Set password retrieved from the form
        
        UserDAO dao =  new UserDAO(DBConnect.getConn());
        UserDetails user = (UserDetails) dao.loginUser(us);
        
        if(user!=null) {

        	HttpSession session = req.getSession();
        	session.setAttribute("UserD", user);
            resp.sendRedirect("home.jsp");
        } else {
        	HttpSession session = req.getSession();
        	session.setAttribute("login-failed", "Invalid Email and password");
        	resp.sendRedirect("login.jsp");
        }
    }

}
