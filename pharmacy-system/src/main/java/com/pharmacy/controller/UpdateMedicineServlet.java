package com.pharmacy.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.pharmacy.dao.MedicineDAO;
import com.pharmacy.model.Medicine;

@WebServlet("/updateMedicine")

public class UpdateMedicineServlet extends HttpServlet {

private static final long serialVersionUID = 1L;

protected void doPost(HttpServletRequest request,
HttpServletResponse response)
throws ServletException, IOException {

try{

int id = Integer.parseInt(request.getParameter("id"));
String name = request.getParameter("name");
String company = request.getParameter("company");
double price = Double.parseDouble(request.getParameter("price"));
int quantity = Integer.parseInt(request.getParameter("quantity"));

Medicine m = new Medicine();

m.setId(id);
m.setName(name);
m.setCompany(company);
m.setPrice(price);
m.setQuantity(quantity);

MedicineDAO dao = new MedicineDAO();

boolean status = dao.updateMedicine(m);

if(status){

response.sendRedirect("viewMedicine.jsp");

}else{

response.getWriter().println("Update Failed");

}

}catch(Exception e){
e.printStackTrace();
}

}

}