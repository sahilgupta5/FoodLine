/**
 * @author Sahil Gupta - sahilgupta5@hotmail.com
 * Copyright - Take authors permission before using any piece of the code.
 */

package com.foodline.model;

public class VendorUser extends User{

	private static VendorUser INSTANCE = null;
	
	//This helps in creating a singleton User class to make 
	//sure only one instance exits and multiple threads do not
	//access it at the same time/locked properly.
	private VendorUser(){}
	
	public static synchronized VendorUser getInstance(){
		if(INSTANCE == null){
			INSTANCE = new VendorUser();
		}
		return INSTANCE;
	}

	private boolean isAdmin;
	private String employeeID;

	public String getEmployeeID() {
		return employeeID;
	}
	public void setEmployeeID(String employeeID) {
		this.employeeID = employeeID;
	}
	public boolean isAdmin() {
		return isAdmin;
	}
	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
}
