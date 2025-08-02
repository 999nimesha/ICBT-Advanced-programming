<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Pahana Edu BookShop</title>
    
    <!-- Font Icon -->
    <link rel="stylesheet"
	href="<%=request.getContextPath()%>/fonts/material-icon/css/material-design-iconic-font.min.css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            background-image: url('images/dashboard_bg.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            min-height: 100vh;
        }

        .sidebar {
            height: 100vh;
            background-color: rgba(0, 51, 102, 0.9);
            color: white;
            padding-top: 20px;
        }

        .sidebar a {
            color: white;
            padding: 10px;
            display: block;
            text-decoration: none;
            transition: background 0.3s;
        }

        .sidebar a:hover {
            background-color: #004080;
        }

        .topbar {
            background-color: rgba(0, 51, 102, 0.9);
            color: white;
            padding: 10px 20px;
        }

        .content {
            padding: 20px;
            color: white;
        }

        .logo-img {
            height: 100px;
        }

        .logout-btn {
            color: red;
            text-decoration: none;
            font-size: 20px;
        }

        .logout-btn:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="container-fluid">
        <div class="row">

            <!-- Sidebar -->
            <div class="col-md-2 sidebar">
                <h5 class="text-center mb-4"><i class="bi bi-journal-bookmark-fill"></i> Pahana Edu Menu</h5>
                <a href="<%=request.getContextPath()%>/Views/index.jsp"><i class="bi bi-box-arrow-in-left"></i> Back to Login</a>
                
                <a href="registration.jsp"><i class="bi bi-person-plus-fill"></i>  User Registration</a>
                <a href="customer.jsp"><i class="bi bi-person-bounding-box"></i> Add Customer</a>
                <a href="item.jsp"><i class="bi bi-box-seam"></i> Add Item</a>
                <a href="bill.jsp"><i class="bi bi-receipt"></i> Billing</a>
                <a href="help.jsp"><i class="bi bi-question-circle-fill"></i> Help</a>
            </div>

            <!-- Main Content -->
            <div class="col-md-10">

                <!-- Top Bar -->
                <div class="d-flex justify-content-between align-items-center topbar">
                
                    <!-- Logo -->
                    <img src="images/Pahana_Edu_Bookshop_Logo.jpg" alt="Pahana Edu BookShop Logo" class="logo-img">
<div>
    <p style="margin: 0;"><i class="bi bi-clock-fill"></i> 
        <%= new java.text.SimpleDateFormat("dd-MM-yyyy HH:mm:ss").format(new java.util.Date()) %>
    </p>
</div>

                    <!-- Logout Button -->
                    <a href="logout.jsp" class="logout-btn"><i class="bi bi-box-arrow-right"></i> Logout</a>
                    
                </div>

                <!-- Dashboard Buttons -->
                <div class="content">
                    <h2 class="mb-4"><i class="bi bi-speedometer2"></i> Dashboard</h2>

                    <div class="row g-4">

                        <div class="col-md-4">
                            <a href="user_manage.jsp" class="btn btn-primary d-flex justify-content-center align-items-center" style="height: 80px; width: 200px;">
                                <i class="bi bi-person-gear"></i> Manage Users
                            </a>
                        </div>

                        <div class="col-md-4">
                            <a href="item_manage.jsp" class="btn btn-primary d-flex justify-content-center align-items-center" style="height: 80px; width: 200px;">
                                <i class="bi bi-tools"></i> Manage Items
                            </a>
                        </div>
                        
                         <div class="col-md-4">
                            <a href="customer_manage.jsp" class="btn btn-primary d-flex justify-content-center align-items-center" style="height: 80px; width: 200px;">
                                <i class="bi bi-person-lines-fill"></i> Manage Customers
                            </a>
                        </div>

                        <div class="col-md-4">
                            <a href="show_user.jsp" class="btn btn-primary d-flex justify-content-center align-items-center" style="height: 80px; width: 200px;">
                                <i class="bi bi-people-fill"></i> Show Users
                            </a>
                        </div>

                        <div class="col-md-4">
                            <a href="item_show.jsp" class="btn btn-primary d-flex justify-content-center align-items-center" style="height: 80px; width: 200px;">
                                <i class="bi bi-card-list"></i> Show Items
                            </a>
                        </div>

                       <div class="col-md-4">
                            <a href="customer_show.jsp" class="btn btn-primary d-flex justify-content-center align-items-center" style="height: 80px; width: 200px;">
                                <i class="bi bi-card-list"></i> Show Customers
                            </a>
                        </div>




                        <div class="col-md-4">
                            <a href="bill.jsp" class="btn btn-success d-flex justify-content-center align-items-center" style="height: 80px; width: 200px;">
                                <i class="bi bi-calculator-fill"></i> Generate Bill
                            </a>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
