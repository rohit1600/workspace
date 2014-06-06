package edu.cmu.andrew.rohitraj;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.*;

@SuppressWarnings("serial")
public class WeatherAppServlet extends HttpServlet {
	
	StockModel sm=null;
	
    @Override
	public void init(){
		sm=new StockModel();
	}
	
    @Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		
		String stock=(String) req.getParameter("stock");
		//String location="Pittsburgh";
                System.out.println("stock " +stock);
		sm.doSearch(stock);
		resp.setContentType("text/xml");
		PrintWriter out = resp.getWriter();
		out.println("<?xml version=\"1.0\"?>");
		out.println("<currentTemp>");
		out.println(sm.getCurrentPrice());
		out.println("</currentTemp>"); 
		
	}
}
