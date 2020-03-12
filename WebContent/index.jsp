<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Interest Calculator</title>
</head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
	.containers{
        padding: 20px;
        background: #f2f2f2;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        border-radius: 5px;
	}
	.simple, .compound{
        padding: 20px;
        background: #f2f2f2;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        border-radius: 5px;
	}
	 input[type=text] {
	  width: 100%;
	  padding: 12px 20px;
	  margin: 8px 0;
	  display: inline-block;
	  border: 1px solid #ccc;
	  border-radius: 4px;
	  box-sizing: border-box;
	}
	input[type=number], select {
	  width: 45%;
	  padding: 12px 20px;
	  margin: 8px 0;
	  display: inline-block;
	  border: 1px solid #ccc;
	  border-radius: 4px;
	  box-sizing: border-box;
	}
	input[type=submit] {
	  width: 45%;
	  background-color: #4CAF50;
	  border: none;
	  color: white;
	  padding: 16px 32px;
	  text-decoration: none;
	  margin: 4px 2px;
	  cursor: pointer;
	}
	table {
		  font-family: arial, sans-serif;
		  border-collapse: collapse;
		  width: 100%;
		}
		
		td, th {
		  border: 1px solid #dddddd;
		  text-align: center;
		  padding: 8px;
		}
		
		tr:nth-child(even) {
		  background-color: #dddddd;
		}
</style>

	<script type="text/javascript">
		function validaion(){
			
			var checklprinciple = Number(document.getElementById("checklprinciple").value);
			if(isNaN(checklprinciple))
				{
				alert( "Please provide number" );
	            document.myForm.principle.focus();
	            return false;
				}
			
			var checkrate = Number(document.getElementById("checkrate").value);
			if(isNaN(checkrate))
				{
				alert( "Please provide number" );
	            document.myForm.rate.focus();
	            return false;
				}
			
			if(document.myForm.principle.value < 0){
				alert( "Please provide positive number" );
	            document.myForm.principle.focus() ;
	            return false;
			}
			
			if(document.myForm.rate.value < 0){
				alert( "Please provide positive number" );
	            document.myForm.rate.focus() ;
	            return false;
			}
			
			if(document.myForm.year.value < 0){
				alert( "Please provide positive number" );
	            document.myForm.year.focus() ;
	            return false;
			}
			
			var days = document.myForm.selecter.value == "days";
			var tenureInt = document.myForm.tenure.value <= 29;
			if(tenureInt && days)
				{
					alert("Please provide number like 30, 60, 90 - - - 365");
					document.myForm.tenure.focus() ;
		            return false;
				}
		}
	</script>
<body>
<div class="row">
	<div class="containers col-md-4">
		<h2 style="text-align:center;">SI & CI Calculator</h2>
		<form action="InterestController" method="post" name="myForm" onsubmit = "return(validaion());">
		
		
			<label>Principle Amount </label>
			<input type="text" name="principle" required="required" value="0" id="checklprinciple">
			<label>Rate % </label><br>
			<input type="text" name="rate" required="required" value="0" id="checkrate">
			<label>Tenure </label><br>
			
			<input type="number" name="tenure" value="0" id="check">
			<select name="selecter">
				<option value="year" selected="selected">Year</option>
				<option value="month" >Month</option>
				<option value="days">Days</option>
			</select>
			
			<input type="submit" name="interesttype" value="Calculate Interest">
			
		</form>
		</div>
		
		<div class="simple col-md-4">
			<h2 style="text-align:center;">Simple Interest</h2>
			<table>
			  <tr>
			    <th>Month</th>
			    <th>Principle</th>
			    <th>Interest</th>
			    <th>Current Amount</th>
			  </tr>
			  
			  <c:forEach items="${simple}" var="s"> 
				  <tr>
				    <td>${s.getMonth()}</td>
					<td>${s.getPrincipal()}</td>
					<td>${s.getInterest()}</td>
					<td>${s.getCurr_principal()}</td>
				  </tr>
			  </c:forEach>
			</table>	
		</div>
		
		<div class="compound col-md-4">
		<h2 style="text-align:center;">Compound Interest</h2>
			<table>
			  <tr>
			    <th>Month</th>
			    <th>Principle</th>
			    <th>Interest</th>
			    <th>Current Amount</th>
			  </tr>
			  
			  <c:forEach items="${compound}" var="c"> 
				  <tr>
				    <td>${c.getMonth()}</td>
					<td>${c.getPrincipal()}</td>
					<td>${c.getInterest()}</td>
					<td>${c.getCurr_principal()}</td>
				  </tr>
			  </c:forEach>
			</table>	
		</div>
		
		<%-- <div class="compound col-lg-4">
		<h2 style="text-align:center;">Compare</h2>
			<table>
			  <tr>
			    <th>Month</th>
			    <th>Simple-Interest</th>
			    <th> Simple Current Amount</th>
			    <th>Compound-Interest</th>
			    <th> Compound Current Amount</th>
			  </tr>
			  
			  <c:forEach items="${simple}" var="s"> 
			  <c:forEach items="${compound}" var="c">
				  <tr>
				    <td>${s.getMonth()}</td>
					<td>${s.getInterest()}</td>
					<td>${s.getCurr_principal()}</td>
					<td>${c.getInterest()}</td>
					<td>${c.getCurr_principal()}</td>
				  </tr>
				  </c:forEach>
			</c:forEach>
			</table>	
		</div> --%>
	</div>
</body>
</html>