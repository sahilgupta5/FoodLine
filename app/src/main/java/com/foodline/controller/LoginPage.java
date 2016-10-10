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
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.Activity;
import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;

import com.foodline.model.User;
import com.foodline.services.ErrorHandlingServices;

public class LoginPage extends Activity {

	private EditText email, password;
	private String emailString, passwordString;
	User user;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_food_line_login_page);

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
	public void onLoginCredentialsSubmit(View view) {
        ConnectivityManager connMgr = (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
            NetworkInfo networkInfo = connMgr.getActiveNetworkInfo();
            
            if (networkInfo != null && networkInfo.isConnected()) {
        		Intent intentCustomer = new Intent(this, RestaurantsPage.class);
        		Intent intentVendor = new Intent(this, VendorLandingPage.class);

        		boolean error = false;
        		StringBuffer errorLog = new StringBuffer();
        		email = (EditText) findViewById(R.id.editText1_2b);
        		password = (EditText) findViewById(R.id.editText2_2b);

        		errorLog.append("Please Enter: ");
        		if (email.getText().toString().matches("")) {
        			errorLog.append("Email ");
        			error = true;
        		}
        		if (password.getText().toString().matches("")) {
        			errorLog.append("Password ");
        			error = true;
        		}

        		if (error == false) {// All user input entered
        			
        		    // Create a new HttpClient and Post Header
        		    HttpClient httpclient = new DefaultHttpClient();
        		    HttpPost httppost = new HttpPost("http://" + getString(R.string.server_domain_name) + "/FoodLine/login.php");

        		    try {
        		    	//extract values
        		    	emailString = email.getText().toString();
        		    	passwordString = password.getText().toString();
        		    	
        		    	/*
        		    	//Encrypt Password
        				String K = StringConstants.getK0().concat(StringConstants.getK1().concat(StringConstants.getK2()));				
        			    AES.setKey(K);
        				AES.encrypt(passwordString);
        				String encryptedPassword = AES.getEncryptedString();
        		    	 */
        		    	
        		        List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
        		        nameValuePairs.add(new BasicNameValuePair("email", emailString));
        		        nameValuePairs.add(new BasicNameValuePair("pass", passwordString));
        		        httppost.setEntity(new UrlEncodedFormEntity(nameValuePairs));

        		        // Execute HTTP Post Request
        		        HttpResponse response = httpclient.execute(httppost);
        		        BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));

        		        String line = "";
        		        String serverStringFetched = "";
        		        while ((line = rd.readLine()) != null) {
        		        	serverStringFetched = line;
        		        }
        		        try {
							JSONObject userJSON = new JSONObject(serverStringFetched);
							
							if(userJSON.getString("status").equals("1")){
								user = User.getInstance();
								JSONObject userMainValsJSON = userJSON.getJSONObject("data");
								user.setUserID(Integer.parseInt(userMainValsJSON.getString("userID")));
								user.setFirstName(userMainValsJSON.getString("firstname"));
								user.setLastName(userMainValsJSON.getString("lastname"));
								user.setPhoneNumber(userMainValsJSON.getString("phonenumber"));
								user.setUniqueSessionID(userJSON.getString("session"));
								user.setEmailAddress(userMainValsJSON.getString("email"));
								user.setPhotoUrl(userMainValsJSON.getString("photoURL"));
								user.setIsVendor(Integer.parseInt(userMainValsJSON.getString("vendorID")));
							}else{
								ErrorHandlingServices.LoginCredentialFailureError(this, errorLog.toString());
								return;
							}
						} catch (JSONException e) {
							ErrorHandlingServices.JSONError(this);
							return;
						}
        		        if(user.getIsVendor() == 0){
            				startActivity(intentCustomer);
        		        }else if(user.getIsVendor() > 0){
            				startActivity(intentVendor);
        		        }
        		    }  catch (IOException e) {
        		    }
        		} else {
        			// User missed something
        			ErrorHandlingServices.NoInputEnteredUserInputError(this);
        		}
            } else {
            	ErrorHandlingServices.NoConnectionFoundError(this);
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
			View rootView = inflater.inflate(
					R.layout.fragment_food_line_login_page, container, false);
			return rootView;
		}
	}

}
