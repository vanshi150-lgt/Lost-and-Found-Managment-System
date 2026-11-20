
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Item Details | Lost & Found</title>

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

        .container {
            max-width: 700px;
            margin: 55px auto;
            padding: 35px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.08);
        }

        h1 {
            text-align: center;
            color: #173b67;
            margin-bottom: 25px;
        }

        .status {
            display: inline-block;
            padding: 7px 15px;
            border-radius: 20px;
            background: #e1f5e8;
            color: #21834b;
            font-size: 13px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .detail {
            padding: 15px 0;
            border-bottom: 1px solid #e5eaf0;
            line-height: 1.6;
        }

        .detail strong {
            color: #173b67;
            display: inline-block;
            width: 155px;
        }

        .buttons {
            text-align: center;
            margin-top: 30px;
        }

        .buttons a {
            display: inline-block;
            padding: 13px 23px;
            margin: 7px;
            border-radius: 6px;
            text-decoration: none;
            background: #173b67;
            color: white;
        }

        .buttons a:hover {
            background: #2875a8;
        }

        .not-found {
            text-align: center;
            padding: 35px 10px;
            color: #657487;
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

            .container {
                margin: 25px 15px;
                padding: 25px 20px;
            }

            .detail strong {
                width: auto;
                display: block;
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

<div class="container">

    <h1>Complete Item Details</h1>

    <%
        Map<String, Object> item =
            (Map<String, Object>) request.getAttribute("item");

        if (item != null) {

            String itemType = String.valueOf(item.get("itemType"));
    %>

    <div class="status">
        <%= "FOUND".equalsIgnoreCase(itemType) ? "FOUND ITEM" : "LOST ITEM" %>
    </div>

    <div class="detail">
        <strong>Item Name:</strong>
        <%= item.get("itemName") %>
    </div>

    <div class="detail">
        <strong>Category:</strong>
        <%= item.get("category") %>
    </div>

    <div class="detail">
        <strong>Description:</strong>
        <%= item.get("description") %>
    </div>

    <div class="detail">
        <strong>Location:</strong>
        <%= item.get("location") %>
    </div>

    <div class="detail">
        <strong>Date:</strong>
        <%= item.get("itemDate") %>
    </div>

    <div class="detail">
        <strong>Contact Name:</strong>
        <%= item.get("contactName") %>
    </div>

    <div class="detail">
        <strong>Contact Number:</strong>
        <%= item.get("contactNumber") %>
    </div>

    <div class="buttons">

        <a href="claim.jsp?id=<%= item.get("id") %>">
            Contact / Submit Claim
        </a>

        <a href="javascript:history.back()">
            Go Back
        </a>

    </div>

    <%
        } else {
    %>

    <div class="not-found">
        <h2>Item Details Not Available</h2>
        <p>The requested item could not be found.</p>

        <div class="buttons">
            <a href="index.jsp">Return Home</a>
        </div>
    </div>

    <%
        }
    %>

</div>

<footer>
    <p>&copy; 2026 Lost & Found Management System. All Rights Reserved.</p>
</footer>

</body>
</html>
