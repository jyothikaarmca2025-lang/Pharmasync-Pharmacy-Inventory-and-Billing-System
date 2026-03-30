package com.pharmacy.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

import com.pharmacy.dao.BillDAO;
import com.pharmacy.model.Bill;

@WebServlet("/generateBill")
public class BillServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String customer = request.getParameter("customer");
        String medicine = request.getParameter("medicine");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));

        double total = quantity * price;

        Bill bill = new Bill();
        bill.setCustomerName(customer);
        bill.setMedicineName(medicine);
        bill.setQuantity(quantity);
        bill.setPrice(price);
        bill.setTotal(total);

        BillDAO dao = new BillDAO();
        dao.saveBill(bill);

        request.setAttribute("bill", bill);

        RequestDispatcher rd = request.getRequestDispatcher("invoice.jsp");
        rd.forward(request, response);
    }
}