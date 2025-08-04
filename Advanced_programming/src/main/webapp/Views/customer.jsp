<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Customer Registration</title>

<!-- Font Icon -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/material-icon/css/material-design-iconic-font.min.css">
<!-- Main CSS -->
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
    
    
</style>
</head>

<body>

<input type="hidden" id="message" value="<%= request.getAttribute("message") %>">

<section class="signin">
    <div class="container">
        <div class="signin-content">
            <div class="signin-form">
                <h2 class="form-title">Customer Registration</h2>

                <form action="<%=request.getContextPath()%>/Customer_register_InsertServlet" method="post" class="register-form" id="register-form">
                    
                    <div class="form-group">
                        <label for="name"><i class="zmdi zmdi-account"></i></label>
                        <input type="text" name="customer_name" id="name" placeholder="Customer Name" required />
                    </div>

                    <div class="form-group">
                        <label for="nic"><i class="zmdi zmdi-card"></i></label>
                        <input type="text" name="customer_nic" id="nic" placeholder="NIC Number" required />
                    </div>

                    <div class="form-group">
                        <label for="address"><i class="zmdi zmdi-home"></i></label>
                        <input type="text" name="customer_address" id="address" placeholder="Address" required />
                    </div>

                    <div class="form-group">
                        <label for="hometown"><i class="zmdi zmdi-pin"></i></label>
                        <input type="text" name="customer_hometown" id="hometown" placeholder="Hometown" required />
                    </div>

                    <div class="form-group">
                        <label for="tele"><i class="zmdi zmdi-phone"></i></label>
                        <input type="text" name="customer_tele" id="tele" placeholder="Telephone Number" required />
                    </div>

                    <div class="form-group">
                        <label for="email"><i class="zmdi zmdi-email"></i></label>
                        <input type="email" name="customer_email" id="email" placeholder="Email" required />
                    </div>

                    <div class="form-group form-button">
                        <button type="submit" name="signup" id="signup" class="form-submit">Register</button>
                        <button type="reset" class="form-submit" style="background-color: #f44336;">Clear</button>
                    </div>
                </form>
            </div>

            <div class="signup-image">
                <figure>
                    <img src="images/customer_reg.png" alt="sign in image">
                </figure>
                <a href="<%=request.getContextPath()%>/Views/dashboard.jsp" class="signin-image-link"><b><center>Back to DashBoard</center></b></a>
            </div>
        </div>
    </div>
</section>

<!-- SweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/alert/dist/sweetalert.css">

<script type="text/javascript">
    var message = document.getElementById("message").value;
    if (message === "success") {
        swal("Success", "Customer Registered Successfully", "success");
    } else if (message === "error") {
        swal("Error", "Registration Failed", "error");
    }
</script>

<!-- JS -->
<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/main.js"></script>

</body>
</html>
