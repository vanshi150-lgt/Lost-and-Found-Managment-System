
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Submission Successful | Lost & Found</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f4f7fb;
            color: #263445;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        header {
            background: #173b67;
            color: white;
            padding: 20px 7%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
        }

        nav a:hover {
            color: #ffd166;
        }

        .main {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 15px;
        }

        .success-box {
            background: white;
            max-width: 550px;
            width: 100%;
            text-align: center;
            padding: 45px 30px;
            border-radius: 12px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.08);
        }

        .check {
            width: 75px;
            height: 75px;
            background: #e1f5e8;
            color: #21834b;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 42px;
            margin: 0 auto 25px;
        }

        h1 {
            color: #173b67;
            margin-bottom: 15px;
        }

        .message {
            color: #657487;
            line-height: 1.7;
            margin-bottom: 25px;
        }

        .buttons a {
            display: inline-block;
            background: #173b67;
            color: white;
            padding: 13px 22px;
            margin: 7px;
            border-radius: 6px;
            text-decoration: none;
        }

        .buttons a:hover {
            background: #2875a8;
        }

        footer {
            background: #173b67;
            color: white;
            text-align: center;
            padding: 20px;
        }

        @media(max-width: 650px) {
            header {
                justify-content: center;
            }

            nav a {
                margin: 7px;
                display: inline-block;
            }
        }
    </style>
</head>

<body>

<header>

    <div class="logo">Lost & Found</div>

    <nav>
        <a href="index.jsp">Home</a>
        <a href="lostItems.jsp">Lost Items</a>
        <a href="foundItems.jsp">Found Items</a>
        <a href="search.jsp">Search</a>
    </nav>

</header>

<div class="main">

    <div class="success-box">

        <div class="check">
            &#10003;
        </div>

        <h1>Submission Successful!</h1>

        <p class="message">
            <%= request.getAttribute("message") != null
                ? request.getAttribute("message")
                : "Your request has been submitted successfully. Thank you for using our Lost & Found Management System." %>
        </p>

        <div class="buttons">

            <a href="index.jsp">Back to Home</a>

            <a href="search.jsp">Search Items</a>

        </div>

    </div>

</div>

<footer>
    <p>&copy; 2026 Lost & Found Management System. All Rights Reserved.</p>
</footer>

</body>
</html>
