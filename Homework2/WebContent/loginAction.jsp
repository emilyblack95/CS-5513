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
			CS5513.DataHandler handler = new CS5513.DataHandler();
			
			if(handler.authenticateUser("jdbc:oracle:thin:@//oracle.cs.ou.edu:1521/pdborcl.cs.ou.edu",
			request.getParameter("username"), request.getParameter("password"), request.getSession(true)) == true)
			{
				// Memorize any passed in user/password.
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				if (username != null && username.length() > 0) {
				  session.setAttribute("username", username);
				}
				if (password != null && password.length() > 0) {
					  session.setAttribute("password", password);
				}
				// Successfully autheticated
				RequestDispatcher req = request.getRequestDispatcher("homePage.jsp");
				req.include(request, response);
			}
			else
			{
				// Failed to autheticate
				RequestDispatcher req = request.getRequestDispatcher("login.jsp");
				req.include(request, response);
			}
		%>
	</body>
</html>