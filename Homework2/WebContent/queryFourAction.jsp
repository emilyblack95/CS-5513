<%@page import="CS5513.DataHandler"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert a room record</title>
	</head>
	<body>
		<h2 align="center">
			CS5513: Emily Black's Homework 2
		</h2>
		<h3 align="center">
			Successfully updated the room table.
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
						rset = handler.queryFour(Integer.parseInt(request.getParameter("room_id")),
						request.getParameter("room_type"),
						Integer.parseInt(request.getParameter("pid")),
						Integer.parseInt(request.getParameter("eid")));
						
						out.println("<form action='goHomeAction.jsp' align='center'>");
						out.println("<div align='center'><p>&nbsp;</p>");
						out.println("<table cellspacing='2' cellpadding='3' border='1' width='100%'>");
						out.println("<tr>");
						out.println("<th>" + "Room ID" + "</th>");
						out.println("<th>" + "Room Type" + "</th>");
						out.println("</tr>");
						
						while (rset.next())
						{
							out.println("<tr>");
							out.println("<td align=\"center\">" +
							rset.getInt(1) + "</td><td align=\"center\"> " +
							rset.getString(2) + "</td>");
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