package com.servlet;

public class InterestBean {
	
	private long principal;
	private int interest;
	private int curr_principal;
	private int month;
	
	public InterestBean(int i, long principal2, double permonthinterest, int intialinterest) {
		this.month = i;
		this.principal = principal2;
		this.interest = (int) permonthinterest;
		this.curr_principal = intialinterest;
	}
	public long getPrincipal() {
		return principal;
	}
	public void setPrincipal(long principal) {
		this.principal = principal;
	}
	public int getInterest() {
		return interest;
	}
	public void setInterest(int interest) {
		this.interest = interest;
	}
	public int getCurr_principal() {
		return curr_principal;
	}
	public void setCurr_principal(int curr_principal) {
		this.curr_principal = curr_principal;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
}
