package com.insert.model;

public class BillBean {
	private String cusName;
    private String cusNic;
    private double givenAmount;
    private double grandTotal;
    private double balance;

    // Getters and Setters
    public String getCusName() { return cusName; }
    public void setCusName(String cusName) { this.cusName = cusName; }

    public String getCusNic() { return cusNic; }
    public void setCusNic(String cusNic) { this.cusNic = cusNic; }

    public double getGivenAmount() { return givenAmount; }
    public void setGivenAmount(double givenAmount) { this.givenAmount = givenAmount; }

    public double getGrandTotal() { return grandTotal; }
    public void setGrandTotal(double grandTotal) { this.grandTotal = grandTotal; }

    public double getBalance() { return balance; }
    public void setBalance(double balance) { this.balance = balance; }
}


