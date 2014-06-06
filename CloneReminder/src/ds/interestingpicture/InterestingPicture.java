package ds.interestingpicture;

import android.app.Activity;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;

/*
 * Because this application needs access to the Internet, you need to add the appropriate permissions to the Android manifest file. 
 * Open the AndroidManifest.xml file and add the following as a child of the <manifest> element:
 * <uses-permission android:name="android.permission.INTERNET" />
 */

public class InterestingPicture extends Activity {
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        /*
         * The click listener will need a reference to this object, so that upon successfully finding a picture from Flickr, it 
         * can callback to this object with the resulting picture Bitmap.  The "this" of the OnClick will be the OnClickListener, not
         * this InterestingPicture. 
         */
        final InterestingPicture ip = this;
        
        /*
         * Find the "submit" button, and add a listener to it
         */
        Button submitButton = (Button)findViewById(R.id.submit);
        

        
      	// Add a listener to the send button
        submitButton.setOnClickListener(new OnClickListener(){
        	public void onClick(View viewParam) {
        		String searchTerm = ((EditText)findViewById(R.id.searchTerm)).getText().toString();
        		GetPicture gp = new GetPicture();
        		gp.search(searchTerm, ip); // Done asynchronously in another thread.  It calls ip.pictureReady() in this thread when complete.
        	}
        });
    }
    
    /* 
     * This is called by the GetPicture object when the picture is ready.  This allows for passing back the Bitmap picture for updating the ImageView
     */
    public void pictureReady(Bitmap picture) {
		ImageView pictureView = (ImageView)findViewById(R.id.interestingPicture);
		TextView searchView = (EditText)findViewById(R.id.searchTerm);
		TextView message=(TextView)findViewById(R.id.message);
		if (picture != null) {
    		pictureView.setImageBitmap(picture);
    		message.setText("Here is a picture of a "+searchView.getText());
    	} else {
    		pictureView.setImageResource(R.drawable.icon);
    		message.setText("Sorry, I could not find a picture of a "+searchView.getText());
    	}
		searchView.setText("");
		pictureView.invalidate();
    }
}