/**
 * @author Sahil Gupta - sahilgupta5@hotmail.com
 * Copyright - Take authors permission before using any piece of the code.
 */

package com.foodline.model;

/**
 * @author sahilgupta
 *
 * This class represent a User. A user can be either a vendor or a 
 * client/customer user. This object stores information about the 
 * user temporarily during its existence. The password's encryption 
 * will be stored only. AES 128 bit encryption will be used to encrypt
 * and decrypt the password.
 * 
 */

public class User {

	private static User INSTANCE = null;
	
	//This helps in creating a singleton User class to make 
	//sure only one instance exits and multiple threads do not
	//access it at the same time/locked properly.
	protected User(){}
	
	public static synchronized User getInstance(){
		if(INSTANCE == null){
			INSTANCE = new User();
		}
		return INSTANCE;
	}
	
	private String email;//has to be unique identifier for all users, Cannot be Null
	private String passwordEncryption;//Cannot be Null
	private String firstName;//Cannot be Null
	private String lastName;//Cannot be Null
	private String phoneNumber;//May or may not be Null
	private String emailAddress;//Cannot be Null
	private String organization;//May or may not be Null
	private String UniqueSessionID;//Helps in maintaining the session with the server
	private String photoUrl;
	private int userID;//unique identifier for a user, will make searching database faster
	private int isVendor;//THIS WILL BE 0 FOR NORMAL USERS AND RESTAURANT ID FOR VENDORS

	public static void setINSTANCE(User iNSTANCE) {
		INSTANCE = iNSTANCE;
	}

	public String getEmail() {
		return email;
	}

	public void setUsername(String email) {
		this.email = email;
	}

	public String getPasswordEncryption() {
		return passwordEncryption;
	}

	public void setPasswordEncryption(String passwordEncryption) {
		this.passwordEncryption = passwordEncryption;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getOrganization() {
		return organization;
	}

	public void setOrganization(String organization) {
		this.organization = organization;
	}
	
	public String getUniqueSessionID() {
		return UniqueSessionID;
	}

	public void setUniqueSessionID(String uniqueSessionID) {
		UniqueSessionID = uniqueSessionID;
	}

	public Integer getUserID() {
		return userID;
	}

	public void setUserID(Integer userID) {
		this.userID = userID;
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	public int getIsVendor() {
		return isVendor;
	}

	public void setIsVendor(int isVendor) {
		this.isVendor = isVendor;
	}
	
}
