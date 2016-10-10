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

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Fragment;
import android.content.Intent;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.EditText;

import com.foodline.services.ErrorHandlingServices;

public class SignUpPage extends Activity {

	private EditText email, firstName, lastName, password, phoneNumber;
	private String emailString, firstNameString, lastNameString,
			passwordString, phoneNumberString;
	private CheckBox agreement;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_sign_up_page);

		if (savedInstanceState == null) {
			getFragmentManager().beginTransaction()
					.add(R.id.container, new PlaceholderFragment()).commit();
		}
		
		if (android.os.Build.VERSION.SDK_INT > 9) {
		      StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
		      StrictMode.setThreadPolicy(policy);
		}
	}

	/** Called when the user clicks the Submit button */
	public void onSubmitButtonClick(View view) {
		Intent intent = new Intent(this, LandingPage.class);

		boolean error = false;
		StringBuffer errorLog = new StringBuffer();
		email = (EditText) findViewById(R.id.editText1_3b);
		firstName = (EditText) findViewById(R.id.editText2_3b);
		lastName = (EditText) findViewById(R.id.editText3_3b);
		password = (EditText) findViewById(R.id.editText4_3b);
		phoneNumber = (EditText) findViewById(R.id.editText5_3b);
		agreement = (CheckBox) findViewById(R.id.checkBox1_3b);

		errorLog.append("Please Enter: ");
		if (email.getText().toString().matches("")) {
			errorLog.append("Email ");
			error = true;
		}
		if (firstName.getText().toString().matches("")) {
			errorLog.append("First Name ");
			error = true;
		}
		if (lastName.getText().toString().matches("")) {
			errorLog.append("Last Name ");
			error = true;
		}
		if (password.getText().toString().matches("")) {
			errorLog.append("Phone Number ");
			error = true;
		}
		if (phoneNumber.getText().toString().matches("")) {
			errorLog.append("Password ");
			error = true;
		}

		if (error == false) {// All user input entered
			
		    // Create a new HttpClient and Post Header
		    HttpClient httpclient = new DefaultHttpClient();
		    HttpPost httppost = new HttpPost("http://" + getString(R.string.server_domain_name) + "/FoodLine/register.php");

		    try {
		    	//extract values
		    	emailString = email.getText().toString();
		    	firstNameString = firstName.getText().toString();
		    	lastNameString = lastName.getText().toString();
		    	phoneNumberString = phoneNumber.getText().toString();
		    	passwordString = password.getText().toString();
		    	
		        List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
		        nameValuePairs.add(new BasicNameValuePair("email", emailString));
		        nameValuePairs.add(new BasicNameValuePair("fname", firstNameString));
		        nameValuePairs.add(new BasicNameValuePair("lname", lastNameString));
		        nameValuePairs.add(new BasicNameValuePair("pass", passwordString));
		        nameValuePairs.add(new BasicNameValuePair("phone", phoneNumberString));
		        httppost.setEntity(new UrlEncodedFormEntity(nameValuePairs));

		        // Execute HTTP Post Request
		        if(agreement.isChecked()){
					HttpResponse response = httpclient.execute(httppost);
					BufferedReader rd = new BufferedReader(new InputStreamReader(
							response.getEntity().getContent()));

					String line = "";
					String serverStringFetched = "";
					while ((line = rd.readLine()) != null) {
						serverStringFetched = line;
					}
					try {
						JSONObject serverResponse = new JSONObject(serverStringFetched);
						if(Integer.parseInt(serverResponse.getString("status")) == 2){
							ErrorHandlingServices.UserAlreadyExistsError(this);
						}else{
							AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(this);
							alertDialogBuilder.setTitle("Success!");
							alertDialogBuilder.setMessage("User Created! Please login with your credentials.");
							AlertDialog alertDialog = alertDialogBuilder.create();
							alertDialog.show();
							startActivity(intent);
						}
					} catch (JSONException e) {
						ErrorHandlingServices.JSONError(this);
					}
					
		        }else{
		        	ErrorHandlingServices.Agreement(this);
		        	return;
		        }
		    } catch (ClientProtocolException e) {
		        // TODO Auto-generated catch block
		    } catch (IOException e) {
		        // TODO Auto-generated catch block
		    }
		} else {// User missed something
			ErrorHandlingServices.NoInputEnteredUserInputError(this);
		}
	}

	/**
	 * A placeholder fragment containing a simple view.
	 */
	public static class PlaceholderFragment extends Fragment {

		public PlaceholderFragment() {
		}

		@Override
		public View onCreateView(LayoutInflater inflater, ViewGroup container,
				Bundle savedInstanceState) {
			View rootView = inflater.inflate(R.layout.fragment_sign_up_page,
					container, false);
			return rootView;
		}
	}

}
