/**
 * @author Sahil Gupta - sahilgupta5@hotmail.com
 * Copyright - Take authors permission before using any piece of the code.
 */

package com.foodline.services;

public class Constants {
	
	private static final String USDollarSign = "$";
	private static final String k0 = "Sarthak";
	private static final String k1 = "Sahil";
	private static final String k2 = "GITMad";
	private static final long maxDurationOfFututrePickUp = 24*60*60*1000;//in milliseconds
	//Currently orders can only be made 24 hours in future
	
	public static String getK0() {
		return k0;
	}
	public static String getK1() {
		return k1;
	}
	public static String getK2() {
		return k2;
	}
	public static String getUsdollarsign() {
		return USDollarSign;
	}
	public static long getMaxDurationOfFututrePickUp() {
		return maxDurationOfFututrePickUp;
	}
	
}