package com.pharmacy.dao;

import java.sql.*;
import java.util.*;

import com.pharmacy.model.Medicine;
import com.pharmacy.util.DBConnection;

public class MedicineDAO {

Connection con;

public MedicineDAO(){
con=DBConnection.getConnection();
}

/* ADD MEDICINE */

public boolean addMedicine(Medicine m){

boolean status=false;

try{

PreparedStatement ps=con.prepareStatement(
"insert into medicines(name,company,price,quantity) values(?,?,?,?)"
);

ps.setString(1,m.getName());
ps.setString(2,m.getCompany());
ps.setDouble(3,m.getPrice());
ps.setInt(4,m.getQuantity());

int i=ps.executeUpdate();

if(i>0)
status=true;

}catch(Exception e){
e.printStackTrace();
}

return status;

}


/* VIEW MEDICINES */

public List<Medicine> getAllMedicines(){

List<Medicine> list=new ArrayList<>();

try{

PreparedStatement ps=con.prepareStatement(
"select * from medicines"
);

ResultSet rs=ps.executeQuery();

while(rs.next()){

Medicine m=new Medicine();

m.setId(rs.getInt("id"));
m.setName(rs.getString("name"));
m.setCompany(rs.getString("company"));
m.setPrice(rs.getDouble("price"));
m.setQuantity(rs.getInt("quantity"));

list.add(m);

}

}catch(Exception e){
e.printStackTrace();
}

return list;

}


/* DELETE MEDICINE */

public boolean deleteMedicine(int id){

boolean status=false;

try{

PreparedStatement ps=con.prepareStatement(
"delete from medicines where id=?"
);

ps.setInt(1,id);

int i=ps.executeUpdate();

if(i>0)
status=true;

}catch(Exception e){
e.printStackTrace();
}

return status;

}


/* GET MEDICINE BY ID (for edit page) */

public Medicine getMedicineById(int id){

Medicine m=null;

try{

PreparedStatement ps=con.prepareStatement(
"select * from medicines where id=?"
);

ps.setInt(1,id);

ResultSet rs=ps.executeQuery();

if(rs.next()){

m=new Medicine();

m.setId(rs.getInt("id"));
m.setName(rs.getString("name"));
m.setCompany(rs.getString("company"));
m.setPrice(rs.getDouble("price"));
m.setQuantity(rs.getInt("quantity"));

}

}catch(Exception e){
e.printStackTrace();
}

return m;

}


/* UPDATE MEDICINE (THIS FIXES YOUR ERROR) */

public boolean updateMedicine(Medicine m){

boolean status=false;

try{

PreparedStatement ps=con.prepareStatement(
"update medicines set name=?,company=?,price=?,quantity=? where id=?"
);

ps.setString(1,m.getName());
ps.setString(2,m.getCompany());
ps.setDouble(3,m.getPrice());
ps.setInt(4,m.getQuantity());
ps.setInt(5,m.getId());

int i=ps.executeUpdate();

if(i>0)
status=true;

}catch(Exception e){
e.printStackTrace();
}

return status;

}


/* DASHBOARD METHODS */

public int getTotalMedicines(){

int count=0;

try{

PreparedStatement ps=con.prepareStatement(
"select count(*) from medicines"
);

ResultSet rs=ps.executeQuery();

if(rs.next())
count=rs.getInt(1);

}catch(Exception e){}

return count;
}


public int getLowStockMedicines(){

int count=0;

try{

PreparedStatement ps=con.prepareStatement(
"select count(*) from medicines where quantity<10"
);

ResultSet rs=ps.executeQuery();

if(rs.next())
count=rs.getInt(1);

}catch(Exception e){}

return count;
}


public int getTotalStock(){

int total=0;

try{

PreparedStatement ps=con.prepareStatement(
"select sum(quantity) from medicines"
);

ResultSet rs=ps.executeQuery();

if(rs.next())
total=rs.getInt(1);

}catch(Exception e){}

return total;
}

}