/**
 * @author Sahil Gupta - sahilgupta5@hotmail.com
 * Copyright - Take authors permission before using any piece of the code.
 */

package com.foodline.controller;

import android.app.Activity;
import android.app.Fragment;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

public class LandingPage extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_landing_page);

		if (savedInstanceState == null) {
			getFragmentManager().beginTransaction()
					.add(R.id.container, new PlaceholderFragment()).commit();
		}
	}
	
	/** Called when the user clicks the Log In with FoodLine button */
	public void goToFoodLineLoginPage(View view) {
	    Intent intent = new Intent(this, LoginPage.class);
	    startActivity(intent);
	}
		
	/** Called when the user clicks the Log In with Facebook button */
	public void goToLoginWithFacebookPage(View view) {
	    Intent intent = new Intent(this, LoginPage.class);
	    startActivity(intent);
	}
	
	/** Called when the user clicks the Sign Up button */
	public void goToSignUpPage(View view) {
	    Intent intent = new Intent(this, SignUpPage.class);
	    startActivity(intent);
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
			View rootView = inflater.inflate(R.layout.fragment_landing_page,
					container, false);
			return rootView;
		}
	}

}
