package com.pharmacy.model;

public class Medicine {

private int id;
private String name;
private String company;
private double price;
private int quantity;

public int getId(){
return id;
}

public void setId(int id){
this.id=id;
}

public String getName(){
return name;
}

public void setName(String name){
this.name=name;
}

public String getCompany(){
return company;
}

public void setCompany(String company){
this.company=company;
}

public double getPrice(){
return price;
}

public void setPrice(double price){
this.price=price;
}

public int getQuantity(){
return quantity;
}

public void setQuantity(int quantity){
this.quantity=quantity;
}

}