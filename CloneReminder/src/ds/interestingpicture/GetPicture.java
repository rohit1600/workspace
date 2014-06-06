package ds.interestingpicture;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Random;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;

/*
 * This class provides capabilities to search for an image on Flickr.com given a search term.  The method "search" is the entry to the class.
 * Network operations cannot be done from the UI thread, therefore this class makes use of an AsyncTask inner class that will do the network
 * operations in a separate worker thread.  However, any UI updates should be done in the UI thread so avoid any synchronization problems.
 * onPostExecution runs in the UI thread, and it calls the ImageView pictureReady method to do the update.   
 * 
 */
public class GetPicture {
	InterestingPicture ip = null;
	
	/*
	 * search is the public GetPicture method.  Its arguments are the search term, and the InterestingPicture object that called it.  This provides a callback
	 * path such that the pictureReady method in that object is called when the picture is available from the search.
	 */
	public void search(String searchTerm, InterestingPicture ip) {
		this.ip = ip;
		new AsyncFlickrSearch().execute(searchTerm);
	}

	/*
	 * AsyncTask provides a simple way to use a thread separate from the UI thread in which to do network operations.
	 * doInBackground is run in the helper thread.
	 * onPostExecute is run in the UI thread, allowing for safe UI updates.
	 */
    private class AsyncFlickrSearch extends AsyncTask<String, Void, Bitmap> {
        protected Bitmap doInBackground(String... urls) {
            return search(urls[0]);
        }

        protected void onPostExecute(Bitmap picture) {
        	ip.pictureReady(picture);
        }

        /* 
         * Search Flickr.com for the animal argument, and return a Bitmap that can be put in an ImageView
         */
        private Bitmap search(String animal) {        
    	      String pictureURL = null;
    	      Document doc = getRemoteXML("http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=a888089c7a3a1371c004092e446784a8&is_getty=true&&tag_mode=all&tags=animal,"+animal);
    	      NodeList nl = doc.getElementsByTagName("photo"); 
    	      if (nl.getLength() == 0) {
    	        	return null; // no pictures found
    	       } else {
    	        	int pic = new Random().nextInt(nl.getLength()); //choose a random picture
    	        	Element e = (Element) nl.item(pic);
    	        	String farm = e.getAttribute("farm");
    	        	String server = e.getAttribute("server");
    	        	String id = e.getAttribute("id");
    	        	String secret = e.getAttribute("secret");
    	        	pictureURL = "http://farm"+farm+".static.flickr.com/"+server+"/"+id+"_"+secret+"_z.jpg";
    	        } 
    	      // At this point, we have the URL of the picture that resulted from the search.  Now load the image itself.
    	        try {
    	            	URL u = new URL(pictureURL);            	            	
    	            	return getRemoteImage(u);
    	            } catch (Exception e) {
    	                e.printStackTrace();
    	                return null; // so compiler does not complain
    	          }

        }
        
        /* 
         * Given a url that will request XML, return a Document with that XML, else null
         */
        private Document getRemoteXML(String url) {
        	 try {
	                DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
	                DocumentBuilder db = dbf.newDocumentBuilder();
	                InputSource is = new InputSource(url);
	                return db.parse(is);
	        } catch (Exception e) {
	        	System.out.print(e);
	        	return null;
	        }
        }
        
        /*
         * Given a URL referring to an image, return a bitmap of that image 
         */
        private Bitmap getRemoteImage(final URL url) {
            try {
                final URLConnection conn = url.openConnection();
                conn.connect();
                BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
                Bitmap bm = BitmapFactory.decodeStream(bis);
                bis.close();
                return bm;
            } catch (IOException e) {
                e.printStackTrace();
                return null;   
            }
        }
    }
}