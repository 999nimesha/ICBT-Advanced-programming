<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String successMessage = (String) request.getAttribute("successMessage");
    String errorMessage = (String) request.getAttribute("errorMessage");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Registration form</title>
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
</style>
</head>
<body>

<!-- Hidden inputs to store servlet messages -->
<input type="hidden" id="successMessage" value="<%= (successMessage != null) ? successMessage : "" %>">
<input type="hidden" id="errorMessage" value="<%= (errorMessage != null) ? errorMessage : "" %>">

<section class="signin">
    <div class="container">
        <div class="signin-content">
            <div class="signin-form">
                <h2 class="form-title">Sign up</h2>

                <form action="<%=request.getContextPath()%>/user_register_InsertServlet" method="post" class="register-form" id="register-form">
                    <div class="form-group">
                        <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                        <input type="text" name="user_name" id="name" placeholder="Your Name" value="<%= request.getParameter("user_name") != null ? request.getParameter("user_name") : "" %>" />
                    </div>
                    <div class="form-group">
                        <label for="email"><i class="zmdi zmdi-email"></i></label>
                        <input type="email" name="user_email" id="email" placeholder="Your Email" value="<%= request.getParameter("user_email") != null ? request.getParameter("user_email") : "" %>" />
                    </div>
                    <div class="form-group">
                        <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                        <input type="password" name="user_pass" id="pass" placeholder="Password" />
                    </div>
                    <div class="form-group">
                        <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                        <input type="password" name="user_re_pass" id="re_pass" placeholder="Repeat your password" />
                    </div>
                    <div class="form-group">
                        <label for="contact"><i class="zmdi zmdi-phone"></i></label>
                        <input type="text" name="user_contact" id="contact" placeholder="Contact no" value="<%= request.getParameter("user_contact") != null ? request.getParameter("user_contact") : "" %>" />
                    </div>
                    <div class="form-group">
                        <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" /> 
                        <label for="agree-term" class="label-agree-term">
                            <span><span></span></span>I agree all statements in 
                            <a href="#" class="term-service">Terms of service</a>
                        </label>
                    </div>
                    <div class="form-group form-button">
                        <button type="submit" class="form-submit">Register</button>
                        <button type="reset" class="form-submit" style="background-color: #f44336;">Clear</button>
                    </div>
                </form>
            </div>
            <div class="signup-image">
                <figure>
                    <img src="images/registraion page.png" alt="sign in image">
                </figure>
                <a href="<%=request.getContextPath()%>/Views/index.jsp" class="signin-image-link"><b><center>I am already member</center></b></a>
            </div>
        </div>
    </div>
</section>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    const successMsg = document.getElementById("successMessage").value;
    const errorMsg = document.getElementById("errorMessage").value;

    if (successMsg === "success") {
        swal("Congrats", "Account Created Successfully", "success");
    }
    if (errorMsg && errorMsg.includes("Username already exists")) {
        swal("Error", errorMsg, "error");
    }
    if (errorMsg && errorMsg.includes("error")) {
        swal("Error", errorMsg, "error");
    }
</script>

<script>
    document.getElementById('register-form').addEventListener('submit', function(event) {
        if (!document.getElementById('agree-term').checked) {
            event.preventDefault();
            alert("You must agree to the Terms of Service before registering!");
        }
        // Check Password Match
        const password = document.getElementById('pass').value;
        const repeatPassword = document.getElementById('re_pass').value;

        if (password !== repeatPassword) {
            event.preventDefault();
            swal("Error", "Passwords do not match!", "error");
            document.getElementById('re_pass').focus();
        }
    });
</script>

<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/main.js"></script>

</body>
</html>
