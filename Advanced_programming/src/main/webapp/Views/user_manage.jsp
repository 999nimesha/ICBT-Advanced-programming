<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.insert.model.MUserBean" %>
<%
    MUserBean user = (MUserBean) request.getAttribute("user");
    String message = (String) request.getAttribute("message");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>User Manage Form</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
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

<input type="hidden" id="message" value="<%= message %>">

<!-- User Manage Form -->
<section class="signin">
    <div class="container">
        <div class="signin-content">
            <div class="signin-form">
                <h2 class="form-title">Manage User</h2>

                <!-- Search Form -->
                <form action="<%=request.getContextPath()%>/UserManageServlet" method="post" class="register-form">
                    <div class="form-group">
                        <label for="searchName"><i class="zmdi zmdi-search"></i></label>
                        <input type="text" name="search_name" id="searchName" placeholder="Enter Name to Search" required />
                    </div>
                    <div class="form-group form-button">
                        <button type="submit" name="action" value="search" class="form-submit">Search</button>
                    </div>
                </form>

                <hr>

                <!-- Update/Delete Form -->
                <form action="<%=request.getContextPath()%>/UserManageServlet" method="post" class="register-form">
                    <div class="form-group">
                    <input type="hidden" name="original_name" value="<%= request.getAttribute("originalName") != null ? request.getAttribute("originalName") : (user != null ? user.getUserName() : "") %>" />
                    
                        <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                        <input type="text" name="user_name" id="name" placeholder="Your Name" value="<%= user != null ? user.getUserName() : "" %>" required />
                    </div>
                    <div class="form-group">
                        <label for="email"><i class="zmdi zmdi-email"></i></label>
                        <input type="email" name="user_email" id="email" placeholder="Your Email" value="<%= user != null ? user.getUserEmail() : "" %>" />
                    </div>
                    <div class="form-group">
                        <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                        <input type="password" name="user_pass" id="pass" placeholder="Password" value="<%= user != null ? user.getUserPass() : "" %>" />
                    </div>
                    <div class="form-group">
                        <label for="contact"><i class="zmdi zmdi-phone"></i></label>
                        <input type="text" name="user_contact" id="contact" placeholder="Contact no" value="<%= user != null ? user.getUserContact() : "" %>" />
                    </div>
                    <div class="form-group form-button">
                        <button type="submit" name="action" value="update" class="form-submit">Save Changes</button>
                        <button type="submit" name="action" value="delete" class="form-submit" style="background-color: #f44336;">Delete</button>
                    </div>
                </form>
            </div>
            <div class="signup-image">
                <figure>
                    <img src="images/manage_cus.jpg" alt="manage user image">
                </figure>
                <a href="<%=request.getContextPath()%>/Views/dashboard.jsp" class="signin-image-link"><b><center>Back to DashBoard</center></b></a>
            </div>
        </div>
    </div>
</section>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    var message = document.getElementById("message").value;
    if (message == "updated") {
        swal("Success", "User details updated successfully!", "success");
    } else if (message == "deleted") {
        swal("Deleted", "User deleted successfully!", "warning");
    } else if (message == "notfound") {
        swal("Not Found", "User not found!", "error");
    }
</script>

<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/main.js"></script>

</body>
</html>
