package com.pharmacy.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

import com.pharmacy.dao.MedicineDAO;

@WebServlet("/deleteMedicine")
public class DeleteMedicineServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        MedicineDAO dao = new MedicineDAO();
        dao.deleteMedicine(id);

        response.sendRedirect("viewMedicine.jsp");
    }
}