
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Submit Claim | Lost & Found</title>

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
            max-width: 650px;
            margin: 45px auto;
            padding: 35px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.08);
        }

        h1 {
            color: #173b67;
            text-align: center;
            margin-bottom: 12px;
        }

        .subtitle {
            color: #758397;
            text-align: center;
            margin-bottom: 25px;
            line-height: 1.6;
        }

        label {
            display: block;
            font-weight: bold;
            margin: 18px 0 8px;
        }

        input, textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccd5df;
            border-radius: 6px;
            font-size: 15px;
        }

        input:focus, textarea:focus {
            outline: none;
            border-color: #2875a8;
        }

        textarea {
            min-height: 120px;
            resize: vertical;
        }

        button {
            width: 100%;
            padding: 14px;
            background: #173b67;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            margin-top: 25px;
            cursor: pointer;
        }

        button:hover {
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

    <h1>Submit a Claim / Request</h1>

    <p class="subtitle">
        Provide your contact information and explain
        why you are contacting us about this item.
    </p>

    <form action="ClaimServlet" method="post">

        <input type="hidden" name="itemId"
               value="<%= request.getParameter("id") == null ? "" : request.getParameter("id") %>">

        <label>Your Name</label>
        <input type="text" name="claimantName"
               placeholder="Enter your full name" required>

        <label>Contact Number</label>
        <input type="tel" name="claimantNumber"
               placeholder="Enter your 10-digit number"
               pattern="[0-9]{10}" maxlength="10" required>

        <label>Email Address</label>
        <input type="email" name="email"
               placeholder="Enter your email address" required>

        <label>Message / Claim Description</label>
        <textarea name="message"
                  placeholder="Explain your claim or contact request..."
                  required></textarea>

        <button type="submit">
            Submit Request
        </button>

    </form>

</div>

<footer>
    <p>&copy; 2026 Lost & Found Management System. All Rights Reserved.</p>
</footer>

</body>
</html>
