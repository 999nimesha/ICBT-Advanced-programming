package com.insert.model;

public class ShowItemBean {
    private String itemCode;
    private String itemName;
    private int quantity;
    private double price;
    private String specialText;
    private double unitPrice;

    public String getItemCode() { return itemCode; }
    public void setItemCode(String itemCode) { this.itemCode = itemCode; }

    public String getItemName() { return itemName; }
    public void setItemName(String itemName) { this.itemName = itemName; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public String getSpecialText() { return specialText; }
    public void setSpecialText(String specialText) { this.specialText = specialText; }

    public double getUnitPrice() { return unitPrice; }
    public void setUnitPrice(double unitPrice) { this.unitPrice = unitPrice; }
}
