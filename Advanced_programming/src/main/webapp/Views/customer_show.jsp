<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.insert.model.CusRegisterBean" %>
<%
    List<CusRegisterBean> customerList = (List<CusRegisterBean>) request.getAttribute("customerList");
    String message = (String) request.getAttribute("message");

    if (customerList == null) {
%>
    <jsp:forward page="/ShowCustomerServlet" />
<%
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer List</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <style>
        body {
            background-image: url('images/bookshop_bg.jpg'); 
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            min-height: 100vh;
        }

        .top-bar {
            width: 90%;
            margin: 20px auto;
            display: flex;
            justify-content: space-between;
        }

        .search-form input[type="text"] {
            padding: 8px;
            width: 200px;
            border: 1px solid #ccc;
        }

        .search-form button {
            padding: 8px 12px;
            background-color: #3498db;
            color: white;
            border: none;
            cursor: pointer;
        }

        .alert {
            width: 90%;
            margin: 0 auto 15px auto;
            padding: 10px;
            background-color: #d4edda;
            color: #155724;
            border-left: 4px solid #28a745;
        }

        table {
            width: 90%;
            margin: 10px auto;
            border-collapse: collapse;
            background: #fff;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ccc;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        a.button {
            padding: 6px 12px;
            color: white;
            background-color: #28a745;
            text-decoration: none;
            border-radius: 4px;
            margin-right: 5px;
        }

        a.delete-button {
            background-color: #dc3545;
        }

        .back-button {
            padding: 8px 14px;
            background-color: #6c757d;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-size: 14px;
        }
    </style>
</head>
<body>
<div style="width: 90%; margin: 20px auto; background-color: #e6f2ff; padding: 15px; border: 1px solid #b3d1ff; border-radius: 8px; text-align: center;">
    <h2 style="color: blue; margin: 0;">All Registered Customers</h2>
</div>
  
<div class="top-bar">
    <form class="search-form" action="<%=request.getContextPath()%>/ShowCustomerServlet" method="get">
        <input type="text" name="search" placeholder="Search by NIC..." />
        <button type="submit">Search</button>
    </form>
    <a href="<%=request.getContextPath()%>/Views/dashboard.jsp" class="form-submit"><b>Back to Dashboard</b></a>
</div>

<% if (message != null) { %>
    <div class="alert"><%= message %></div>
<% } %>

<table>
    <tr>
        <th>Name</th>
        <th>NIC</th>
        <th>Address</th>
        <th>Hometown</th>
        <th>Telephone</th>
        <th>Email</th>
        <th>Actions</th>
    </tr>
    <%
        if (customerList != null && !customerList.isEmpty()) {
            for (CusRegisterBean cus : customerList) {
    %>
    <tr>
        <td><%= cus.getCustomer_Name() %></td>
        <td><%= cus.getCustomer_Nic() %></td>
        <td><%= cus.getCustomer_Address() %></td>
        <td><%= cus.getCustomer_Hometown() %></td>
        <td><%= cus.getCustomer_Tele() %></td>
        <td><%= cus.getCustomer_Email() %></td>
        <td>
            <a class="button" href="Views/customer_manage.jsp?nic=<%=cus.getCustomer_Nic()%>">Update</a>
            <a class="button delete-button" href="<%=request.getContextPath()%>/ShowCustomerServlet?delete=<%=cus.getCustomer_Nic()%>" onclick="return confirm('Are you sure you want to delete this customer?');">Delete</a>
        </td>
    </tr>
    <%
            }
        } else {
    %>
    <tr><td colspan="7" style="text-align:center;">No customers found.</td></tr>
    <%
        }
    %>
</table>
<div style="width: 90%; margin: 20px auto; text-align: right;">
    <button onclick="printOnlyTable()" 
        style="padding: 10px 16px; 
               background-color: #007bff; 
               color: white; 
               border: none; 
               border-radius: 4px; 
               cursor: pointer;">
        🖨️ Print / Save as PDF
    </button>
</div>

<script>
function printOnlyTable() {
    // Clone the table
    var tableClone = document.querySelector("table").cloneNode(true);

    // Remove last column (Actions) from each row
    tableClone.querySelectorAll("tr").forEach(function(row) {
        if (row.cells.length > 0) {
            row.deleteCell(row.cells.length - 1);
        }
    });

    // Open new print-friendly window
    var printWindow = window.open('', '', 'height=700,width=900');
    printWindow.document.write('<html><head><title>Customer List</title>');
    printWindow.document.write('<style>');
    printWindow.document.write('table { width: 100%; border-collapse: collapse; font-family: Arial; }');
    printWindow.document.write('th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }');
    printWindow.document.write('th { background-color: #3498db; color: white; }');
    printWindow.document.write('h2 { text-align: center; font-family: Arial; }');
    printWindow.document.write('</style>');
    printWindow.document.write('</head><body>');
    printWindow.document.write('<h2>All Registered Customers</h2>');
    printWindow.document.write(tableClone.outerHTML);
    printWindow.document.write('</body></html>');
    printWindow.document.close();
    printWindow.print();
}
</script>


</body>
</html>
