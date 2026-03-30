package com.pharmacy.dao;

import java.sql.*;

import com.pharmacy.model.Bill;
import com.pharmacy.util.DBConnection;

public class BillDAO {

    public void saveBill(Bill bill){

        try{

            Connection con=DBConnection.getConnection();

            String sql="insert into bill(customer,medicine,quantity,price,total) values(?,?,?,?,?)";

            PreparedStatement ps=con.prepareStatement(sql);

            ps.setString(1,bill.getCustomerName());
            ps.setString(2,bill.getMedicineName());
            ps.setInt(3,bill.getQuantity());
            ps.setDouble(4,bill.getPrice());
            ps.setDouble(5,bill.getTotal());

            ps.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}