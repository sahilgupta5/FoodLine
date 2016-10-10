/**
 * @author Sahil Gupta - sahilgupta5@hotmail.com
 * Copyright - Take authors permission before using any piece of the code.
 */

package com.foodline.controller;

import java.util.ArrayList;

import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import com.foodline.model.Order;
import com.foodline.model.Restaurant;
import com.foodline.model.RestaurantMenu;
import com.foodline.services.ErrorHandlingServices;

public class OrderPage extends ListActivity {

	private Restaurant restaurant;
	RestaurantMenu restaurantMenu;
	private ArrayList<String> itemsOrdered = Order.getOrderString();
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_order_page);
		
		Bundle extras = getIntent().getExtras();
		restaurant = (Restaurant) extras.getSerializable("Restaurant");
		restaurantMenu = (RestaurantMenu) extras.getSerializable("Menu");
		
		ListView menuList = getListView();
		
		Order.recalculateORDERSTRING();
		String[] orderedItemsDescription = itemsOrdered.toArray(new String[itemsOrdered.size()]);

		ArrayAdapter<String> orderedItemsAdapter = new ArrayAdapter<String>(this,
				android.R.layout.simple_list_item_1,
				orderedItemsDescription);
		menuList.setAdapter(orderedItemsAdapter);
	}
	
	//user can click the items to remove them
	protected void onListItemClick(ListView l, View v, int position, long id) {
		Intent intent = new Intent(this, OrderPage.class);
		Order.getItemsOrdered().remove(position);
		intent.putExtra("Menu", restaurantMenu);
	    startActivity(intent);
	}
	
	/** Called when the user clicks the Add More Items button */
	public void onAddMenuItem(View view) {
		Intent intent = new Intent(this, MenuPage.class);
		intent.putExtra("Restaurant", restaurant);
		intent.putExtra("Menu", restaurantMenu);
		startActivity(intent);
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

}
