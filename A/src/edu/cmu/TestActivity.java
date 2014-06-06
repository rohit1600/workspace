package edu.cmu;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;

public class TestActivity extends Activity {
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        try {
        	HttpClient client = new DefaultHttpClient();
        	//String getURL = “http:192.168.1.5:8080/one/try.jsp”;
        	HttpGet get = new HttpGet("http://www.yahoo.com");
        	HttpResponse responseGet = client.execute(get);
        	HttpEntity resEntityGet = responseGet.getEntity();
        	if (resEntityGet != null) {
        	//do something with the response
        	//Log.i(“GET RESPONSE”,EntityUtils.toString(resEntityGet));

        	}
        	} catch (Exception e) {
        	TextView tv=new TextView(this);
        	tv.setText(e.getMessage());
        	setContentView(tv);

        	}
    }
}