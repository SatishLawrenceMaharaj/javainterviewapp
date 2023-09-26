<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Satish Maharaj Interview</title>
<!-- Add Materialize CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<style>
	* {
  		font-family: "Times New Roman", Times, serif;
	}
    body {
        background-color: #f2f2f2;
        background-image: url("https://c4.wallpaperflare.com/wallpaper/351/711/650/light-wallpaper-preview.jpg");
        -webkit-background-size: cover;
		-moz-background-size: cover;
		-o-background-size: cover;
		background-size: cover;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100vh;
        border: 3px solid black;
    }
    form {
        display: flex;
        flex-direction: column;
        gap: 16px;
        padding: 16px;
        min-width: 500px;
        border: 1px solid #ccc;
        background-color: white;
        border-radius: 8px;
    }
    #formCon {
        display: flex;
        flex-direction: row;
        gap: 32px;
    }
</style>
</head>
<body>
<h1 class="center-align">SATISH MAHARAJ SOFTWARE DEVELOPER INTERVIEW</h1>
<div id="formCon" class="center-align" class="col s12">
    <form method="post" action="Login" class="col s6">
        <h2>Login</h2>
        <div class="input-field">
            <input type="email" name="email" id="login-email" class="validate" placeholder="Enter Your Email" required>
            <label for="login-email">Email</label>
        </div>
        <div class="input-field">
            <input type="password" name="password" id="login-password" class="validate" placeholder="Enter Your Password" required>
            <label for="login-password">Password</label>
        </div>
        <button type="submit" class="btn waves-effect waves-light">Login</button>
    </form>

    <form method="post" action="Register" class="col s6">
        <h2>Register</h2>
        <div class="input-field">
            <input type="text" name="fname" id="register-fname" class="validate" placeholder="Enter Your First Name" required>
            <label for="register-fname">First Name</label>
        </div>
        <div class="input-field">
            <input type="text" name="lname" id="register-lname" class="validate" placeholder="Enter Your Last Name" required>
            <label for="register-lname">Last Name</label>
        </div>
        <div class="input-field">
            <input type="email" name="email" id="register-email" class="validate" placeholder="Enter Your Email" required>
            <label for="register-email">Email</label>
        </div>
        <div class="input-field">
            <input type="password" name="password" id="register-password" class="validate" placeholder="Enter Your Password" required>
            <label for="register-password">Password</label>
        </div>
        <button type="submit" class="btn waves-effect waves-light">Register</button>
    </form>
</div>

<!-- Add Materialize JavaScript (jQuery is required) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>
