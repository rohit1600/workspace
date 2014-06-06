/**
 * Author: Rohit Rajagopal Last Modified: Mar 19, 2012
 * 
 * This program is to perform the network operation in a separate thread
 * The webapp is accessed using the URL and the html code is parsed to get the result
 * 
 */
package edu.cmu;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import android.os.AsyncTask;

public class P5T5Model {
	P5T5Activity p = null;
	
	/*
	 * doRemoteTransaction is the public P5T5Model method.  Its arguments is the P5T5Activity object that called it.  This provides a callback
	 * path such that the displayResult method in that object is called when the result is available from the transaction.
	 */
	public void doRemoteTransaction(P5T5Activity p) {
		this.p = p;
		//passing a dummy argument
		new AsyncTransaction().execute("");
	}

	/*
	 * AsyncTask provides a simple way to use a thread separate from the UI thread in which to do network operations.
	 * doInBackground is run in the helper thread.
	 * onPostExecute is run in the UI thread, allowing for safe UI updates.
	 */
    private class AsyncTransaction extends AsyncTask<String, Void, String> {
        protected String doInBackground(String... urls) {
            return doRemoteTransaction(urls[0]);
        }

        protected void onPostExecute(String result) {
        	p.displayResult(result);
        }

        /**
         * method to perform the transaction by accessing the webapp in task4 with the URL
         * the argument string is a dummy and is not used
         * @param x
         * @return
         */
        public String doRemoteTransaction(String x){
        	String page=null;
        	String str=null;
        	int startfarm=0,endfarm=0;
        	String result=null;
        	try{
        		//car_id and plane_id and hotel_id are chosen for pittsburgh Hilton, American Airline and Pitt Car rental
        		URL url = new URL("http://10.0.2.2:8080/P5T3WebServiceWebApplicationClientProject/P5T3WebServiceClientServlet?hotel=1&num_rooms=1&car=2&num_cars=1&plane=2&num_seats=1&submit=Submit");
        		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        		BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        		//get the html code of the URL
        		while ((str = in.readLine()) != null) {
        			// str is one line of text; readLine() strips the newline character(s)
        			page += str;
        		}
        		in.close();
        		//extract the result from the html page
        		startfarm=page.indexOf("<p>");
        		endfarm=page.indexOf("</p>");
        		result=page.substring(startfarm+3,endfarm);
        	} catch (MalformedURLException e) {
        		System.out.println("malform");
        	} catch (IOException e) {
        		System.out.println("IOEx");
        		e.printStackTrace();
        	}
        	//return the result
        	return result;
        }
        
    }
}