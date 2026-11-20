
package com.lostfound;

public class Item {

    private int id;
    private String itemType;
    private String itemName;
    private String category;
    private String description;
    private String location;
    private String itemDate;
    private String contactName;
    private String contactNumber;

    public Item(int id, String itemType, String itemName,
                String category, String description,
                String location, String itemDate,
                String contactName, String contactNumber) {

        this.id = id;
        this.itemType = itemType;
        this.itemName = itemName;
        this.category = category;
        this.description = description;
        this.location = location;
        this.itemDate = itemDate;
        this.contactName = contactName;
        this.contactNumber = contactNumber;
    }

    public int getId() {
        return id;
    }

    public String getItemType() {
        return itemType;
    }

    public String getItemName() {
        return itemName;
    }

    public String getCategory() {
        return category;
    }

    public String getDescription() {
        return description;
    }

    public String getLocation() {
        return location;
    }

    public String getItemDate() {
        return itemDate;
    }

    public String getContactName() {
        return contactName;
    }

    public String getContactNumber() {
        return contactNumber;
    }
}
