/**
* Author: Rohit Rajagopal
* Last Modified: April 6, 2012
*
* Servlet to get requests from the Android app
* uses an MVC model
* responds with an xml 
**/
package edu.cmu.andrew.rohitraj;
import javax.servlet;

@SuppressWarnings("serial")
public class StockAppServlet extends HttpServlet {
	//model of the MVC
	StockModel sm=null;
	
	/**
	 * instantiates the model object
	 */
    @Override
	public void init(){
		sm=new StockModel();
	}
	
    /**
     * doGet method gets the stock parameter
     * calls the doSearch() method which contains logic to fetch the stock value
     * sends an xml as the response
     */
    @Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		//get the stock symbol
		String stock=(String) req.getParameter("stock");
		//String location="Pittsburgh";
        //System.out.println("stock " +stock);
		sm.doSearch(stock);
		
		//this is where the XML is sent as the response
		resp.setContentType("text/xml");
		PrintWriter out = resp.getWriter();
		out.println("<?xml version=\"1.0\"?>");
		out.println("<currentPrice>");
		out.println(sm.getCurrentPrice());
		out.println("</currentPrice>"); 
		
	}
}
