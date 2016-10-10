/**
 * @author Sahil Gupta - sahilgupta5@hotmail.com
 * Copyright - Take authors permission before using any piece of the code.
 */

package com.foodline.controller;

import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;

import com.foodline.model.Order;
import com.foodline.model.Restaurant;
import com.foodline.model.RestaurantMenu;
import com.foodline.model.User;
import com.foodline.services.ErrorHandlingServices;

public class MenuPage extends ListActivity {

	private Restaurant restaurant;
	private RestaurantMenu restaurantMenu;
	private String[] restaurantMenuItemDescription;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_menu_page);

		Bundle extras = getIntent().getExtras();
		restaurant = (Restaurant) extras.getSerializable("Restaurant");
		restaurantMenu = (RestaurantMenu) extras.getSerializable("Menu");
		
		TextView t1 = (TextView) findViewById(R.id.textView1_6b);
		t1.setText(restaurantMenu.getMenuName());

		restaurantMenuItemDescription = new String[restaurantMenu.getMenu().length];
		for (int i = 0; i < restaurantMenu.getMenu().length; i++) {
			restaurantMenuItemDescription[i] = restaurantMenu.getMenu()[i].toString();
		}

		ListView menuList = getListView();
		ArrayAdapter<String> menuAdapter = new ArrayAdapter<String>(this,
				android.R.layout.simple_list_item_1,
				restaurantMenuItemDescription);
		menuList.setAdapter(menuAdapter);
	}
	
	/** Called when the user clicks the finalize order button */
	public void onFinalizeOrder(View view) {
		if(Order.getItemsOrdered().size() == 0){
			ErrorHandlingServices.noItemOrderedError(this);
		}else{
			Intent intent = new Intent(this, PickUpTimePage.class);
			intent.putExtra("Restaurant", restaurant);
			startActivity(intent);
		}
	}
	
	protected void onListItemClick(ListView l, View v, int position, long id) {
		Intent intent = new Intent(this, OrderPage.class);
		Order.getItemsOrdered().add(restaurantMenu.getMenu()[position]);
		Order.setUser(User.getInstance());
		intent.putExtra("Menu", restaurantMenu);
		intent.putExtra("Restaurant", restaurant);
		startActivity(intent);
	}

}
