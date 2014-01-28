package com;

import com.controller.DatabaseManager;
import com.dao.UserDao;
import com.dao.UserDaoImpl;
import com.dao.hibernate.UserDaoJPA;
import com.model.User;
import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class RegistratorServlet extends HttpServlet {
    private UserDaoJPA daoJPA = new UserDaoJPA();
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("utf8");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("utf8");
        PrintWriter out = response.getWriter();
            
        DatabaseManager db = new DatabaseManager("jdbc:mysql://localhost:3306/", "bullscowsgame", "com.mysql.jdbc.Driver", "root", "050391z");
        User user = db.getUserFromDatabase(request.getParameter("userName"), request.getParameter("password"));
        db.closeConnection();
                
        HttpSession session = request.getSession(true);
        if(user != null) {                   
            session.setAttribute("user", user);           
        }
        session.setAttribute("auth", new Boolean(true));
        
        //getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        User user_test = new User("test", "test");
        daoJPA.addUser(user_test);
        
        response.sendRedirect("index.jsp");
    }
}
