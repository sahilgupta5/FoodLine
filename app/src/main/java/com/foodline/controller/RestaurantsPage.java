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
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.ListActivity;
import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import com.foodline.model.Restaurant;
import com.foodline.model.User;
import com.foodline.services.ErrorHandlingServices;

public class RestaurantsPage extends ListActivity {

	private Restaurant[] RestaurantsList;
	private String[] RestaurantsDescription;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_restaurants_page);

		ConnectivityManager connMgr = (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
		NetworkInfo networkInfo = connMgr.getActiveNetworkInfo();

		if (networkInfo != null && networkInfo.isConnected()) {

			// Create a new HttpClient and Post Header
			HttpClient httpclient = new DefaultHttpClient();
			HttpGet httpget = new HttpGet("http://"
					+ getString(R.string.server_domain_name) + "/FoodLine/getrestaurants.php?sid=" + User.getInstance().getUniqueSessionID());
			try {

				// Execute HTTP Post Request
				HttpResponse response = httpclient.execute(httpget);
				BufferedReader rd = new BufferedReader(new InputStreamReader(
						response.getEntity().getContent()));

				String line = "";
				String serverStringFetched = "";
				while ((line = rd.readLine()) != null) {
					serverStringFetched = line;
				}
				try {
					JSONObject dataJSON = new JSONObject(serverStringFetched);

					if (dataJSON.getString("status").equals("0")) {
						JSONArray restaurants = dataJSON.getJSONArray("data");
						RestaurantsList = new Restaurant[restaurants.length()];
						RestaurantsDescription = new String[restaurants.length()];
						for(int i = 0; i < restaurants.length(); i++){
							Restaurant restaurantItem = new Restaurant();
							JSONObject restaurant = (JSONObject) restaurants.get(i);
							restaurantItem.setRestaurantName(restaurant.getString("name"));
							restaurantItem.setRestaurantID(Integer.parseInt(restaurant.getString("restaurantID")));
							restaurantItem.setAddress(restaurant.getString("address"));
							restaurantItem.setGpsLatitude(Double.parseDouble(restaurant.getString("gps_lat")));
							restaurantItem.setGpsLongitude(Double.parseDouble(restaurant.getString("gps_lon")));
							restaurantItem.setDescription(restaurant.getString("description"));
							restaurantItem.setNumberOfSlotInDay(Integer.parseInt(restaurant.getString("timeslots")));
							restaurantItem.setOpenTimeRestaurant(Integer.parseInt(restaurant.getString("openTime")));
							restaurantItem.setCloseTimeRestaurant(Integer.parseInt(restaurant.getString("closeTime")));
							restaurantItem.setLimit(Integer.parseInt(restaurant.getString("limits")));
							RestaurantsList[i] = restaurantItem;
							RestaurantsDescription[i] = restaurantItem.getRestaurantName();
						}
						ListView restaurantList = getListView();
						ArrayAdapter<String> restaurantAdapter = new ArrayAdapter<String>(this, 
								android.R.layout.simple_list_item_1, RestaurantsDescription);
						restaurantList.setAdapter(restaurantAdapter);
					}
				} catch (JSONException e) {
					ErrorHandlingServices.JSONError(this);
					return;
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
			}
		} else {
			ErrorHandlingServices.NoConnectionFoundError(this);
			return;
		}
	}
	
	protected void onListItemClick (ListView l, View v, int position, long id){
	    Intent intent = new Intent(this, MenuSelectionPage.class);
	    Restaurant restaurant = RestaurantsList[position];
	    intent.putExtra("Restaurant", restaurant);
	    startActivity(intent);
	}
	
}

