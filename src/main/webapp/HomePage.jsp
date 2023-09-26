<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home | Satish Maharaj Interview</title>
<!-- Add Materialize CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
</head>
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
        min-width: 300px;
        border: 1px solid #ccc;
        background-color: white;
        border-radius: 8px;
    }
</style>
<body>
<h1 class="center-align">Welcome Home, <%= request.getAttribute("name") %></h1>

<h4 class="center-align">Give me 2 numbers to find the summation of.</h4>
<div class="center-align">
    <form method="get" action="add" class="col s12">
        <input type="hidden" name="name" value="<%= request.getAttribute("name") %>"/>
        <div class="input-field">
            <input type="text" placeholder="Number 1" name="n1" id="number1" class="validate">
            <label for="number1">Number 1</label>
        </div>
        <div class="input-field">
            <input type="text" placeholder="Number 2" name="n2" id="number2" class="validate">
            <label for="number2">Number 2</label>
        </div>
        <button type="submit" class="btn waves-effect waves-light">ADD</button>
    </form>
</div>

<% Object summation = request.getAttribute("sum"); %>
<% if (summation != null) { %>
    <h3 class="center-align">Summation of the 2 numbers is: <%= summation %></h3>
<% } %>

<!-- Add Materialize JavaScript (jQuery is required) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>
