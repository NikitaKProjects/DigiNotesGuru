package com.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.PostDAO;
import com.Db.DBConnect;
import com.User.Post;

@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int uid = Integer.parseInt(req.getParameter("uid"));
		String title = req.getParameter("topicName");
		String content = req.getParameter("content");
		
		PostDAO dao = new PostDAO(DBConnect.getConn());
		boolean f = dao.addNotes(title, content, uid);
		
		if(f) {
				System.out.println("data inserted");
				resp.sendRedirect("showNotes.jsp");
		}else {
			System.out.println("data not inserted");
		}
	}
	
}
