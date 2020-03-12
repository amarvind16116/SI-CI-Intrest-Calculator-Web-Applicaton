package com.servlet;

import java.util.ArrayList;
import java.util.List;

/*
 * this class have two methods which provide the simple interest and compound interest
 */

public class InterestProvider {
	
	List<InterestBean> list;
	
	public List<InterestBean> simpleInterestProviderByMonth(long principal, double rate, int month)
	{
		list = new ArrayList<InterestBean>();
		double permonthinterest;
		int intialinterest = (int) principal;
		for(int i=1; i<=month; i++)
		{
			permonthinterest = (principal * rate * 1/12)/100;
			
			intialinterest = (int) (permonthinterest+intialinterest);
			
			list.add(new InterestBean(i, principal,  permonthinterest, intialinterest));
		}	
		return list;
	}
	
	public List<InterestBean> compoundInterestProvider(long principal, double rate, int month) {
		list = new ArrayList<InterestBean>();
		double permonthinterest;
		int intialinterest ;
		for(int i=1; i<=month; i++)
		{
			permonthinterest = (principal * rate * 1/12)/100;
			
			intialinterest = (int) (permonthinterest+principal);
			
			list.add(new InterestBean(i, principal,  permonthinterest, intialinterest));
			
			principal = intialinterest;
		}	
		return list;
	}
}
