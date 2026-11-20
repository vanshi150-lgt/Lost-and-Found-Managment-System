
package com.lostfound;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String keyword = request.getParameter("keyword");
        String category = request.getParameter("category");

        List<Item> storedItems =
                ItemStorage.searchItems(keyword, category);

        List<Map<String, Object>> items = new ArrayList<>();

        for (Item item : storedItems) {

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

            items.add(data);
        }

        request.setAttribute("items", items);

        request.getRequestDispatcher("search.jsp")
                .forward(request, response);
    }
}
