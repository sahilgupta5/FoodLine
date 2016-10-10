/**
 * @author Sahil Gupta - sahilgupta5@hotmail.com
 * Copyright - Take authors permission before using any piece of the code.
 */

package com.foodline.model;

import java.util.ArrayList;

/**
 * @author sahilgupta
 * 
 *         This class represents an order. It consists of items the
 *         customer/client bought, info associated with order, user info etc.
 * 
 */
public class Order {

	public static void setComments(String comments) {
		Order.comments = comments;
	}

	private static Order INSTANCE = new Order();
	
	private static String orderID;// unique ID representing each and every order
	private static User user;
	private static long dateTimePlaced;// time in millis representing when the
										// order was placed
	private static String paymentInfo;// string representation of how the user paid for the order
	private static Restaurant restaurant;
	private static ArrayList<RestaurantMenuItem> itemsOrdered;
	private static String comments;
	private static ArrayList<String> orderString;
	private static int timeSlotOrdered;
	
	public Order(){
		user = new User();
		itemsOrdered = new ArrayList<RestaurantMenuItem>();
		restaurant = new Restaurant();
		orderString = new ArrayList<String>();
	}
	
	public static synchronized Order getInstance(){
		return INSTANCE;
	}
	
	public static String getOrderID() {
		return orderID;
	}

	public static void setOrderID(String orderID) {
		Order.orderID = orderID;
	}

	public static User getUser() {
		return user;
	}

	public static void setUser(User user) {
		Order.user = user;
	}

	public static long getDateTimePlaced() {
		return dateTimePlaced;
	}

	public static void setDateTimePlaced(long dateTimePlaced) {
		Order.dateTimePlaced = dateTimePlaced;
	}

	public static String getPaymentInfo() {
		return paymentInfo;
	}

	public static void setPaymentInfo(String paymentInfo) {
		Order.paymentInfo = paymentInfo;
	}

	public static Restaurant getRestaurant() {
		return restaurant;
	}

	public static void setRestaurant(Restaurant restaurant) {
		Order.restaurant = restaurant;
	}

	public static ArrayList<RestaurantMenuItem> getItemsOrdered() {
		return itemsOrdered;
	}

	public static void setItemsOrdered(ArrayList<RestaurantMenuItem> itemsOrdered) {
		Order.itemsOrdered = itemsOrdered;
	}

	public static String getComments() {
		return comments;
	}
	
	public static ArrayList<String> getOrderString() {
		return orderString;
	}

	public static void setOrderString(ArrayList<String> orderString) {
		Order.orderString = orderString;
	}
	
	public static void recalculateORDERSTRING(){
	    Order.orderString.clear();
	    for(int i = 0; i < Order.itemsOrdered.size(); i++){
	    	orderString.add(Order.itemsOrdered.get(i).toString());
	    }
	}

	public static int getTimeSlotOrdered() {
		return timeSlotOrdered;
	}

	public static void setTimeSlotOrdered(int timeSlotOrdered) {
		Order.timeSlotOrdered = timeSlotOrdered;
	}


}
