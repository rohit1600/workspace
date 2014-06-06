
package edu.cmu.andrew.rohitraj;



import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class PalinServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String search= (String) request.getParameter("pal");

        if(search==null){
        	search=" ";
        }
        // determine what type of device our user is
        String ua = request.getHeader("User-Agent");
        out.println("<meta property=\"fb:admins\" content=\"553955766\" />");
        // use model to do the search and choose the result view
        if (ua != null && ua.indexOf("Android") != -1) {
            out.println("<!DOCTYPE html PUBLIC \"-//WAPFORUM//DTD XHTML Mobile 1.0//EN\" \"http://www.wapforum.org/DTD/xhtml-mobile10.dtd\">");
        } else {
            out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">");
        }     
        String palin=search;
        char[] x= palin.toCharArray();
        int length=palin.length();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Palindrome</title>");            
        out.println("</head>");
        out.println("<body>");
        //out.println("<div id=\"fb-root\"></div><script>  window.fbAsyncInit = function() {    FB.init({      appId      : 'YOUR_APP_ID', // App ID      channelUrl : '//WWW.YOUR_DOMAIN.COM/channel.html', // Channel File      status     : true, // check login status      cookie     : true, // enable cookies to allow the server to access the session      xfbml      : true  // parse XFBML    });    // Additional initialization code here  };  // Load the SDK Asynchronously  (function(d){     var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];     if (d.getElementById(id)) {return;}     js = d.createElement('script'); js.id = id; js.async = true;     js.src = \"//connect.facebook.net/en_US/all.js\";     ref.parentNode.insertBefore(js, ref);   }(document));</script>");
        //out.println("<div class=\"fb-like\" data-href=\"http://www.rohitswebapp.appspot.com\" data-send=\"true\" data-width=\"450\" data-show-faces=\"true\"></div>");
        String result="a Palindrome";
        
        //check if string is not palindrome
        for (int i=0; i<length/2;i++){
            if(x[i]!=x[length-1-i]){
                result= "Not a Palindrome";
                break;
            }
        }
        if(search!=" "){
            out.println("<h1>\"" + palin + "\" is " +result + "</h1><br><br>");
        }
        out.println("<form action=\"palin\" method=\"GET\">");
        out.println("Enter Another String");
        out.println("<input type=\"text\" name=\"pal\">");
        out.println("<input type=\"submit\" value=\"submit\">");
        out.println("<input type=\"hidden\" name=\"screen\" value=1>");
        out.println("</form>");
        out.println("</body>");
        out.println("</html>");
        out.close();
    }
}
