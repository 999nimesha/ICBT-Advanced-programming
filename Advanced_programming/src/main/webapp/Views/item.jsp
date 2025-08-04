<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Item Registration Form</title>
    <link rel="stylesheet" href="../fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="../css/style.css">
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

<%
    String msg = request.getParameter("message");
    if (msg == null) {
        msg = "";
    }
%>
<input type="hidden" id="message" value="<%= msg %>">

<section class="signin">
    <div class="container">
        <div class="signin-content">
            <div class="signin-form">
                <h2 class="form-title">Add Item</h2>

                <form action="<%=request.getContextPath()%>/item_register_InsertServlet"
                      method="post"
                      class="register-form" id="register-form">

                    <div class="form-group">
                        <label for="code"><i class="zmdi zmdi-label"></i></label>
                        <input type="text" name="item_code" id="code" placeholder="Item Code" required />
                    </div>

                    <div class="form-group">
                        <label for="name"><i class="zmdi zmdi-shopping-cart"></i></label>
                        <input type="text" name="item_name" id="name" placeholder="Item Name" required />
                    </div>

                    <div class="form-group">
                        <label for="quantity"><i class="zmdi zmdi-format-list-numbered"></i></label>
                        <input type="number" name="i_quantity" id="quantity" placeholder="Quantity" required />
                    </div>

                    <div class="form-group">
                        <label for="price"><i class="zmdi zmdi-money"></i></label>
                        <input type="number" step="0.01" name="item_price" id="price" placeholder="Price" required />
                    </div>

                    <div class="form-group">
                        <label for="specialText"><i class="zmdi zmdi-comment-text"></i></label>
                        <input type="text" name="item_special_text" id="specialText" placeholder="Special Notes" />
                    </div>

                    <div class="form-group">
                        <label for="unit_price"><i class="zmdi zmdi-balance-wallet"></i></label>
                        <input type="number" step="0.01" name="unit_price" id="unit_price" placeholder="Unit Price" required />
                    </div>

                    <div class="form-group form-button">
                        <button type="submit" name="add_item" id="add_item" class="form-submit">Add Item</button>
                        <button type="reset" class="form-submit" style="background-color: #f44336;">Clear</button>
                    </div>
                </form>
            </div>

            <div class="signup-image">
                <figure>
                    <img src="../images/items.jpg" alt="item form image">
                </figure>
                <a href="<%=request.getContextPath()%>/Views/dashboard.jsp" class="signin-image-link"><b><center>Back to Dashboard</center></b></a>
            </div>
        </div>
    </div>
</section>

<!-- SweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    let msg = document.getElementById("message").value;
    if (msg === "success") {
        swal("Success", "Item added successfully!", "success")
        .then(() => {
            document.getElementById("register-form").reset(); // Reset form after alert
        });
    } else if (msg === "fail") {
        swal("Error", "Item not added. Try again.", "error");
    }
</script>

</body>
</html>
