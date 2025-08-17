<%@ page import="java.util.*,com.insert.model.CartItemBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Cart - Billing</title>
    <link rel="stylesheet" href="../fonts/material-icon/css/material-design-iconic-font.min.css" />
    <link rel="stylesheet" href="../css/style.css" />
    <style>
        body {
            background-image: url('../images/registration_bg.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            min-height: 100vh;
        }
        .main {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 15px;
            margin-top: 50px;
            box-shadow: 0 0 20px rgba(0,0,0,0.2);
            max-width: 900px;
            margin-left: auto;
            margin-right: auto;
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
            background-color: #2979ff;
            color: white;
        }
        .form-group {
            margin-bottom: 20px;
        }
        input {
            padding: 10px;
            border-radius: 7px;
            border: 1px solid #ccc;
            width: 100%;
        }
        .form-submit {
            background-color: #2979ff;
            color: white;
            border: none;
            cursor: pointer;
            padding: 12px 25px;
            font-size: 18px;
            border-radius: 8px;
            width: 100%;
        }
        .form-submit:hover {
            background-color: #1565c0;
        }
        a.remove-btn {
            color: #f44336;
            font-weight: bold;
            text-decoration: none;
        }
        a.remove-btn:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="main">
    <h2 class="form-title">Your Cart</h2>

    <%
        List<CartItemBean> cart = (List<CartItemBean>) session.getAttribute("cart");
        String customerName = (String) session.getAttribute("customerName");
        String customerNic = (String) session.getAttribute("customerNic");

        if (cart == null || cart.isEmpty()) {
    %>

        <p style="text-align:center; font-weight:bold; font-size:18px;">Your cart is empty.</p>
        <div style="text-align:center;">
            <a href="<%=request.getContextPath()%>/Views/bill.jsp" style="color:#2979ff; font-weight:bold;">Add Items</a>
        </div>

    <%
        } else {
    %>

    <!-- Display Customer Info -->
   Customer Name: <div class="form-group">
        <label><b></b></label>
        <input type="text" value="<%= customerName %>" readonly />
    </div>

   Customer NIC: <div class="form-group">
        <label><b></b></label>
        <input type="text" value="<%= customerNic %>" readonly />
    </div>

    <table>
        <thead>
            <tr>
                <th>Item Code</th><th>Item Name</th><th>Unit Price</th><th>Quantity</th><th>Total</th><th>Remove</th>
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
                    <td><a href="<%=request.getContextPath()%>/RemoveCartItemServlet?code=<%= item.getItemCode() %>" class="remove-btn" onclick="return confirm('Remove this item?');">Remove</a></td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <form action="<%=request.getContextPath()%>/BillingServlet" method="post">
        <div class="form-group">
            <label><b></b></label>
            <input type="text" name="grand_total" value="<%= String.format("%.2f", grandTotal) %>" readonly />
        </div>

        

        Given Amount<div class="form-group">
            <label for="given_amount"><i class="zmdi zmdi-money"></i> </label>
            <input type="number" step="0.01" name="given_amount" id="given_amount" min="<%= grandTotal %>" placeholder="Enter given amount" required />
        </div>

        <div class="form-group">
            <button type="submit" class="form-submit">Generate Bill</button>
        </div>
    </form>

    <div style="text-align:center;">
        <a href="<%=request.getContextPath()%>/Views/bill.jsp" style="color:#2979ff; font-weight:bold;">Add More Items</a>
    </div>

    <%
        }
    %>

</div>

</body>
</html>
