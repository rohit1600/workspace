package edu.cmu;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.BufferedHttpEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import android.app.Activity;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.StrictMode;
import android.widget.TextView;

public class TestandroidActivity extends Activity {
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);
        TextView txt = (TextView) findViewById(R.id.textView1);
        txt.setText(getPage());
        
    }
    private AsyncTask<String, String, String> getPage() {
    	 async a=new async();
    	 return async.execute(new String[]{"" ,"","" });
    	
    	//return str;
    }
}

class async extends AsyncTask<String,String,String>{

	@Override
	protected String doInBackground(String... params) {
		String str = "***";
		String total = null;

        try
    	{
    		HttpClient hc = new DefaultHttpClient();
    		HttpPost post = new HttpPost("http://www.rohitswebapp.appspot.com");

    		HttpResponse rp = hc.execute(post);

    		HttpEntity ht = rp.getEntity();

            BufferedHttpEntity buf = new BufferedHttpEntity(ht);

            InputStream is = buf.getContent();

            BufferedReader r = new BufferedReader(new InputStreamReader(is));

            
            //String str;
            while ((str = r.readLine()) != null) {
                total=total+str;
            }
    	}catch(Exception e){
    		
    		str="excetion: " +e.toString();
    	}
		return total;
		
	}
	
}

