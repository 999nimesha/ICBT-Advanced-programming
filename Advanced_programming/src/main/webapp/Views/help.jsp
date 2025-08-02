<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Help - Pahana Edu BookShop</title>

    <!-- Font Icon -->
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

        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .main {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.2);
            width: 1000px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #0d47a1;
        }

        .tabs {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .tab-button {
            flex: 1;
            padding: 10px;
            background-color: #0d47a1;
            color: white;
            border: none;
            border-radius: 8px 8px 0 0;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
            margin-right: 2px;
        }

        .tab-button:last-child {
            margin-right: 0;
        }

        .tab-button:hover, .tab-button.active {
            background-color: #1565c0;
        }

        .tab-content {
            display: none;
            padding: 20px;
            background-color: white;
            border: 2px solid #0d47a1;
            border-top: none;
            border-radius: 0 0 15px 15px;
            color: #333;
            font-size: 15px;
            line-height: 1.7;
        }

        .tab-content.active {
            display: block;
        }

        .back-link {
            text-align: center;
            margin-top: 30px;
        }

        .back-link a {
            text-decoration: none;
            color: #ffffff;
            background-color: #0d47a1;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: bold;
        }

        .back-link a:hover {
            background-color: #1565c0;
        }

        ul {
            padding-left: 20px;
        }
    </style>
</head>
<body>

<div class="main">
    <h2>📘 Help - Pahana Edu BookShop</h2>

    <div class="tabs">
        <button class="tab-button active" onclick="openTab(event, 'login')">🔐 Login</button>
        <button class="tab-button" onclick="openTab(event, 'users')">👤 Users</button>
        <button class="tab-button" onclick="openTab(event, 'items')">📦 Items</button>
        <button class="tab-button" onclick="openTab(event, 'customers')">👥 Customers</button>
        <button class="tab-button" onclick="openTab(event, 'billing')">💵 Billing</button>
        <button class="tab-button" onclick="openTab(event, 'tips')">💡 Tips</button>
    </div>

    <div id="login" class="tab-content active">
        <p>Use your <strong>Admin Username</strong> and <strong>Password</strong> to access the dashboard securely.</p>
    </div>

    <div id="users" class="tab-content">
        <p><strong>Add User:</strong> Go to <em>Add User</em> in the sidebar and fill required details.<br>
           <strong>Manage User:</strong> Search users, and update or delete their records.</p>
    </div>

    <div id="items" class="tab-content">
        <p><strong>Add Item:</strong> Add books with name, category, price, quantity, and image.<br>
           <strong>Manage Items:</strong> Search, update, or delete items. Item images are also displayed.</p>
    </div>

    <div id="customers" class="tab-content">
        <p><strong>Add Customer:</strong> Use NIC, name, contact number, address, etc.<br>
           <strong>Manage Customer:</strong> Search by NIC to update or delete customer details.</p>
    </div>

    <div id="billing" class="tab-content">
        <p><strong>Calculate Bill:</strong> Select items and quantities. Total auto-calculates.<br>
           <strong>Print Bill:</strong> Generate and print invoice.<br>
           <strong>Send Email:</strong> Email the bill to the customer's registered email.</p>
    </div>

    <div id="tips" class="tab-content">
        <ul>
            <li>Double-check item and customer details before billing.</li>
            <li>Logout after completing your session.</li>
            <li>Ensure customer email is valid to receive bills.</li>
        </ul>
        <p>Need help? Contact support at <strong>support@pahanaedubookshop.lk</strong></p>
    </div>

    <div class="back-link">
        <a href="<%=request.getContextPath()%>/Views/dashboard.jsp">Back to Dashboard</a>
    </div>
</div>

<script>
    function openTab(evt, tabName) {
        const tabContents = document.querySelectorAll('.tab-content');
        const tabButtons = document.querySelectorAll('.tab-button');

        tabContents.forEach(tab => tab.classList.remove('active'));
        tabButtons.forEach(btn => btn.classList.remove('active'));

        document.getElementById(tabName).classList.add('active');
        evt.currentTarget.classList.add('active');
    }
</script>

<!-- JS -->
<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/main.js"></script>

</body>
</html>
