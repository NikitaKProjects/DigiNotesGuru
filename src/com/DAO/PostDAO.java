package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.User.Post;

public class PostDAO {
    private Connection conn;

    public PostDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean addNotes(String title, String content, int uid) {
        boolean isSuccess = false;
        try {
            String query = "INSERT INTO post(title, content, uid) VALUES (?, ?, ?)";
            try (PreparedStatement ps = conn.prepareStatement(query)) {
                ps.setString(1, title);
                ps.setString(2, content);
                ps.setInt(3, uid);

                int result = ps.executeUpdate();
                if (result == 1) {
                    isSuccess = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    public List<Post> getData(int uid) {
        List<Post> posts = new ArrayList<>();
        try {
            String query = "SELECT * FROM post WHERE uid = ? ORDER BY id DESC";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, uid);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setId(rs.getInt(1));
                post.setTitle(rs.getString(2));
                post.setContent(rs.getString(3));
                post.setPdate(rs.getTimestamp(4));
                posts.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return posts;
    }

    public Post getDataById(int noteId) {
        Post post = null;
        try {
            String query = "SELECT * FROM post WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, noteId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                post = new Post();
                post.setId(rs.getInt(1));
                post.setTitle(rs.getString(2));
                post.setContent(rs.getString(3));
                post.setPdate(rs.getTimestamp(4));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }
    
    public boolean PostUpdate(int nid,String ti,String co) {
    	boolean f = false;
    	try {
			String qu="update post set title=?,content=? where id=?";
			 PreparedStatement ps = conn.prepareStatement(qu);
	            ps.setString(1, ti);
	            ps.setString(2,co); 
	            ps.setInt(3, nid);

	            int i = ps.executeUpdate();
	            if (i==1) {
	            	f=true;
	            }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return f;
    }
    
    public boolean DeleteNotes(int nid) {
        boolean f = false;
        try {
            String query = "DELETE FROM post WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, nid);

            int x = ps.executeUpdate();
            if (x == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

}
