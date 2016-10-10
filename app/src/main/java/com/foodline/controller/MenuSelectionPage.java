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

import com.foodline.model.Order;
import com.foodline.model.Restaurant;
import com.foodline.model.RestaurantMenu;
import com.foodline.model.RestaurantMenuItem;
import com.foodline.model.User;
import com.foodline.services.ErrorHandlingServices;

public class MenuSelectionPage extends ListActivity {

	private RestaurantMenu restaurantMenu;
	private Restaurant restaurant;
	private String[] menuSelectionDescription;
	private JSONArray MenusJSONArray;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_menu_selection_page);

		Bundle extras = getIntent().getExtras();
		restaurant = (Restaurant) extras.getSerializable("Restaurant");
		Order.setRestaurant(restaurant);
		
		ConnectivityManager connMgr = (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
		NetworkInfo networkInfo = connMgr.getActiveNetworkInfo();

		if (networkInfo != null && networkInfo.isConnected()) {
			// Create a new HttpClient and Post Header
			HttpClient httpclient = new DefaultHttpClient();
			HttpGet httpget = new HttpGet("http://"
					+ getString(R.string.server_domain_name) + "/FoodLine/getmenus.php?sid="
					+ User.getInstance().getUniqueSessionID()
					+ "&rid=" + restaurant.getRestaurantID());
			try {
				// Execute HTTP Post Request
				HttpResponse response = httpclient.execute(httpget);
				BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));

				String line = "";
				String serverStringFetched = "";
				while ((line = rd.readLine()) != null) {
					serverStringFetched = line;
				}
				try {
					JSONObject dataJSON = new JSONObject(serverStringFetched);
					if (dataJSON.getString("status").equals("0")) {
						MenusJSONArray = dataJSON.getJSONArray("data");
						menuSelectionDescription = new String[MenusJSONArray.length()];
						for (int i = 0; i < MenusJSONArray.length(); i++) {
							menuSelectionDescription[i] = MenusJSONArray.getJSONObject(i).getString("name");
						}
						ListView menuList = getListView();
						ArrayAdapter<String> restaurantAdapter = new ArrayAdapter<String>(this,
								android.R.layout.simple_list_item_1, menuSelectionDescription);
						menuList.setAdapter(restaurantAdapter);
					}
				} catch (JSONException e) {
					ErrorHandlingServices.JSONError(this);
					return;
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			ErrorHandlingServices.NoConnectionFoundError(this);
		}
	}

	protected void onListItemClick(ListView l, View v, int position, long id) {
		Intent intent = new Intent(this, MenuPage.class);
		JSONObject restaurantMenuJSON;
		JSONArray restaurantMenuJSONArray;
		try {
			String restaurantMenuJSONString = MenusJSONArray.getJSONObject(position).getString("menuJSON");
			restaurantMenuJSON = new JSONObject(restaurantMenuJSONString);
			restaurantMenuJSON.getJSONArray("menuitems").toString();
			restaurantMenuJSONArray = restaurantMenuJSON.getJSONArray("menuitems");
			
			restaurantMenu = new RestaurantMenu();
			restaurantMenu.setRestaurant(restaurant.getRestaurantName());
			restaurantMenu.setMenuName(MenusJSONArray.getJSONObject(position).getString("name"));
			restaurantMenu.setMenu(new RestaurantMenuItem[restaurantMenuJSONArray.length()]);
			for (int i = 0; i < restaurantMenuJSONArray.length(); i++) {
				RestaurantMenuItem menuItem = new RestaurantMenuItem();
				JSONObject jsonMenuItem = (JSONObject) restaurantMenuJSONArray.get(i);
				menuItem.setItemName(jsonMenuItem.getString("item"));
				menuItem.setDescription(jsonMenuItem.getString("description"));
				menuItem.setPrice(Double.parseDouble(jsonMenuItem.getString("price")));
				restaurantMenu.setMenuAtIndex(menuItem, i);
			}
			intent.putExtra("Restaurant", restaurant);
			intent.putExtra("Menu", restaurantMenu);
			startActivity(intent);
		} catch (JSONException e) {
			ErrorHandlingServices.JSONError(this);
		}
	}

}
