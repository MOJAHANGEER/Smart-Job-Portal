<!DOCTYPE html>
<html>
<head>
<title>Register</title>

<style>
body {
    font-family: Arial;
    background: linear-gradient(to right, #4facfe, #00f2fe);
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
    background: #4facfe;
    color: white;
    border: none;
    border-radius: 5px;
}

a {
    display: block;
    margin-top: 10px;
}
</style>

</head>

<body>

<div class="container">
    <h2>Create Account</h2>

    <form action="RegisterServlet" method="post">
        <input type="text" name="name" placeholder="Enter Name" required>
        <input type="email" name="email" placeholder="Enter Email" required>
        <input type="password" name="password" placeholder="Enter Password" required>

        <button type="submit">Register</button>
    </form>

    <a href="login.jsp">Already have account? Login</a>
</div>

</body>
</html>