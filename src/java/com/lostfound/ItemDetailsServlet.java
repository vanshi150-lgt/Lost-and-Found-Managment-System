
package com.lostfound;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ItemDetailsServlet")
public class ItemDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String idParameter = request.getParameter("id");

        try {

            int id = Integer.parseInt(idParameter);

            Item item = ItemStorage.getItemById(id);

            if (item == null) {

                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Item not found."
                );

                return;
            }

            Map<String, Object> data = new HashMap<>();

            data.put("id", item.getId());
            data.put("itemType", item.getItemType());
            data.put("itemName", item.getItemName());
            data.put("category", item.getCategory());
            data.put("description", item.getDescription());
            data.put("location", item.getLocation());
            data.put("itemDate", item.getItemDate());
            data.put("contactName", item.getContactName());
            data.put("contactNumber", item.getContactNumber());

            request.setAttribute("item", data);

            request.getRequestDispatcher("itemDetails.jsp")
                    .forward(request, response);

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid item ID."
            );
        }
    }
}
