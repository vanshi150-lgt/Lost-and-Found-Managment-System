
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Found Items | Lost & Found</title>

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

        .heading {
            text-align: center;
            padding: 45px 15px 20px;
        }

        .heading h1 {
            color: #173b67;
            margin-bottom: 12px;
        }

        .heading p {
            color: #758397;
        }

        .container {
            max-width: 1100px;
            margin: 25px auto 55px;
            padding: 0 20px;
        }

        .item-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 25px;
        }

        .item-card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.07);
        }

        .status {
            display: inline-block;
            background: #e1f5e8;
            color: #21834b;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .item-card h3 {
            color: #173b67;
            margin-bottom: 12px;
        }

        .item-card p {
            font-size: 14px;
            color: #657487;
            line-height: 1.7;
            margin-bottom: 8px;
        }

        .item-card a {
            display: inline-block;
            background: #173b67;
            color: white;
            padding: 10px 18px;
            margin-top: 15px;
            text-decoration: none;
            border-radius: 5px;
        }

        .item-card a:hover {
            background: #2875a8;
        }

        .empty {
            text-align: center;
            padding: 45px 20px;
            background: white;
            border-radius: 10px;
            color: #657487;
        }

        .empty a {
            display: inline-block;
            margin-top: 20px;
            background: #173b67;
            color: white;
            padding: 12px 20px;
            border-radius: 5px;
            text-decoration: none;
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

<section class="heading">
    <h1>Reported Found Items</h1>
    <p>Explore items found and reported by different people.</p>
</section>

<div class="container">

    <div class="item-grid">

        <%
            List<Map<String, Object>> items =
                (List<Map<String, Object>>) request.getAttribute("items");

            if (items != null && !items.isEmpty()) {

                for (Map<String, Object> item : items) {
        %>

        <div class="item-card">

            <span class="status">FOUND ITEM</span>

            <h3>
                <%= item.get("itemName") %>
            </h3>

            <p>
                <strong>Category:</strong>
                <%= item.get("category") %>
            </p>

            <p>
                <strong>Description:</strong>
                <%= item.get("description") %>
            </p>

            <p>
                <strong>Location:</strong>
                <%= item.get("location") %>
            </p>

            <p>
                <strong>Date Found:</strong>
                <%= item.get("itemDate") %>
            </p>

            <a href="ItemDetailsServlet?id=<%= item.get("id") %>">
                View Details
            </a>

        </div>

        <%
                }

            } else {
        %>

        <div class="empty">

            <h2>No Found Items Available</h2>

            <p>
                There are currently no found items reported.
                You can submit a new found item report.
            </p>

            <a href="reportFound.jsp">Report Found Item</a>

        </div>

        <%
            }
        %>

    </div>

</div>

<footer>
    <p>&copy; 2026 Lost & Found Management System. All Rights Reserved.</p>
</footer>

</body>
</html>
