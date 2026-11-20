
package com.lostfound;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ReportLostServlet")
public class ReportLostServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String itemName = request.getParameter("itemName");
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        String location = request.getParameter("location");
        String itemDate = request.getParameter("itemDate");
        String contactName = request.getParameter("contactName");
        String contactNumber = request.getParameter("contactNumber");

        // Check required fields
        if (isEmpty(itemName) || isEmpty(category)
                || isEmpty(description) || isEmpty(location)
                || isEmpty(itemDate) || isEmpty(contactName)
                || isEmpty(contactNumber)) {

            request.setAttribute("message",
                    "Please fill in all the required fields.");

            request.getRequestDispatcher("success.jsp")
                    .forward(request, response);

            return;
        }

        // Store the lost item
        ItemStorage.addItem(
                "LOST",
                itemName,
                category,
                description,
                location,
                itemDate,
                contactName,
                contactNumber
        );

        request.setAttribute("message",
                "Your lost item has been reported successfully!");

        request.getRequestDispatcher("success.jsp")
                .forward(request, response);
    }

    private boolean isEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }
}
