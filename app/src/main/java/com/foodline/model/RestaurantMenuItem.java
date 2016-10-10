/**
 * @author Sahil Gupta - sahilgupta5@hotmail.com
 * Copyright - Take authors permission before using any piece of the code.
 */

package com.foodline.model;

import java.io.Serializable;

import com.foodline.services.Constants;

/**
 * @author sahilgupta
 *
 * This class represent a Menu Item Object. This stores basic
 * information about an item such its price, description, etc.
 * 
 */

public class RestaurantMenuItem implements Serializable{

	private static final long serialVersionUID = 1L;
	private String itemName;
	private String description;
	private Double price;
	
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	
	public String toString(){
		String returnString =  itemName + "\nPrice: " + this.getPrice().toString() + 
				Constants.getUsdollarsign();
		if(!description.equals("")){
			returnString += "\n" + description; 
		}else if(itemName == null || description == null || price == null){
			return "";
		}
		return returnString;
	}
	
}
