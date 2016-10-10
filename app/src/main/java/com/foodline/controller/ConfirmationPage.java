/**
 * @author Sahil Gupta - sahilgupta5@hotmail.com
 * Copyright - Take authors permission before using any piece of the code.
 */

package com.foodline.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.Activity;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.os.StrictMode;
import android.widget.TextView;

import com.foodline.model.Order;
import com.foodline.model.User;
import com.foodline.services.ErrorHandlingServices;

public class ConfirmationPage extends Activity {

	TextView finalOrderDescription;
	String finalOrderDescriptionString;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_confirmation_page);
		
		if (android.os.Build.VERSION.SDK_INT > 9) {
		      StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
		      StrictMode.setThreadPolicy(policy);
		}

		ConnectivityManager connMgr = (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
		NetworkInfo networkInfo = connMgr.getActiveNetworkInfo();
		
		finalOrderDescriptionString = "";

		if (networkInfo != null && networkInfo.isConnected()) {
			try {
				HttpClient httpclient = new DefaultHttpClient();
				//http://143.215.127.118/confirm.php?rid=1&email=1
				HttpPost httppost = new HttpPost("http://" 
						+ getString(R.string.server_domain_name) + 
						"/FoodLine/confirm.php?rid=" + Order.getRestaurant().getRestaurantID()
						+ "&email=" + User.getInstance().getEmailAddress());

				HttpResponse response = httpclient.execute(httppost);
				BufferedReader rd = new BufferedReader(new InputStreamReader(
						response.getEntity().getContent()));

				String line = "";
				String serverStringFetched = "";
				while ((line = rd.readLine()) != null) {
					serverStringFetched = line;
				}
				try {
					//{"status":1,"session":1,"data":"burger"}
					String OrderJSONString = "";
					JSONObject userJSON = new JSONObject(serverStringFetched);
					if (userJSON.getString("status").equals("1")) {
						OrderJSONString = userJSON.getString("data");
						JSONObject confirmedOrderJSON = new JSONObject(OrderJSONString);
						finalOrderDescriptionString += confirmedOrderJSON.getString("UsersFirstAndLastName") + "\n";
						finalOrderDescriptionString += confirmedOrderJSON.getString("Email") + "\n";
						finalOrderDescriptionString += confirmedOrderJSON.getString("PaymentInfo") + "\n";
						finalOrderDescriptionString += confirmedOrderJSON.getString("TimeSlotOrdered") + "\n";
						finalOrderDescriptionString += confirmedOrderJSON.getString("TimeOrdered") + "\n";
						JSONArray ItemsOrderedJSONArr = new JSONArray(confirmedOrderJSON.getString("ItemsOrdered"));
						for (int j = 0; j < ItemsOrderedJSONArr.length(); j++) {
							finalOrderDescriptionString += ("\n" + ItemsOrderedJSONArr.getString(j));
						}
					}
				} catch (JSONException e) {
					ErrorHandlingServices.JSONError(this);
					return;
				}
			} catch (IOException e) {
			}
		}
		finalOrderDescription = (TextView) findViewById(R.id.textView2_11b);

		String finalOrder = "Final Confrimation of Items Ordered:";
		finalOrder += finalOrderDescriptionString;
		finalOrderDescription.setText(finalOrder);
	}
}
