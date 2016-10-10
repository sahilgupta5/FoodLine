/**
 * @author Sahil Gupta - sahilgupta5@hotmail.com
 * Copyright - Take authors permission before using any piece of the code.
 */

package com.foodline.services;

import android.app.AlertDialog;
import android.content.Context;

public class ErrorHandlingServices {
	private static String noItmemsOrdered= "No Items Have Been Ordered to Continue!";
	private static String noInputEntered= "No Input Entered For A Field!";
	private static String credentialsValidationFailure = "User credential validation failed! Username or password wrong.";
	private static String noConnectionFound= "No Connection Found!";
	private static String userEndAgreement= "I Agree With Terms And Conditions";
	private static String JSONFileError= "Error in reading JSON! Please check the file or resource read.";
	private static String noItemOrdered= "No item ordered.";
	private static String pickUpTimeInPast= "Cannot have a pickup time before current time!";
	private static String pickUpTimeInFuture= "Cannot have a pickup time more than 24 hours in advance!";
	private static String pickUpTimeAfterClosing= "Cannot have a pickup time after closing hours!";
	private static String pickUpTimeBeforeOpening= "Cannot have a pickup time before opening hours!";
	private static String orderDidNotGoThrough= "Order Did Not Go Through. Please try again!";
	private static String userAlreadyExists= "User Already Exists Within The Database! Please sign in with your account.";
	private static String USER_INPUT_ERROR_TYPE = "User Input Error!";
	private static String CONNECTION_ERROR_TYPE = "Connection Error!";
	private static String LOGIN_ERROR_TYPE = "Login Failure!";
	private static String JSON_INPUT_ERROR_TYPE = "JSON Input Read Error!";

	public static void NoScanCommandUserInputError(Context context){
		AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(context);
		// set title
		alertDialogBuilder.setTitle(USER_INPUT_ERROR_TYPE);
		// set dialog message
		alertDialogBuilder.setMessage(noItmemsOrdered);
		// create alert dialog
		AlertDialog alertDialog = alertDialogBuilder.create();
		// show it
		alertDialog.show();
	}
	
	public static void NoInputEnteredUserInputError(Context context){
		AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(context);
		// set title
		alertDialogBuilder.setTitle(USER_INPUT_ERROR_TYPE);
		// set dialog message
		alertDialogBuilder.setMessage(noInputEntered);
		// create alert dialog
		AlertDialog alertDialog = alertDialogBuilder.create();
		// show it
		alertDialog.show();
	}
	
	public static void NoConnectionFoundError(Context context){
		AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(context);
		// set title
		alertDialogBuilder.setTitle(CONNECTION_ERROR_TYPE);
		// set dialog message
		alertDialogBuilder.setMessage(noConnectionFound);
		// create alert dialog
		AlertDialog alertDialog = alertDialogBuilder.create();
		// show it
		alertDialog.show();
	}
	
	public static void LoginCredentialFailureError(Context context, String ErrorLog){
		AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(context);
		// set title
		alertDialogBuilder.setTitle(LOGIN_ERROR_TYPE);
		// set dialog message
		alertDialogBuilder.setMessage(credentialsValidationFailure);
		// create alert dialog
		AlertDialog alertDialog = alertDialogBuilder.create();
		// show it
		alertDialog.show();
	}
	
	public static void JSONError(Context context){
		AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(context);
		// set title
		alertDialogBuilder.setTitle(JSON_INPUT_ERROR_TYPE);
		// set dialog message
		alertDialogBuilder.setMessage(JSONFileError);
		// create alert dialog
		AlertDialog alertDialog = alertDialogBuilder.create();
		// show it
		alertDialog.show();
	}
	
	public static void noItemOrderedError(Context context){
		AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(context);
		// set title
		alertDialogBuilder.setTitle(USER_INPUT_ERROR_TYPE);
		// set dialog message
		alertDialogBuilder.setMessage(noItemOrdered);
		// create alert dialog
		AlertDialog alertDialog = alertDialogBuilder.create();
		// show it
		alertDialog.show();
	}

	public static void Agreement(Context context){
		AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(context);
		// set title
		alertDialogBuilder.setTitle("Agreement!");
		// set dialog message
		alertDialogBuilder.setMessage(userEndAgreement);
		// create alert dialog
		AlertDialog alertDialog = alertDialogBuilder.create();
		// show it
		alertDialog.show();
	}

	public static void EnterTimeInPastError(Context context) {
		AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(context);
		// set title
		alertDialogBuilder.setTitle(USER_INPUT_ERROR_TYPE);
		// set dialog message
		alertDialogBuilder.setMessage(pickUpTimeInPast);
		// create alert dialog
		AlertDialog alertDialog = alertDialogBuilder.create();
		// show it
		alertDialog.show();		
	}

	public static void CannotMakeOrder24HourInFutureError(Context context) {
		AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(context);
		// set title
		alertDialogBuilder.setTitle(USER_INPUT_ERROR_TYPE);
		// set dialog message
		alertDialogBuilder.setMessage(pickUpTimeInFuture);
		// create alert dialog
		AlertDialog alertDialog = alertDialogBuilder.create();
		// show it
		alertDialog.show();
	}
	
	public static void EnterTimeAfterClosingError(Context context) {
		AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(context);
		// set title
		alertDialogBuilder.setTitle(USER_INPUT_ERROR_TYPE);
		// set dialog message
		alertDialogBuilder.setMessage(pickUpTimeAfterClosing);
		// create alert dialog
		AlertDialog alertDialog = alertDialogBuilder.create();
		// show it
		alertDialog.show();		
	}

	public static void EnterTimeBeforeOpeningError(Context context) {
		AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(context);
		// set title
		alertDialogBuilder.setTitle(USER_INPUT_ERROR_TYPE);
		// set dialog message
		alertDialogBuilder.setMessage(pickUpTimeBeforeOpening);
		// create alert dialog
		AlertDialog alertDialog = alertDialogBuilder.create();
		// show it
		alertDialog.show();
	}

	public static void OrderDidNotGoThroughError(Context context) {
		AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(context);
		// set title
		alertDialogBuilder.setTitle(CONNECTION_ERROR_TYPE);
		// set dialog message
		alertDialogBuilder.setMessage(orderDidNotGoThrough);
		// create alert dialog
		AlertDialog alertDialog = alertDialogBuilder.create();
		// show it
		alertDialog.show();
	}

	public static void UserAlreadyExistsError(Context context) {
		AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(context);
		// set title
		alertDialogBuilder.setTitle(USER_INPUT_ERROR_TYPE);
		// set dialog message
		alertDialogBuilder.setMessage(userAlreadyExists);
		// create alert dialog
		AlertDialog alertDialog = alertDialogBuilder.create();
		// show it
		alertDialog.show();		
	}

}