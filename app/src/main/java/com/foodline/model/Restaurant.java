/**
 * @author Sahil Gupta - sahilgupta5@hotmail.com
 * Copyright - Take authors permission before using any piece of the code.
 */

package com.foodline.model;

import java.io.Serializable;

/**
 * @author sahilgupta
 *
 * This class represent a Restaurant. A restaurant has several menus
 * associated with it. For instance, a restaurant with many menus 
 * such as Breakfast, Lunch, Dinner, etc will have several instances
 * of this object associated with it.
 */


public class Restaurant implements Serializable {

	private static final long serialVersionUID = -1061417446779283364L;
	private String restaurantName;
	private int restaurantID;
	private String address;
	private double gpsLatitude;
	private double gpsLongitude;
	private String description;
	private long openTimeRestaurant;
	private long closeTimeRestaurant;
	private int numberOfSlotInDay;
	private int limit;
	private RestaurantMenu[] restaurantMenus;
	
	public String getRestaurantName() {
		return restaurantName;
	}
	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}
	public RestaurantMenu[] getRestaurantMenus() {
		return restaurantMenus;
	}
	public void setRestaurantMenus(RestaurantMenu[] restaurantMenus) {
		this.restaurantMenus = restaurantMenus;
	}
	public int getRestaurantID() {
		return restaurantID;
	}
	public void setRestaurantID(int restaurantID) {
		this.restaurantID = restaurantID;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public double getGpsLongitude() {
		return gpsLongitude;
	}
	public void setGpsLongitude(double gpsLongitude) {
		this.gpsLongitude = gpsLongitude;
	}
	public double getGpsLatitude() {
		return gpsLatitude;
	}
	public void setGpsLatitude(double gpsLatitude) {
		this.gpsLatitude = gpsLatitude;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public long getOpenTimeRestaurant() {
		return openTimeRestaurant;
	}
	public void setOpenTimeRestaurant(long openTimeRestaurant) {
		this.openTimeRestaurant = openTimeRestaurant;
	}
	public long getCloseTimeRestaurant() {
		return closeTimeRestaurant;
	}
	public void setCloseTimeRestaurant(long closeTimeRestaurant) {
		this.closeTimeRestaurant = closeTimeRestaurant;
	}
	public int getNumberOfSlotInDay() {
		return numberOfSlotInDay;
	}
	public void setNumberOfSlotInDay(int numberOfSlotInDay) {
		this.numberOfSlotInDay = numberOfSlotInDay;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}

}
