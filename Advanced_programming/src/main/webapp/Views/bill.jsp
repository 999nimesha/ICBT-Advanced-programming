<%@ page import="java.sql.*,java.util.*,com.insert.dao.BillingDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Billing Form</title>
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
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .main {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 15px;
            margin-top: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.2);
        }

        .container {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .signin-content {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 50px;
        }

        .signin-form {
            width: 350px;
        }

        .signup-image {
            width: 350px;
            text-align: center;
        }

        .signup-image img {
            max-width: 100%;
            border-radius: 10px;
        }

        .form-group {
            margin-bottom: 10px;
        }

        input, select {
            width: 100%;
            padding: 10px;
            border-radius: 7px;
            border: 1px solid #ccc;
        }

        .form-title {
            text-align: center;
            margin-bottom: 20px;
            font-weight: 600;
            font-size: 27px;
        }

        .form-submit {
            background-color: #2979ff;
            color: white;
            border: none;
            cursor: pointer;
            padding: 12px 25px;
            font-size: 18px;
            border-radius: 8px;
            width: 60%;
        }

        .form-submit:hover {
            background-color: #1565c0;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<div class="main">
    <section class="signin">
        <div class="container">
            <div class="signin-content">

                <!-- Left: Billing Form -->
                <div class="signin-form">
                    <h2 class="form-title">Billing - Add to Cart</h2>
                    <form action="<%=request.getContextPath()%>/CartServlet" method="post" id="billingForm">

                        <div class="form-group">
                            <label for="cus_name"><i class="zmdi zmdi-account"></i></label>
                            <select name="cus_name" id="cus_name" required>
                                <option value="">-- Select Customer --</option>
                                <%
                                    BillingDao dao = new BillingDao();
                                    Map<String, String> customerMap = new LinkedHashMap<>();
                                    try (ResultSet rs = dao.getAllCustomers()) {
                                        while (rs.next()) {
                                            String name = rs.getString("cus_name");
                                            String nic = rs.getString("cus_nic");
                                            customerMap.put(name, nic);
                                            out.print("<option value='" + name + "'>" + name + "</option>");
                                        }
                                    } catch (Exception e) { e.printStackTrace(); }
                                %>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="cus_nic"><i class="zmdi zmdi-card"></i></label>
                            <input type="text" id="cus_nic" name="cus_nic" placeholder="Customer NIC" readonly />
                        </div>

                        <div class="form-group">
                            <label for="item_code"><i class="zmdi zmdi-label"></i></label>
                            <select name="item_code" id="item_code" required>
                                <option value="">-- Select Item Code --</option>
                                <%
                                    Map<String, Map<String, String>> itemMap = new LinkedHashMap<>();
                                    try (ResultSet rs = dao.getAllItems()) {
                                        while (rs.next()) {
                                            String code = rs.getString("item_code");
                                            String name = rs.getString("item_name");
                                            String unitPrice = rs.getString("unit_price");
                                            String stock = rs.getString("i_quantity");
                                            Map<String, String> itemData = new HashMap<>();
                                            itemData.put("name", name);
                                            itemData.put("unitPrice", unitPrice);
                                            itemData.put("stock", stock);
                                            itemMap.put(code, itemData);
                                            out.print("<option value='" + code + "'>" + code + "</option>");
                                        }
                                    } catch (Exception e) { e.printStackTrace(); }
                                %>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="item_name"><i class="zmdi zmdi-shopping-cart"></i></label>
                            <input type="text" name="item_name" id="item_name" placeholder="Item Name" readonly />
                        </div>

                        <div class="form-group">
                            <label for="unit_price"><i class="zmdi zmdi-money"></i></label>
                            <input type="number" step="0.01" name="unit_price" id="unit_price" placeholder="Unit Price" readonly />
                        </div>

                        <div class="form-group">
                            <label for="quantity"><i class="zmdi zmdi-format-list-numbered"></i></label>
                            <input type="number" name="quantity" id="quantity" min="1" value="1" required />
                        </div>

                        <div class="form-group">
                            <label for="total"><i class="zmdi zmdi-money-box"></i></label>
                            <input type="number" step="0.01" id="total" placeholder="Total" readonly />
                        </div>

                        <div class="button-group">
                            <button type="submit" class="form-submit">Add to Cart</button>
                            <button type="reset" class="form-submit" style="background-color: #f44336;">Clear</button>
                        </div>

                        <div style="margin-top: 15px; text-align: center;">
                            <a href="<%=request.getContextPath()%>/Views/cart.jsp" style="color: #2979ff; font-weight: bold;">View Cart</a>
                        </div>
                    </form>
                </div>

                <!-- Right: Image + Back Link -->
                <div class="signup-image">
                    <figure>
                        <img src="<%=request.getContextPath()%>/images/cute-girl-holding-books-2GTPW70.jpg" alt="billing image">
                    
                    <a href="<%=request.getContextPath()%>/Views/dashboard.jsp" class="signin-image-link"><b>Back to Dashboard</b></a>
                </div>
</figure>
            </div>
        </div>
    </section>
</div>

<script>
    // Store customer nic map and item details map from JSP variables
    var customerData = {
        <% for (Map.Entry<String,String> entry : customerMap.entrySet()) { %>
            "<%=entry.getKey()%>": "<%=entry.getValue()%>",
        <% } %>
    };

    var itemData = {
        <% for (Map.Entry<String, Map<String,String>> entry : itemMap.entrySet()) {
            Map<String,String> data = entry.getValue();
        %>
        "<%=entry.getKey()%>": {
            name: "<%=data.get("name")%>",
            unitPrice: "<%=data.get("unitPrice")%>",
            stock: "<%=data.get("stock")%>"
        },
        <% } %>
    };

    // When customer name changes, autofill NIC
    document.getElementById("cus_name").addEventListener("change", function() {
        var nicField = document.getElementById("cus_nic");
        var selectedName = this.value;
        nicField.value = customerData[selectedName] || "";
    });

    // When item code changes, autofill name and unit price
    document.getElementById("item_code").addEventListener("change", function() {
        var selectedCode = this.value;
        var nameField = document.getElementById("item_name");
        var priceField = document.getElementById("unit_price");
        var quantityField = document.getElementById("quantity");
        var totalField = document.getElementById("total");

        if (itemData[selectedCode]) {
            nameField.value = itemData[selectedCode].name;
            priceField.value = itemData[selectedCode].unitPrice;
            quantityField.value = 1;
            totalField.value = (1 * parseFloat(itemData[selectedCode].unitPrice)).toFixed(2);
            quantityField.max = itemData[selectedCode].stock;
        } else {
            nameField.value = "";
            priceField.value = "";
            totalField.value = "";
            quantityField.value = 1;
            quantityField.removeAttribute('max');
        }
    });

    // When quantity changes, update total
    document.getElementById("quantity").addEventListener("input", function() {
        var qty = parseInt(this.value);
        var price = parseFloat(document.getElementById("unit_price").value);
        var totalField = document.getElementById("total");
        var maxStock = parseInt(this.max);

        if (qty > maxStock) {
            alert("Quantity exceeds available stock!");
            this.value = maxStock;
            qty = maxStock;
        } else if (qty < 1) {
            this.value = 1;
            qty = 1;
        }

        if (!isNaN(qty) && !isNaN(price)) {
            totalField.value = (qty * price).toFixed(2);
        } else {
            totalField.value = "";
        }
    });
</script>

</body>
</html>
