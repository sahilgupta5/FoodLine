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

import android.annotation.SuppressLint;
import android.app.ListActivity;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.os.StrictMode;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import com.foodline.model.User;
import com.foodline.services.ErrorHandlingServices;

public class VendorLandingPage extends ListActivity {

	String finalOrdersDescriptionString;
	String[] finalOrdersDescriptionStringsList;

	@SuppressLint("NewApi")
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_vendor_landing_page);
		
		if (android.os.Build.VERSION.SDK_INT > 9) {
		      StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
		      StrictMode.setThreadPolicy(policy);
		}

		ConnectivityManager connMgr = (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
		NetworkInfo networkInfo = connMgr.getActiveNetworkInfo();

		if (networkInfo != null && networkInfo.isConnected()) {
			// Create a new HttpClient and Post Header
			HttpClient httpclient = new DefaultHttpClient();
			HttpPost httppost = new HttpPost("http://"
					+ getString(R.string.server_domain_name) + "/FoodLine/vendor.php?rid="
					+ User.getInstance().getIsVendor());

			try {
				HttpResponse response = httpclient.execute(httppost);
				BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
				String line = "";
				String serverStringFetched = "";
				while ((line = rd.readLine()) != null) {
					serverStringFetched = line;
				}
				JSONObject userJSON = new JSONObject(serverStringFetched);
				if (userJSON.getString("status").equals("1")) {
					JSONArray vendorOrdersJSON = new JSONArray(userJSON.getString("data"));
					finalOrdersDescriptionStringsList = new String[vendorOrdersJSON.length()];
					for(int i = 0; i < vendorOrdersJSON.length(); i++){
						JSONObject jsonOrderAti = vendorOrdersJSON.getJSONObject(i);
						String orderDesc = jsonOrderAti.getString("description");
						JSONObject confirmedOrderJSON = new JSONObject(orderDesc);
						finalOrdersDescriptionString += confirmedOrderJSON
								.getString("UsersFirstAndLastName") + "\n";
						finalOrdersDescriptionString += confirmedOrderJSON
								.getString("Email") + "\n";
						finalOrdersDescriptionString += confirmedOrderJSON
								.getString("PaymentInfo") + "\n";
						finalOrdersDescriptionString += confirmedOrderJSON
								.getString("TimeSlotOrdered") + "\n";
						finalOrdersDescriptionString += confirmedOrderJSON
								.getString("TimeOrdered") + "\n";
						JSONArray ItemsOrderedJSONArr = new JSONArray(confirmedOrderJSON.getString("ItemsOrdered"));
						for (int j = 0; j < ItemsOrderedJSONArr.length(); j++) {
							finalOrdersDescriptionString += ("\n" + ItemsOrderedJSONArr.getString(j));
						}
						finalOrdersDescriptionStringsList[i] = finalOrdersDescriptionString;
						finalOrdersDescriptionString = "";
					}
				}
				ListView vendorOrdersList = getListView();
				ArrayAdapter<String> ordersAdapter = new ArrayAdapter<String>(this,
						android.R.layout.simple_list_item_1, finalOrdersDescriptionStringsList);
				vendorOrdersList.setAdapter(ordersAdapter);

			} catch (IllegalStateException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			} catch (JSONException e) {
				ErrorHandlingServices.JSONError(this);
				return;
			}
		}
	}

}