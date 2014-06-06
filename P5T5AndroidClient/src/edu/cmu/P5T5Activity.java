/**
 * Author: Rohit Rajagopal Last Modified: Mar 19, 2012
 * 
 * This is the android activity program to format the display of the app
 * Program initializes a button and a text view to display the result
 * A call to the webapp in task4 is made via the P5T5 model object 
 * when the button is clicked. The html of the result page is received and 
 * parsed for the result
 * 
 * 
 */
package edu.cmu;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;

public class P5T5Activity extends Activity {
	/** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        Button submitButton = (Button)findViewById(R.id.submit);
        final P5T5Activity p=this;
        submitButton.setOnClickListener(new OnClickListener(){
        	public void onClick(View viewParam) {
        		
        		P5T5Model pm=new P5T5Model();
        		//to screenscrape the webapp html page
        		pm.doRemoteTransaction(p);
        		
        	}
        });
    }
    /**
     * this method is called from the model program to publish the result to 
     * the app screen
     * @param x
     */
    public void displayResult(String x){
    	TextView tv = (TextView)findViewById(R.id.result);
    	tv.setText(x);
    }
    
}