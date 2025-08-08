<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.insert.model.ShowUserBean" %>

<%
    // Check if userList attribute is missing (means first direct load)
    if (request.getAttribute("userList") == null) {
%>
    <jsp:forward page="/ShowUserServlet" />

<%
        return;
    }

    List<ShowUserBean> userList = (List<ShowUserBean>) request.getAttribute("userList");
    String message = (String) request.getAttribute("message");
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Users</title>
    <!-- Font Icon -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
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

        .back-button {
            padding: 8px 14px;
            background-color: #6c757d;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-size: 14px;
        }
    </style>
</head>
<body>

<div style="width: 90%; margin: 20px auto; background-color: #e6f2ff; padding: 15px; border: 1px solid #b3d1ff; border-radius: 8px; text-align: center;">
    <h2 style="color: blue; margin: 0;">All Registered Users</h2>
</div>


<div class="top-bar">
    <form class="search-form" action="<%=request.getContextPath()%>/ShowUserServlet" method="get">
        <input type="text" name="search" placeholder="Search by name..."class="zmdi zmdi-search" />
        <button type="submit">Search</button>
    </form>

    <a href="dashboard.jsp" class="form-submit"><b>Back to Dashboard</b></a>
</div>
 
<% if (message != null) { %>
    <div class="alert"><%= message %></div>
<% } %>

<table>
    <tr>
        
        <th>User Name</th>
        <th>Email</th>
        <th>Password</th>
        <th>Contact</th>
        <th>Actions</th>
    </tr>

    <%
        if (userList != null && !userList.isEmpty()) {
            for (ShowUserBean user : userList) {
    %>
    <tr>
        <td><%= user.getUser_name() %></td>
        <td><%= user.getUser_email() %></td>
        <td><%= user.getUser_pass() %></td>
        <td><%= user.getUser_contact() %></td>
        <td>
            <a class="button" href="user_manage.jsp?id=<%=user.getUser_name()%>">Update</a>
          <a class="button delete-button"
   href="<%=request.getContextPath()%>/ShowUserServlet?delete=<%=user.getUser_name()%>"
   onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>



        </td>
    </tr>
    <%
            }
        } else {
    %>
        <tr><td colspan="6" style="text-align:center;">No users found.</td></tr>
    <%
        }
    %>
</table>
</form>
</body>
</html>
