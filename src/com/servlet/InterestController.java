package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/InterestController")
public class InterestController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		InterestProvider interestType = new InterestProvider();
		RequestDispatcher rd;
		HttpSession session = request.getSession();
		int principal = Integer.parseInt(request.getParameter("principle"));
		double rate = Double.parseDouble(request.getParameter("rate"));
		int tenure = Integer.parseInt(request.getParameter("tenure"));
		int month;
		List<InterestBean> simplelist, compoundlist;
		if(request.getParameter("selecter").equals("year"))
		{
			month = 12 * tenure;
		}
		else if(request.getParameter("selecter").equals("days"))
		{
			month = (int) (tenure * 0.0338767);
		}
		else
		{
			month =tenure;
		}
			simplelist = new ArrayList<InterestBean>();
			simplelist = interestType.simpleInterestProviderByMonth(principal, rate, month);
			session.setAttribute("simple", simplelist);
			
			compoundlist = new ArrayList<InterestBean>();
			compoundlist = interestType.compoundInterestProvider(principal, rate, month);
			session.setAttribute("compound", compoundlist);
			
			rd = request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
		
	}
}
