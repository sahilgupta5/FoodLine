/**
 * @author Sahil Gupta - sahilgupta5@hotmail.com
 * Copyright - Take authors permission before using any piece of the code.
 */

package com.foodline.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import com.foodline.model.Order;
import com.foodline.model.User;
import com.foodline.services.ErrorHandlingServices;

public class PaymentFoodLinePage extends Activity {
	
	TextView orderDescription;
	EditText comments;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_payment_page);

		orderDescription = (TextView) findViewById(R.id.textView2_10b);
		
		String currentOrder = "Current Items Ordered:";
		for(int i = 0; i < Order.getOrderString().size(); i++){
			currentOrder += "\n";
			currentOrder += Order.getOrderString().get(i);
		}
		currentOrder += "\nTime Slot Ordered: " + Order.getTimeSlotOrdered();
		currentOrder += "\nTime Ordered: " + Order.getDateTimePlaced();
		orderDescription.setText(currentOrder);
	}

	/** Called when the user clicks press to pay button 
	 * @throws InterruptedException */
	@SuppressLint("NewApi")
	public void onPressToPay(View view) throws InterruptedException {
		Intent intent = new Intent(this, ConfirmationPage.class);
		comments = (EditText) findViewById(R.id.editText1_10b);
		Order.setComments(comments.getText().toString());
		
		JSONObject OrderJSONDetails = new JSONObject();
		System.out.println(Order.getItemsOrdered().toString());
		JSONArray itemsOrdered = null;
		try {
			itemsOrdered = new JSONArray(Order.getOrderString().toArray());
		} catch (JSONException e1) {
			e1.printStackTrace();
		}
		try {
			OrderJSONDetails.put("ItemsOrdered", itemsOrdered.toString());
			OrderJSONDetails.put("UsersFirstAndLastName", User.getInstance().getFirstName() + " " + User.getInstance().getLastName());
			OrderJSONDetails.put("Email", User.getInstance().getEmailAddress());
			Random paymentID = new Random();
			long randlong = paymentID.nextLong() + 1000000000l;
			OrderJSONDetails.put("PaymentInfo", new String("Paid using PayPal Account:" + randlong));
			OrderJSONDetails.put("TimeSlotOrdered", Integer.valueOf(Order.getTimeSlotOrdered()));
			OrderJSONDetails.put("TimeOrdered", Long.valueOf(Order.getDateTimePlaced()));
		} catch (JSONException e) {
			ErrorHandlingServices.JSONError(this);
		}
		
		//http://localhost/order.php/?sid=53490109dc452&rid=1&
		//details=burger&timeslot=34&timeCreated=35&email=p@g.edu
		HttpClient httpclient = new DefaultHttpClient();
		HttpPost httppost = new HttpPost("http://"
				+ getString(R.string.server_domain_name)
				+ "/FoodLine/order.php?sid=" + User.getInstance().getUniqueSessionID()
				+ "&rid=" + Order.getRestaurant().getRestaurantID()
				+ "&timeslot=" + Order.getTimeSlotOrdered()
				+ "&timeCreated=" + Order.getDateTimePlaced()
				+ "&email=" + User.getInstance().getEmailAddress());

        List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
        nameValuePairs.add(new BasicNameValuePair("details", OrderJSONDetails.toString()));

		try {
			
	        httppost.setEntity(new UrlEncodedFormEntity(nameValuePairs));
	        
			HttpResponse response = httpclient.execute(httppost);
			BufferedReader rd = new BufferedReader(new InputStreamReader(
					response.getEntity().getContent()));

			String line = "";
			String serverStringFetched = "";
			while ((line = rd.readLine()) != null) {
				serverStringFetched = line;
			}

			try {
				JSONObject responseJSON = new JSONObject(serverStringFetched);
				if(Integer.parseInt(responseJSON.getString("status")) == 1){
					Thread.sleep(3000);
					startActivity(intent);
				}else{
					ErrorHandlingServices.OrderDidNotGoThroughError(this);
					return;
				}
			} catch (JSONException e) {
				ErrorHandlingServices.JSONError(this);
				return;
			}
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
}
