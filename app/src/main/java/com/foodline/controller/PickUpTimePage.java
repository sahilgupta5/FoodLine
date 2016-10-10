/**
 * @author Sahil Gupta - sahilgupta5@hotmail.com
 * Copyright - Take authors permission before using any piece of the code.
 */

package com.foodline.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Calendar;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.DatePicker;
import android.widget.TimePicker;

import com.foodline.model.Order;
import com.foodline.model.Restaurant;
import com.foodline.model.User;
import com.foodline.services.Constants;
import com.foodline.services.ErrorHandlingServices;

@SuppressWarnings("unused")
public class PickUpTimePage extends Activity {
	private Restaurant restaurant;
	TimePicker tp;
	DatePicker dp;
	private int TimeSlotRequested;
	private int TimeSlotLengthInMilliseconds;
	private int currentMinute, currentHour, currentDay, currentMonth,
			currentYear;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_pick_up_time_page);

		Bundle extras = getIntent().getExtras();
		restaurant = (Restaurant) extras.getSerializable("Restaurant");
		tp = new TimePicker(this);
		tp = (TimePicker) findViewById(R.id.timePicker1_8b);
		final Calendar c = Calendar.getInstance();
		currentHour = c.get(Calendar.HOUR_OF_DAY);
		currentMinute = c.get(Calendar.MINUTE);

		tp.setCurrentHour(currentHour);
		tp.setCurrentMinute(currentMinute);

		dp = (DatePicker) findViewById(R.id.datePicker1_8b);
		dp.setCalendarViewShown(false);
		long maxDateMilliseconds = System.currentTimeMillis()
				+ Constants.getMaxDurationOfFututrePickUp();
		dp.setMaxDate(maxDateMilliseconds);
		dp.setMinDate(System.currentTimeMillis() - 5000);

		currentDay = c.get(Calendar.DAY_OF_MONTH);
		currentMonth = c.get(Calendar.MONTH);
		currentYear = c.get(Calendar.YEAR);
	}

	public int getTimeSlot(int userRequestedMinute, int userRequestedHour,
			int userRequestedDay, int userRequestedMonth) {
		int timeslot;
		long TimeSlotLengthInMilliseconds = (restaurant.getCloseTimeRestaurant() - restaurant
				.getOpenTimeRestaurant()) / restaurant.getNumberOfSlotInDay();
		long userRequestedTimeInMilliseconds = (userRequestedHour * 60 * 60 * 1000)
				+ (userRequestedMinute * 60 * 1000);
		timeslot = (int) Math.ceil((userRequestedTimeInMilliseconds - restaurant.getOpenTimeRestaurant()) / TimeSlotLengthInMilliseconds);
		return timeslot;
	}

	/** Called when the user clicks the check pick up time availability button */
	public void onCheckPickUpTimeAvailability(View view) {
		ConnectivityManager connMgr = (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
		NetworkInfo networkInfo = connMgr.getActiveNetworkInfo();

		Intent intentSuccess = new Intent(this, PaymentFoodLinePage.class);
		Intent intentFailure = new Intent(this, PickUpTimeSlotPage.class);
		String timeSlotsAvailable = "";

		if (networkInfo != null && networkInfo.isConnected()) {
			int userRequestedMinute = tp.getCurrentMinute();
			int userRequestedHour = tp.getCurrentHour();
			int userRequestedDay = dp.getDayOfMonth();
			int userRequestedMonth = dp.getMonth();

			if ((userRequestedHour < currentHour)
					&& (userRequestedMinute < currentMinute)) {
				 ErrorHandlingServices.EnterTimeInPastError(this);
				 return;
			}
			long dayDiff = userRequestedDay - currentDay;
			if (dayDiff != 0) {
				int totalHoursIntoFuture = userRequestedHour
						+ (23 - currentHour);
				long millisecondsDiff = (totalHoursIntoFuture * 60 * 60 * 1000)
						+ (userRequestedMinute * 60 * 1000);
				if (millisecondsDiff > Constants
						.getMaxDurationOfFututrePickUp()) {
					 ErrorHandlingServices.CannotMakeOrder24HourInFutureError(this);
					 return;
				}
			}
			long userRequestedTimeInMilliseconds = (userRequestedHour * 60 * 60 * 1000)
					+ (userRequestedMinute * 60 * 1000);
			if (userRequestedTimeInMilliseconds > restaurant
					.getCloseTimeRestaurant()) {
				 ErrorHandlingServices.EnterTimeAfterClosingError(this);
				 return;
			}
			if (userRequestedTimeInMilliseconds < restaurant
					.getOpenTimeRestaurant()) {
				 ErrorHandlingServices.EnterTimeBeforeOpeningError(this);
				 return;
			}

			TimeSlotRequested = getTimeSlot(userRequestedMinute,
					userRequestedHour, userRequestedDay, userRequestedMonth);

			try {
				HttpClient httpclient = new DefaultHttpClient();
				HttpPost httppost = new HttpPost("http://"
						+ getString(R.string.server_domain_name)
						+ "/FoodLine/pickuptime.php?rid=" + restaurant.getRestaurantID()
						+ "timeslot=" + TimeSlotRequested);

				HttpResponse response = httpclient.execute(httppost);
				BufferedReader rd = new BufferedReader(new InputStreamReader(
						response.getEntity().getContent()));

				String line = "";
				String serverStringFetched = "";
				while ((line = rd.readLine()) != null) {
					serverStringFetched = line;
				}
				try {
					JSONObject userJSON = new JSONObject(serverStringFetched);
					if (userJSON.getString("status").equals("1")) {
						timeSlotsAvailable = userJSON.getString("data");
						if(Integer.parseInt(timeSlotsAvailable) == 1){
							//available and go to payment page
							intentSuccess.putExtra("Restaurant", restaurant);
							Order.setTimeSlotOrdered(TimeSlotRequested);
							Order.setDateTimePlaced(System.currentTimeMillis());
							Order.setRestaurant(restaurant);
							Order.setUser(User.getInstance());
							startActivity(intentSuccess);
						}else{
							timeSlotsAvailable = userJSON.getString("data");
							intentFailure.putExtra("Restaurant", restaurant);
							intentFailure.putExtra("StringTimeSlotsAvailable", timeSlotsAvailable);
							startActivity(intentFailure);
						}
					}
				} catch (JSONException e) {
					ErrorHandlingServices.JSONError(this);
					return;
				}
			} catch (IOException e) {
			}
		} else {
			ErrorHandlingServices.NoConnectionFoundError(this);
			return;
		}
	}
}
