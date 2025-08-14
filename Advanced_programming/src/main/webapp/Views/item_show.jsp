<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.insert.model.ShowItemBean" %>

<%
    if (request.getAttribute("itemList") == null) {
%>
    <jsp:forward page="/ShowItemServlet" />
<%
        return;
    }

    List<ShowItemBean> itemList = (List<ShowItemBean>) request.getAttribute("itemList");
    String message = (String) request.getAttribute("message");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Items</title>
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
    </style>
</head>
<body>

<div style="width: 90%; margin: 20px auto; background-color: #e6f2ff; padding: 15px; border: 1px solid #b3d1ff; border-radius: 8px; text-align: center;">
    <h2 style="color: blue; margin: 0;">All Registered Items</h2>
</div>

<div class="top-bar">
    <form class="search-form" action="<%=request.getContextPath()%>/ShowItemServlet" method="get">
        <input type="text" name="search" placeholder="Search by item code or name..." />
        <button type="submit">Search</button>
    </form>
    <a href="dashboard.jsp" class="form-submit"><b>Back to Dashboard</b></a>
</div>

<% if (message != null) { %>
    <div class="alert"><%= message %></div>
<% } %>

<table>
    <tr>
        <th>Code</th>
        <th>Name</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Special Text</th>
        <th>Unit Price</th>
        <th>Actions</th>
    </tr>
    <%
        if (itemList != null && !itemList.isEmpty()) {
            for (ShowItemBean item : itemList) {
    %>
    <tr>
        <td><%= item.getItemCode() %></td>
        <td><%= item.getItemName() %></td>
        <td><%= item.getQuantity() %></td>
        <td><%= item.getPrice() %></td>
        <td><%= item.getSpecialText() %></td>
        <td><%= item.getUnitPrice() %></td>
        <td>
            <a class="button" href="item_manage.jsp?code=<%= item.getItemCode() %>">Update</a>
            <a class="button delete-button" href="<%=request.getContextPath()%>/ShowItemServlet?action=delete&code=<%= item.getItemCode() %>" onclick="return confirm('Are you sure to delete?')">Delete</a>
        </td>
    </tr>
    <%
            }
        } else {
    %>
    <tr><td colspan="7">No items found.</td></tr>
    <% } %>
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

    // Open new print window
    var printWindow = window.open('', '', 'height=700,width=900');
    printWindow.document.write('<html><head><title>All Items</title>');
    printWindow.document.write('<style>');
    printWindow.document.write('table { width: 100%; border-collapse: collapse; font-family: Arial; }');
    printWindow.document.write('th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }');
    printWindow.document.write('th { background-color: #3498db; color: white; }');
    printWindow.document.write('</style>');
    printWindow.document.write('</head><body>');
    printWindow.document.write('<h2 style="text-align:center;">All Registered Items</h2>');
    printWindow.document.write(tableClone.outerHTML);
    printWindow.document.write('</body></html>');
    printWindow.document.close();
    printWindow.print();
}
</script>

</body>
</html>
