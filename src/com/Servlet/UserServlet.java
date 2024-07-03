package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.Db.DBConnect;
import com.User.UserDetails;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("fname");
        String email = req.getParameter("uemail");
        String password = req.getParameter("upassword");

        UserDetails userDetails = new UserDetails();
        userDetails.setName(name);
        userDetails.setEmail(email);
        userDetails.setPassword(password);

        UserDAO dao = new UserDAO(DBConnect.getConn());
        boolean added = dao.addUser(userDetails);
        HttpSession session;
        
        if (added) {
        	session = req.getSession();
        	session.setAttribute("reg-success", "Registration Succesful :)");
        	resp.sendRedirect("register.jsp");
        } else {
        	
        	session = req.getSession();
        	session.setAttribute("failed-msg", "Failed to register :(");
        	resp.sendRedirect("register.jsp");
        }
    }
}
