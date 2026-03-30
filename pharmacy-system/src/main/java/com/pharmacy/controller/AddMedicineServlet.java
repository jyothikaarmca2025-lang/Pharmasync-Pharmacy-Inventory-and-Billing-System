package com.pharmacy.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.pharmacy.dao.MedicineDAO;
import com.pharmacy.model.Medicine;

@WebServlet("/addMedicine")

public class AddMedicineServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

try{

String name = request.getParameter("name");
String company = request.getParameter("company");

double price = Double.parseDouble(request.getParameter("price"));
int quantity = Integer.parseInt(request.getParameter("quantity"));

Medicine m = new Medicine();

m.setName(name);
m.setCompany(company);
m.setPrice(price);
m.setQuantity(quantity);

MedicineDAO dao = new MedicineDAO();

dao.addMedicine(m);

/* Redirect after inserting */

response.sendRedirect("viewMedicine.jsp");

}catch(Exception e){
e.printStackTrace();
}

}

}