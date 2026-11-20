
package com.lostfound;

import java.util.ArrayList;
import java.util.List;

public class ItemStorage {

    private static final List<Item> items = new ArrayList<>();

    private static int nextId = 1;

    // Add a new item
    public static synchronized void addItem(
            String itemType,
            String itemName,
            String category,
            String description,
            String location,
            String itemDate,
            String contactName,
            String contactNumber) {

        Item item = new Item(
                nextId++,
                itemType,
                itemName,
                category,
                description,
                location,
                itemDate,
                contactName,
                contactNumber
        );

        items.add(item);
    }

    // Get all items
    public static synchronized List<Item> getAllItems() {
        return new ArrayList<>(items);
    }

    // Get items by type
    public static synchronized List<Item> getItemsByType(String type) {

        List<Item> result = new ArrayList<>();

        for (Item item : items) {

            if (item.getItemType().equalsIgnoreCase(type)) {
                result.add(item);
            }
        }

        return result;
    }

    // Find item by ID
    public static synchronized Item getItemById(int id) {

        for (Item item : items) {

            if (item.getId() == id) {
                return item;
            }
        }

        return null;
    }

    // Search items
    public static synchronized List<Item> searchItems(
            String keyword, String category) {

        List<Item> result = new ArrayList<>();

        for (Item item : items) {

            boolean keywordMatch =
                    keyword == null || keyword.trim().isEmpty()
                    || item.getItemName().toLowerCase()
                    .contains(keyword.toLowerCase())
                    || item.getDescription().toLowerCase()
                    .contains(keyword.toLowerCase())
                    || item.getLocation().toLowerCase()
                    .contains(keyword.toLowerCase());

            boolean categoryMatch =
                    category == null || category.trim().isEmpty()
                    || category.equalsIgnoreCase("All")
                    || item.getCategory().equalsIgnoreCase(category);

            if (keywordMatch && categoryMatch) {
                result.add(item);
            }
        }

        return result;
    }
}
