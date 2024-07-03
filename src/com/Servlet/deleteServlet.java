package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PostDAO;
import com.Db.DBConnect;

@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer note_id = Integer.parseInt(req.getParameter("note_id"));
        PostDAO dao = new PostDAO(DBConnect.getConn());
        boolean f = dao.DeleteNotes(note_id);
        HttpSession session = req.getSession();

        if (f) {
            session.setAttribute("update-msg", "Notes Deleted Successfully");
        } else {
            session.setAttribute("wrongMessage", "Something went wrong");
        }

        resp.sendRedirect("showNotes.jsp");
    }
}
