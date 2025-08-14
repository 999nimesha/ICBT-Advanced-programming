<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Log in Pahana Edu BookShop</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">

<!-- ADDED: Inline CSS for background image and main box styling -->
<style>
    body {
        background-image: url('images/bookshop_bg.jpg'); 
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
    /* Centering the login form */
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

	

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="images/Pahana_Edu_Bookshop_Logo.jpg" alt="sing in image">
						</figure>
						Don't you have an account yet?<a href="<%=request.getContextPath()%>/Views/registration.jsp" class="signin-image-link"><B>Create an
							account</B></a>
					</div>

					<div class="signin-form">
						<h2 class="form-title">Sign in</h2>
						<form method="post" action="<%=request.getContextPath()%>/LoginServlet" class="register-form"
							id="login-form">
							<div class="form-group">
								<label for="username"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="user_name" id="username"
									placeholder="Your Name" />
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="user_pass" id="password"
									placeholder="Password" />
							</div>
							<div class="form-group">
								<input type="checkbox" name="remember-me" id="remember-me"
									class="agree-term" /> <label for="remember-me"
									class="label-agree-term"><span><span></span></span>Remember
									me</label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>
						</form>
						<% if (request.getParameter("error") != null) { %>
        <p style="color:red;">Invalid Username or Password!</p>
    <% } %>
					</div>
				</div>
			</div>
		</section>

	<script>
    const loginForm = document.getElementById('login-form');
    const rememberCheckbox = document.getElementById('remember-me');

    loginForm.addEventListener('submit', function(event) {
        if (!rememberCheckbox.checked) {
            event.preventDefault(); // Stop form submission
            alert("You must tick the 'Remember me' checkbox before logging in!");
        }
    });
</script>
	

	<!-- JS -->
	<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/main.js"></script>
</body>

</html>
