<%@page import="CS5513.DataHandler"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Queried for nurse(s)</title>
	</head>
	<body>
		<h2 align="center">
			CS5513: Emily Black's Homework 2
		</h2>
		<h3 align="center">
			Successfully queried for all nurses who tend to patients that are given a certain medicine.
		</h3>
		<h3 align="center">
			<jsp:useBean id="empsbean" class="CS5513.DataHandler" scope="session"/>
		</h3>
		<div align="center">
			<p>&nbsp;</p>
				<%
					ResultSet rset;
					CS5513.DataHandler handler = new CS5513.DataHandler();
					
					boolean auth = handler.authenticateUser("jdbc:oracle:thin:@//oracle.cs.ou.edu:1521/pdborcl.cs.ou.edu", session.getAttribute("username").toString(), session.getAttribute("password").toString(), request.getSession(true));
					
					if(request.getParameter("insertbutton") != null && auth == true)
					{
						rset = handler.queryEight(Integer.parseInt(request.getParameter("code")));
						
						out.println("<form action='goHomeAction.jsp' align='center'>");
						out.println("<div align='center'><p>&nbsp;</p>");
						out.println("<table cellspacing='2' cellpadding='3' border='1' width='100%'>");
						out.println("<tr>");
						out.println("<th>" + "Nurse's ID" + "</th>");
						out.println("<th>" + "Nurse's Salary" + "</th>");
						out.println("<th>" + "Nurse's Sex" + "</th>");
						out.println("<th>" + "Nurse's Name" + "</th>");
						out.println("<th>" + "Nurse's Contact No." + "</th>");
						out.println("<th>" + "Nurse's Street" + "</th>");
						out.println("<th>" + "Nurse's City" + "</th>");
						out.println("<th>" + "Nurse's State" + "</th>");
						out.println("<th>" + "Nurse's Zipcode" + "</th>");
						out.println("<th>" + "Nurse's Level" + "</th>");
						out.println("</tr>");
						
						while (rset.next())
						{
							out.println("<tr>");
							out.println("<td align=\"center\">" +
							rset.getInt(1) + "</td><td align=\"center\"> " +
							rset.getInt(2) + "</td><td align=\"center\"> " +
							rset.getString(3) + "</td><td align=\"center\"> " +
							rset.getString(4) + "</td><td align=\"center\"> " +
							rset.getString(5) + "</td><td align=\"center\"> " +
							rset.getString(6) + "</td><td align=\"center\"> " +
							rset.getString(7) + "</td><td align=\"center\"> " +
							rset.getString(8) + "</td><td align=\"center\"> " +
							rset.getInt(9) + "</td><td align=\"center\"> " +
							rset.getInt(10) + "</td>");
							out.println("</tr>");
						}
						
						out.println("</table>");
						out.println("<table cellspacing='2' cellpadding='3' border='0' width='100%'>");
						out.println("<tr>");
						out.println("<td><input type='submit' name='backbutton' value='Home'/></td>");
						out.println("</tr>");
						out.println("</table>");
						out.println("</div></form");
					}
					else if(request.getParameter("backbutton") != null)
					{
						response.sendRedirect("homePage.jsp");
					}
				%>
			<p>&nbsp;</p>
		</div>
	</body>
</html>