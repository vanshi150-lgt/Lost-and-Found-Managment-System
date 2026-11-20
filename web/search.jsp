
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Search Items | Lost & Found</title>

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
            max-width: 850px;
            margin: 65px auto;
            padding: 35px;
        }

        .search-box {
            background: white;
            padding: 40px 30px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 4px 18px rgba(0,0,0,0.08);
        }

        h1 {
            color: #173b67;
            margin-bottom: 12px;
        }

        .subtitle {
            color: #758397;
            margin-bottom: 30px;
            line-height: 1.6;
        }

        label {
            display: block;
            text-align: left;
            font-weight: bold;
            margin-bottom: 8px;
        }

        input, select {
            width: 100%;
            padding: 13px;
            border: 1px solid #ccd5df;
            border-radius: 6px;
            font-size: 15px;
            margin-bottom: 20px;
        }

        input:focus, select:focus {
            outline: none;
            border-color: #2875a8;
        }

        button {
            width: 100%;
            padding: 14px;
            border: none;
            background: #173b67;
            color: white;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background: #2875a8;
        }

        .results {
            margin-top: 35px;
        }

        .results h2 {
            color: #173b67;
            margin-bottom: 20px;
        }

        .item-card {
            background: white;
            padding: 22px;
            border-radius: 9px;
            margin-bottom: 18px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.06);
        }

        .item-card h3 {
            color: #173b67;
            margin-bottom: 12px;
        }

        .item-card p {
            color: #657487;
            font-size: 14px;
            margin: 8px 0;
        }

        .item-card a {
            display: inline-block;
            margin-top: 12px;
            padding: 10px 17px;
            background: #173b67;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .empty {
            background: white;
            padding: 25px;
            text-align: center;
            border-radius: 8px;
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
                margin: 30px auto;
                padding: 15px;
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

    <div class="search-box">

        <h1>Search for an Item</h1>

        <p class="subtitle">
            Looking for something?
            Search through reported lost and found items.
        </p>

        <form action="SearchServlet" method="get">

            <label>Enter Item Name</label>

            <input type="text"
                   name="keyword"
                   placeholder="Example: Mobile Phone, Wallet">

            <label>Select Category</label>

            <select name="category">
                <option value="">All Categories</option>
                <option value="Electronics">Electronics</option>
                <option value="Documents">Documents</option>
                <option value="Bags">Bags</option>
                <option value="Jewellery">Jewellery</option>
                <option value="Clothing">Clothing</option>
                <option value="Accessories">Accessories</option>
                <option value="Other">Other</option>
            </select>

            <button type="submit">Search Items</button>

        </form>

    </div>

    <div class="results">

        <%
            List<Map<String, Object>> items =
                (List<Map<String, Object>>) request.getAttribute("items");

            if (items != null) {
        %>

        <h2>Search Results</h2>

        <%
                if (!items.isEmpty()) {

                    for (Map<String, Object> item : items) {
        %>

        <div class="item-card">

            <h3><%= item.get("itemName") %></h3>

            <p>
                <strong>Type:</strong>
                <%= item.get("itemType") %>
            </p>

            <p>
                <strong>Category:</strong>
                <%= item.get("category") %>
            </p>

            <p>
                <strong>Location:</strong>
                <%= item.get("location") %>
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
            <h3>No Matching Items Found</h3>
            <p>Try another item name or category.</p>
        </div>

        <%
                }
            }
        %>

    </div>

</div>

<footer>
    <p>&copy; 2026 Lost & Found Management System. All Rights Reserved.</p>
</footer>

</body>
</html>
