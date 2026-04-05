<!DOCTYPE html>
<html>
<head>
<title>Post Job</title>

<style>
body {
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(135deg, #667eea, #764ba2, #ff758c);
    height: 100vh;
    margin: 0;
}

/* MAIN BOX */
.container {
    width: 400px;
    margin: 80px auto;
    padding: 30px;
    background: white;
    border-radius: 15px;
    text-align: center;
    box-shadow: 0 8px 20px rgba(0,0,0,0.3);

    /* 🔥 Animation Applied Here */
    animation: fadeIn 1s ease-in-out;
}

/* ANIMATION KEYFRAMES */
@keyframes fadeIn {
    from { 
        opacity: 0; 
        transform: translateY(30px); 
    }
    to { 
        opacity: 1; 
        transform: translateY(0); 
    }
}

h2 {
    margin-bottom: 20px;
    color: #333;
}

input, textarea {
    width: 90%;
    padding: 10px;
    margin: 10px 0;
    border-radius: 8px;
    border: 1px solid #ccc;
    font-size: 14px;
}

textarea {
    resize: none;
}

button {
    width: 95%;
    padding: 12px;
    background: linear-gradient(to right, #ff758c, #ff7eb3);
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    cursor: pointer;
    transition: 0.3s;
}

/* HOVER EFFECT */
button:hover {
    background: linear-gradient(to right, #667eea, #764ba2);
    transform: scale(1.05);
}

a {
    display: block;
    margin-top: 15px;
    color: #555;
    text-decoration: none;
    font-size: 14px;
}
</style>

</head>

<body>

<div class="container">
    <h2>Post a New Job</h2>

    <form action="JobServlet" method="post">
        <input type="text" name="title" placeholder="Enter Job Title" required>

        <textarea name="description" rows="4" placeholder="Enter Job Description" required></textarea>

        <button type="submit">Post Job</button>
    </form>

    <a href="home.jsp">Back to Home</a>
</div>

</body>
</html>