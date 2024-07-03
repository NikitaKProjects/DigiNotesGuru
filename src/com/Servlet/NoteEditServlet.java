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

@WebServlet("/NoteEditServlet")
public class NoteEditServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer noteid = null;
        try {
            noteid = Integer.parseInt(req.getParameter("noteid").trim());
        } catch (NumberFormatException e) {
            e.printStackTrace();
            System.out.println("Invalid note ID");
            return;
        }

        String title = req.getParameter("title");
        String content = req.getParameter("content");

        if (title != null && content != null) {
            try {
                PostDAO dao = new PostDAO(DBConnect.getConn());
                boolean isUpdated = dao.PostUpdate(noteid, title, content);
                
                if (isUpdated) {
                    System.out.println("Data updated successfully");
                    HttpSession session = req.getSession();
                    session.setAttribute("update-msg", "Notes Updated Successfully");
                    resp.sendRedirect("showNotes.jsp");
                } else {
                    System.out.println("Error updating data");
                }
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("Exception occurred while updating data");
            }
        } else {
            System.out.println("Title or content is missing");
        }
    }
}
