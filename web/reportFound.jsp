
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report Found Item | Lost & Found</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f4f7fb;
            color: #263445;
        }

        header {
            background-color: #173b67;
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
            max-width: 650px;
            margin: 45px auto;
            padding: 35px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.08);
        }

        h1 {
            text-align: center;
            color: #173b67;
            margin-bottom: 12px;
        }

        .subtitle {
            text-align: center;
            color: #758397;
            margin-bottom: 30px;
            line-height: 1.5;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            margin-top: 18px;
            color: #263445;
        }

        input, select, textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccd5df;
            border-radius: 6px;
            font-size: 15px;
            outline: none;
        }

        input:focus, select:focus, textarea:focus {
            border-color: #2875a8;
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }

        button {
            width: 100%;
            background-color: #173b67;
            color: white;
            padding: 14px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            margin-top: 28px;
            cursor: pointer;
        }

        button:hover {
            background-color: #2875a8;
        }

        footer {
            background-color: #173b67;
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

    <h1>Report a Found Item</h1>

    <p class="subtitle">
        Found something that belongs to someone else?
        Share its details to help return it to its owner.
    </p>

    <form action="ReportFoundServlet" method="post">

        <label>Item Name</label>
        <input type="text" name="itemName"
               placeholder="Enter item name" required>

        <label>Category</label>
        <select name="category" required>
            <option value="">Select Category</option>
            <option value="Electronics">Electronics</option>
            <option value="Documents">Documents</option>
            <option value="Bags">Bags</option>
            <option value="Jewellery">Jewellery</option>
            <option value="Clothing">Clothing</option>
            <option value="Accessories">Accessories</option>
            <option value="Other">Other</option>
        </select>

        <label>Description</label>
        <textarea name="description"
                  placeholder="Describe the found item..."
                  required></textarea>

        <label>Location Where Item Was Found</label>
        <input type="text" name="location"
               placeholder="Enter found location" required>

        <label>Date Found</label>
        <input type="date" name="itemDate" required>

        <label>Contact Name</label>
        <input type="text" name="contactName"
               placeholder="Enter your name" required>

        <label>Contact Number</label>
        <input type="tel" name="contactNumber"
               placeholder="Enter contact number"
               pattern="[0-9]{10}" maxlength="10" required>

        <button type="submit">Submit Found Item Report</button>

    </form>

</div>

<footer>
    <p>&copy; 2026 Lost & Found Management System. All Rights Reserved.</p>
</footer>

</body>
</html>
