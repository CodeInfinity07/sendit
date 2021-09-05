package com.liteafrica.sendit.Model;

public class Eats {


    private String Name;
    private String Photo;
    private String Open_time;
    private String Closing_time;
    private String Minimum_orders;
    private String CURL;
    private String Address;
    private String Description;
    private String Colors,Date,Time,CanteenName;
    private String Title,Category;
    private int NoofItems,OrderID;
    private String cPhoto;
    private double Latitude,Lonitude,Discount,Packaging,Rating,Less,More,MRP,Price;
    private int ID,Veg,NonVeg,Minimum_person,Minimum_time,NoofPersons,Stock;
    private int submenu,subsubmenu,isOutOfStock,CanteenID;

    public String getName(int position) {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getPhoto(int position) {
        return Photo;
    }

    public void setPhoto(String photo) {
        Photo = photo;
    }

    public String getOpen_time(int position) {
        return Open_time;
    }

    public void setOpen_time(String open_time) {
        Open_time = open_time;
    }

    public String getClosing_time(int position) {
        return Closing_time;
    }

    public void setClosing_time(String closing_time) {
        Closing_time = closing_time;
    }

    public String getMinimum_orders(int position) {
        return Minimum_orders;
    }

    public void setMinimum_orders(String minimum_orders) {
        Minimum_orders = minimum_orders;
    }

    public String getCURL(int position) {
        return CURL;
    }

    public void setCURL(String CURL) {
        this.CURL = CURL;
    }

    public String getAddress(int position) {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getDescription(int position) {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getColors(int position) {
        return Colors;
    }

    public void setColors(String colors) {
        Colors = colors;
    }

    public String getDate(int position) {
        return Date;
    }

    public void setDate(String date) {
        Date = date;
    }

    public String getTime(int position) {
        return Time;
    }

    public void setTime(String time) {
        Time = time;
    }

    public String getCanteenName(int position) {
        return CanteenName;
    }

    public void setCanteenName(String canteenName) {
        CanteenName = canteenName;
    }

    public String getTitle(int position) {
        return Title;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public String getCategory(int position) {
        return Category;
    }

    public void setCategory(String category) {
        Category = category;
    }

    public int getNoofItems(int position) {
        return NoofItems;
    }

    public void setNoofItems(int noofItems) {
        NoofItems = noofItems;
    }

    public int getOrderID(int position) {
        return OrderID;
    }

    public void setOrderID(int orderID) {
        OrderID = orderID;
    }

    public String getcPhoto(int position) {
        return cPhoto;
    }

    public void setcPhoto(String cPhoto) {
        this.cPhoto = cPhoto;
    }

    public double getLatitude(int position) {
        return Latitude;
    }

    public void setLatitude(double latitude) {
        Latitude = latitude;
    }

    public double getLonitude(int position) {
        return Lonitude;
    }

    public void setLonitude(double lonitude) {
        Lonitude = lonitude;
    }

    public double getDiscount(int position) {
        return Discount;
    }

    public void setDiscount(double discount) {
        Discount = discount;
    }

    public double getPackaging(int position) {
        return Packaging;
    }

    public void setPackaging(double packaging) {
        Packaging = packaging;
    }

    public double getRating(int position) {
        return Rating;
    }

    public void setRating(double rating) {
        Rating = rating;
    }

    public double getLess(int position) {
        return Less;
    }

    public void setLess(double less) {
        Less = less;
    }

    public double getMore(int position) {
        return More;
    }

    public void setMore(double more) {
        More = more;
    }

    public double getMRP(int position) {
        return MRP;
    }

    public void setMRP(double MRP) {
        this.MRP = MRP;
    }

    public double getPrice(int position) {
        return Price;
    }

    public void setPrice(double price) {
        Price = price;
    }

    public int getID(int position) {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getVeg(int position) {
        return Veg;
    }

    public void setVeg(int veg) {
        Veg = veg;
    }

    public int getNonVeg(int position) {
        return NonVeg;
    }

    public void setNonVeg(int nonVeg) {
        NonVeg = nonVeg;
    }

    public int getMinimum_person(int position) {
        return Minimum_person;
    }

    public void setMinimum_person(int minimum_person) {
        Minimum_person = minimum_person;
    }

    public int getMinimum_time(int position) {
        return Minimum_time;
    }

    public void setMinimum_time(int minimum_time) {
        Minimum_time = minimum_time;
    }

    public int getNoofPersons(int position) {
        return NoofPersons;
    }

    public void setNoofPersons(int noofPersons) {
        NoofPersons = noofPersons;
    }

    public int getStock(int position) {
        return Stock;
    }

    public void setStock(int stock) {
        Stock = stock;
    }

    public int getSubmenu(int position) {
        return submenu;
    }

    public void setSubmenu(int submenu) {
        this.submenu = submenu;
    }

    public int getSubsubmenu(int position) {
        return subsubmenu;
    }

    public void setSubsubmenu(int subsubmenu) {
        this.subsubmenu = subsubmenu;
    }

    public int getIsOutOfStock(int position) {
        return isOutOfStock;
    }

    public void setIsOutOfStock(int isOutOfStock) {
        this.isOutOfStock = isOutOfStock;
    }

    public int getCanteenID(int position) {
        return CanteenID;
    }

    public void setCanteenID(int canteenID) {
        CanteenID = canteenID;
    }
}
