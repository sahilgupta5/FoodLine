/**
 * @author Sahil Gupta - sahilgupta5@hotmail.com
 * Copyright - Take authors permission before using any piece of the code.
 */

package com.foodline.controller;

import java.util.concurrent.TimeUnit;

import org.json.JSONArray;
import org.json.JSONException;

import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import com.foodline.model.Order;
import com.foodline.model.Restaurant;
import com.foodline.model.User;

public class PickUpTimeSlotPage extends ListActivity {
	private Restaurant restaurant;
	private String timeSlotsAvailable;
	private int[] timeSlot;
	
	private String[] listTimeSlotsString;
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_pick_up_time_slot_page);
		
		Bundle extras = getIntent().getExtras();
		timeSlotsAvailable = (String) extras.getSerializable("StringTimeSlotsAvailable");
		restaurant = (Restaurant) extras.getSerializable("Restaurant");
		
		try {
			timeSlotsAvailable = "1, 5, 6, 2 ,6, 45, 65, 66";//temporary
			JSONArray timeSlotAvailableArray = new JSONArray(timeSlotsAvailable);
			listTimeSlotsString = new String[timeSlotAvailableArray.length()];
			timeSlot = new int[timeSlotAvailableArray.length()];
			for(int i = 0; i < timeSlotAvailableArray.length(); i++){
				int timeSlotInt = Integer.parseInt((String) timeSlotAvailableArray.get(i));
				timeSlot[i] = timeSlotInt;
				long getUpperRange = timeSlotToTimeUpperRange(timeSlotInt);
				long getLowerRange = timeSlotToTimeLowerRange(timeSlotInt);
				int upperRangeHour = (int) TimeUnit.MILLISECONDS.toHours(getUpperRange);
				int upperRangeMinute = (int) TimeUnit.MILLISECONDS.toMinutes(getUpperRange);
				int lowerRangeMinute = (int) TimeUnit.MILLISECONDS.toMinutes(getLowerRange);
				int lowerRangeHour = (int) TimeUnit.MILLISECONDS.toHours(getLowerRange);
				listTimeSlotsString[i] = "Time Slot " + i + "\nFrom " + 
				upperRangeHour + "(Upper Range Hour):" + upperRangeMinute + "(Upper Range Minute)" +
				 "\nTo " + 
				 lowerRangeHour + "(Lower Range Hour):" + lowerRangeMinute + "(Lower Range Minute)";
			}
			
			ListView timeSlotSelectionList = getListView();
			ArrayAdapter<String> timeSlotSelectionAdapter = new ArrayAdapter<String>(this,
					android.R.layout.simple_list_item_1, listTimeSlotsString);
			timeSlotSelectionList.setAdapter(timeSlotSelectionAdapter);
		} catch (JSONException e) {
			e.printStackTrace();
		}
	}
	
	private long timeSlotToTimeUpperRange(int timeSlotInt){
		long TimeSlotLengthInMilliseconds = (restaurant.getCloseTimeRestaurant() - restaurant
				.getOpenTimeRestaurant()) / restaurant.getNumberOfSlotInDay();
		return (restaurant.getOpenTimeRestaurant() + (TimeSlotLengthInMilliseconds * timeSlotInt));
	}
	
	private long timeSlotToTimeLowerRange(int timeSlotInt){
		long TimeSlotLengthInMilliseconds = (restaurant.getCloseTimeRestaurant() - restaurant
				.getOpenTimeRestaurant()) / restaurant.getNumberOfSlotInDay();
		return (restaurant.getOpenTimeRestaurant() + (TimeSlotLengthInMilliseconds * (timeSlotInt - 1)));
	}

	protected void onListItemClick(ListView l, View v, int position, long id) {
		Intent intent = new Intent(this, PaymentFoodLinePage.class);
		Order.setTimeSlotOrdered(timeSlot[position]);
		Order.setDateTimePlaced(System.currentTimeMillis());
		Order.setRestaurant(restaurant);
		Order.setUser(User.getInstance());
		startActivity(intent);
	}

}