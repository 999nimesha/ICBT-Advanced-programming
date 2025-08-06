<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.insert.model.MCustomerBean" %>
<%
    MCustomerBean customer = (MCustomerBean) request.getAttribute("customer");
    String message = (String) request.getAttribute("message");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Manage</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">

    <style>
        body {
            background-image: url('images/registration_bg.jpg');
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
        }

        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-button {
            display: flex;
            gap: 10px;
        }
    </style>
</head>
<body>

<input type="hidden" id="message" value="<%= message %>">

<section class="signin">
    <div class="container">
        <div class="signin-content">
            <div class="signin-form">
                <h2 class="form-title">Customer Manage</h2>

                <!-- SEARCH FORM -->
                <form action="<%=request.getContextPath()%>/CustomerManageServlet" method="post" class="register-form">
                    <div class="form-group">
                        <label for="search_nic"><i class="zmdi zmdi-search"></i></label>
                        <input type="text" name="search_nic" id="search_nic" placeholder="Enter NIC to Search" required />
                    </div>
                    <div class="form-group form-button">
                        <button type="submit" name="action" value="search" class="form-submit">Search</button>
                    </div>
                </form>

                <!-- UPDATE / DELETE FORM -->
                <form action="<%=request.getContextPath()%>/CustomerManageServlet" method="post" class="register-form">
                    <div class="form-group">
                        <label for="name"><i class="zmdi zmdi-account"></i></label>
                        <input type="text" name="customer_name" id="name" placeholder="Customer Name" value="<%= (customer != null) ? customer.getCus_name() : "" %>" required />
                    </div>

                    <div class="form-group">
                        <label for="nic"><i class="zmdi zmdi-card"></i></label>
                        <input type="text" name="customer_nic" id="nic" placeholder="NIC Number" value="<%= (customer != null) ? customer.getCus_nic() : "" %>" required />
                        <!-- Hidden field to store original NIC -->
                        <input type="hidden" name="original_nic" value="<%= (customer != null) ? customer.getCus_nic() : "" %>" />
                    </div>

                    <div class="form-group">
                        <label for="address"><i class="zmdi zmdi-home"></i></label>
                        <input type="text" name="customer_address" id="address" placeholder="Address" value="<%= (customer != null) ? customer.getCus_address() : "" %>" required />
                    </div>

                    <div class="form-group">
                        <label for="hometown"><i class="zmdi zmdi-pin"></i></label>
                        <input type="text" name="customer_hometown" id="hometown" placeholder="Hometown" value="<%= (customer != null) ? customer.getCus_hometown() : "" %>" required />
                    </div>

                    <div class="form-group">
                        <label for="tele"><i class="zmdi zmdi-phone"></i></label>
                        <input type="text" name="customer_tele" id="tele" placeholder="Telephone Number" value="<%= (customer != null) ? customer.getCus_tele() : "" %>" required />
                    </div>

                    <div class="form-group">
                        <label for="email"><i class="zmdi zmdi-email"></i></label>
                        <input type="email" name="customer_email" id="email" placeholder="Email" value="<%= (customer != null) ? customer.getCus_email() : "" %>" required />
                    </div>

                    <div class="form-group form-button">
                        <button type="submit" name="action" value="update" class="form-submit" >Save Changes</button>
                        <button type="submit" name="action" value="delete" class="form-submit" style="background-color:#f44336;">Delete</button>
                    </div>
                </form>
            </div>

            <div class="signup-image">
                <figure>
                    <img src="images/181340.jpg" alt="sign in image">
                </figure>
                <a href="<%=request.getContextPath()%>/Views/dashboard.jsp" class="signin-image-link"><b><center>Back to DashBoard</center></b></a>
            </div>
        </div>
    </div>
</section>

<!-- SweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
    var message = document.getElementById("message").value;
    if (message === "success") {
        swal("Success", "Operation completed successfully!", "success");
    } else if (message === "error") {
        swal("Error", "Operation failed!", "error");
    } else if (message === "notfound") {
        swal("Not Found", "Customer NIC not found!", "warning");
    }
</script>

<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/main.js"></script>
</body>
</html>
