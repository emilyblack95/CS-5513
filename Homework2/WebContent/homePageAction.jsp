<%@page import="CS5513.DataHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	</head>
	<body>
		<%
			// Might need to make these buttons instead of input fields if throwing error
			if(request.getParameter("query1button") != null)
			{
				response.sendRedirect("queryOne.jsp");
			}
			else if(request.getParameter("query2button") != null)
			{
				response.sendRedirect("queryTwo.jsp");
			}
			else if(request.getParameter("query3button") != null)
			{
				response.sendRedirect("queryThree.jsp");
			}
			else if(request.getParameter("query4button") != null)
			{
				response.sendRedirect("queryFour.jsp");
			}
			else if(request.getParameter("query5button") != null)
			{
				response.sendRedirect("queryFive.jsp");
			}
			else if(request.getParameter("query6button") != null)
			{
				response.sendRedirect("querySix.jsp");
			}
			else if(request.getParameter("query7button") != null)
			{
				response.sendRedirect("querySeven.jsp");
			}
			else if(request.getParameter("query8button") != null)
			{
				response.sendRedirect("queryEight.jsp");
			}
			else if(request.getParameter("query9button") != null)
			{
				response.sendRedirect("queryNine.jsp");
			}
			else if(request.getParameter("query10button") != null)
			{
				response.sendRedirect("queryTen.jsp");
			}
			else if(request.getParameter("logoutbutton") != null)
			{
				response.sendRedirect("login.jsp");
			}
		%>
	</body>
</html>


 