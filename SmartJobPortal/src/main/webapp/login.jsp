<!DOCTYPE html>
<html>
<head>
<title>Login</title>

<style>
body {
    font-family: Arial;
    background: linear-gradient(to right, #43e97b, #38f9d7);
}

.container {
    width: 350px;
    margin: 100px auto;
    padding: 30px;
    background: white;
    border-radius: 10px;
    text-align: center;
}

input {
    width: 90%;
    padding: 10px;
    margin: 10px 0;
    border-radius: 5px;
}

button {
    width: 95%;
    padding: 10px;
    background: #43e97b;
    color: white;
    border: none;
    border-radius: 5px;
}

.message {
    color: red;
    font-weight: bold;
}
</style>

</head>

<body>

<div class="container">

    <h2>Login</h2>

    <% 
    String msg = request.getParameter("msg");
    if ("loginRequired".equals(msg)) {
    %>
        <p class="message"> Please login first to continue</p>
    <% } %>

    <form action="LoginServlet" method="post">
        <input type="email" name="email" placeholder="Enter Email" required>
        <input type="password" name="password" placeholder="Enter Password" required>

        <button type="submit">Login</button>
    </form>

    <a href="register.jsp">New user? Register here</a>

</div>

</body>
</html>