<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.insert.model.MItemBean" %>
<%
MItemBean item = (MItemBean) request.getAttribute("item");
String message = (String) request.getAttribute("message");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Item Manage - Pahana Edu Bookshop</title>
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            background-image: url('images/registration_bg.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            min-height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .main {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 15px;
            margin-top: 30px;
            box-shadow: 0 0 20px rgba(0,0,0,0.2);
            width: 90%;
            max-width: 800px;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
        }
    </style>
</head>
<body>
<div class="main">
    <div style="display: flex; flex-wrap: wrap; gap: 40px; justify-content: center;">
        <!-- Left Side -->
        <div style="flex: 1; min-width: 300px;">
            <h2 class="form-title">Manage Item</h2>

            <!-- Search -->
            <form action="<%=request.getContextPath()%>/ItemManageServlet" method="get" class="register-form">
                <div class="form-group">
                    <label for="search_code"><i class="zmdi zmdi-search"></i></label>
                    <input type="text" name="search_code" id="search_code" placeholder="Enter Item Code to Search" required />
                </div>
                <div class="form-group form-button">
                    <button type="submit" name="action" value="search" class="form-submit">Search</button>
                </div>
            </form>

            <!-- Update/Delete -->
            <form action="<%=request.getContextPath()%>/ItemManageServlet" method="post" class="register-form">
                <div class="form-group">
                    <label for="code"><i class="zmdi zmdi-label"></i></label>
                    <input type="text" name="item_code" id="code" value="<%= item != null ? item.getItemCode() : "" %>" readonly placeholder="Item Code" />
                </div>
                <div class="form-group">
                    <label for="name"><i class="zmdi zmdi-shopping-cart"></i></label>
                    <input type="text" name="item_name" id="name" value="<%= item != null ? item.getItemName() : "" %>" placeholder="Item Name" />
                </div>
                <div class="form-group">
                    <label for="quantity"><i class="zmdi zmdi-format-list-numbered"></i></label>
                    <input type="number" name="i_quantity" id="quantity" value="<%= item != null ? item.getQuantity() : "" %>" placeholder="Quantity" />
                </div>
                <div class="form-group">
                    <label for="price"><i class="zmdi zmdi-money"></i></label>
                    <input type="text" name="item_price" id="price" value="<%= item != null ? item.getPrice() : "" %>" placeholder="Price" />
                </div>
                <div class="form-group">
                    <label for="text"><i class="zmdi zmdi-comment-text"></i></label>
                    <input type="text" name="item_special_text" id="text" value="<%= item != null ? item.getSpecialText() : "" %>" placeholder="Special Notes" />
                </div>
                <div class="form-group">
                    <label for="unit_price"><i class="zmdi zmdi-balance-wallet"></i></label>
                    <input type="number" name="unit_price" id="unit_price" step="0.01" value="<%= item != null ? item.getUnitPrice() : "" %>" placeholder="Unit Price" />
                </div>
                <div class="form-group form-button">
                    <button type="submit" name="action" value="update" class="form-submit" style="background-color:#2196F3;">Save Changes</button>
                    <button type="submit" name="action" value="delete" class="form-submit" style="background-color:#f44336;">Delete</button>
                </div>
            </form>
        </div>

        <!-- Right Side -->
        <div style="flex: 1; min-width: 300px; text-align: center;">
            <figure>
                <img src="<%=request.getContextPath()%>/images/181340.jpg" alt="item image" style="max-width: 100%; height: auto; border-radius: 10px;" />
            </figure>
            <a href="<%=request.getContextPath()%>/Views/dashboard.jsp" class="signin-image-link" style="display: block; margin-top: 15px; font-weight: bold;">Back to Dashboard</a>
        </div>
    </div>
</div>

<% if (message != null) { %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    swal("Message", "<%= message %>", "<%= "Item found".equals(message) || message.contains("successfully") ? "success" : "info" %>");
</script>
<% } %>
</body>
</html>
