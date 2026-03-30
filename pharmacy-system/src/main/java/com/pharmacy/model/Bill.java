package com.pharmacy.model;

public class Bill {

    private int id;
    private String customerName;
    private String medicineName;
    private int quantity;
    private double price;
    private double total;

    public Bill(){}

    public int getId(){ return id; }
    public void setId(int id){ this.id=id; }

    public String getCustomerName(){ return customerName; }
    public void setCustomerName(String customerName){ this.customerName=customerName; }

    public String getMedicineName(){ return medicineName; }
    public void setMedicineName(String medicineName){ this.medicineName=medicineName; }

    public int getQuantity(){ return quantity; }
    public void setQuantity(int quantity){ this.quantity=quantity; }

    public double getPrice(){ return price; }
    public void setPrice(double price){ this.price=price; }

    public double getTotal(){ return total; }
    public void setTotal(double total){ this.total=total; }
}