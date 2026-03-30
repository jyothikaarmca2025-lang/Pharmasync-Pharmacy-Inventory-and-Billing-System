package com.pharmacy.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

import com.pharmacy.dao.UserDAO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();

        boolean status = dao.validateUser(username, password);

        if (status) {

            HttpSession session = request.getSession();
            session.setAttribute("user", username);

            response.sendRedirect("dashboard.jsp");

        } else {

            request.setAttribute("error", "Invalid Username or Password");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);

        }
    }
}