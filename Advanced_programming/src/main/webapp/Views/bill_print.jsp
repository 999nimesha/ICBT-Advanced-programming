<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.insert.model.BillBean" %>
<%@ page import="com.insert.model.CartItemBean" %>
<%@ page import="java.text.SimpleDateFormat" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Print Bill</title>
    <link rel="stylesheet" href="../fonts/material-icon/css/material-design-iconic-font.min.css" />
    <link rel="stylesheet" href="../css/style.css" />
    <style>
        body {
            background: white;
            font-family: Arial, sans-serif;
            padding: 40px;
            background-image: url('images/registration_bg.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            min-height: 100vh;
    }
        .bill-container {
            max-width: 700px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }
        .header {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
        }
        .logo {
            width: 100px;
            height: auto;
        }
        .company-info {
            margin-left: 20px;
        }
        .company-info h2 {
            margin: 0;
            font-size: 24px;
            color: #333;
        }
        .company-info p {
            margin: 2px 0;
            font-size: 14px;
            color: #666;
        }
        .bill-table {
            width: 100%;
            border-collapse: collapse;
        }
        .bill-table td {
            padding: 10px;
            vertical-align: top;
        }
        .total {
            font-weight: bold;
        }
        .btn-print {
            display: block;
            width: 100%;
            margin-top: 30px;
            padding: 10px;
            font-size: 16px;
            background: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
        }
        .bill-container {
            max-width: 700px;
            margin: auto;
            border: 1px solid #ddd;
            padding: 25px;
            border-radius: 15px;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 25px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: center;
        }
        th {
            background-color:light blue;
            color: black;
        }
        .total-row td {
            font-weight: bold;
        }
        .btn-print {
            background-color: #2979ff;
            color: white;
            border: none;
            cursor: pointer;
            padding: 12px 25px;
            font-size: 18px;
            border-radius: 8px;
            width: 100%;
            margin-top: 10px;
        }
        @media print {
    .no-print {
        display: none;
    }
}
        
    </style>
</head>
<body>
<%
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String todayDate = sdf.format(new java.util.Date());
%>

<div class="bill-container">
   <div class="header">
        <img src="<%=request.getContextPath()%>/images/Pahana_Edu_Bookshop_Logo.jpg" alt="Company Logo" class="logo">
        <div class="company-info">
            <h2><center>Pahana Edu Bookshop</center></h2>
            <p>123/1, Main Street, Colombo</p>
            <p>Email: info@pahanaedu.lk</p>
            <p>Tel: +94 11 2345678</p>
             <p>Date: <%= todayDate %></p> <!-- Added today's date -->
        </div>
    </div>

    <%
        BillBean bill = (BillBean) session.getAttribute("bill");
        List<CartItemBean> cart = (List<CartItemBean>) session.getAttribute("cart");
        if (bill == null || cart == null) {
    %>
        <p>No bill or cart data found!</p>
    <%
        } else {
    %>

    <table>
    
        
        <tr><th>Given Amount</th><td><%= String.format("%.2f", bill.getGivenAmount()) %></td></tr>
        <tr><th>Balance</th><td><%= String.format("%.2f", bill.getBalance()) %></td></tr>
    </table>

    <table>
        <thead>
            <tr>
                <th>Item Code</th>
                <th>Item Name</th>
                <th>Unit Price</th>
                <th>Quantity</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            <%
                double grandTotal = 0;
                for (CartItemBean item : cart) {
                    grandTotal += item.getTotal();
            %>
            <tr>
                <td><%= item.getItemCode() %></td>
                <td><%= item.getItemName() %></td>
                <td><%= String.format("%.2f", item.getUnitPrice()) %></td>
                <td><%= item.getQuantity() %></td>
                <td><%= String.format("%.2f", item.getTotal()) %></td>
            </tr>
            <% } %>
            <tr class="total-row">
                <td colspan="4">Grand Total</td>
                <td><%= String.format("%.2f", grandTotal) %></td>
            </tr>
        </tbody>
    </table>

    <button class="btn-print no-print" onclick="window.print();"> 🖨️ Print / Save as PDF</button>


    <%
        }
    %>
</div>

</body>
</html>
