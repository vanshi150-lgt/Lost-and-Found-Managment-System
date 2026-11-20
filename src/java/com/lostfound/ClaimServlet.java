
package com.lostfound;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ClaimServlet")
public class ClaimServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String itemId = request.getParameter("itemId");
        String claimantName = request.getParameter("claimantName");
        String claimantNumber = request.getParameter("claimantNumber");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        // Check required fields
        if (isEmpty(itemId) || isEmpty(claimantName)
                || isEmpty(claimantNumber)
                || isEmpty(email) || isEmpty(message)) {

            request.setAttribute("message",
                    "Please fill in all the required fields.");

            request.getRequestDispatcher("success.jsp")
                    .forward(request, response);

            return;
        }

        try {

            int id = Integer.parseInt(itemId);

            Item item = ItemStorage.getItemById(id);

            if (item == null ||
                    !item.getItemType().equalsIgnoreCase("FOUND")) {

                request.setAttribute("message",
                        "The selected found item was not available.");

                request.getRequestDispatcher("success.jsp")
                        .forward(request, response);

                return;
            }

            // Display claim confirmation
            request.setAttribute("message",
                    "Your claim request has been submitted successfully!");

            request.getRequestDispatcher("success.jsp")
                    .forward(request, response);

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid item ID."
            );
        }
    }

    private boolean isEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }
}
