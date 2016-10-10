/**
 * @author Sahil Gupta - sahilgupta5@hotmail.com
 * Copyright - Take authors permission before using any piece of the code.
 */

package com.foodline.model;

import java.io.Serializable;

/**
 * @author sahilgupta
 *
 * This class represent a Restaurant Menu Object.
 * A menu is composed restaurant name, menu name such
 * as breakfast menu, dinner menu, etc and several items.
 */

public class RestaurantMenu implements Serializable {

	private static final long serialVersionUID = 1L;
	private String Restaurant;
	private String menuName;
	private RestaurantMenuItem[] menu;

	public String getRestaurant() {
		return Restaurant;
	}
	public void setRestaurant(String restaurant) {
		Restaurant = restaurant;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public RestaurantMenuItem[] getMenu() {
		return menu;
	}
	public void setMenu(RestaurantMenuItem[] menu) {
		this.menu = menu;
	}
	public void setMenuAtIndex(RestaurantMenuItem menuItem, int index) {
		this.menu[index] = menuItem;
	}

}
