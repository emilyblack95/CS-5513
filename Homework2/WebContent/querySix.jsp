<%@page import="java.sql.ResultSet"%>
<%@page import="CS5513.DataHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
			<title>Patients</title>
	</head>
	<body>
		<h2 align="center">
			CS5513 Web Application
		</h2>
		<h3 align="center">
			All the patients who were in the hospital during a particular month of a particular year (e.g. during July of 2017).
		</h3>
		<h3 align="center">
			<jsp:useBean id="empsbean" class="CS5513.DataHandler" scope="session"/>
		</h3>
		<form action="querySixAction.jsp">
			<div align="center">
				<p>&nbsp;</p>
				<table cellspacing="2" cellpadding="3" border="1" width="369">
					<tr>
						<td width="38%">
							<strong>Month:</strong>
						</td>
						<td width="62%">
							<input type="text" name="month"/>
						</td>
					</tr>
					<tr>
						<td width="38%">
							<strong>Year:</strong>
						</td>
						<td width="62%">
							<input type="text" name="year"/>
						</td>
					</tr>
				</table>
				<table cellspacing="3" cellpadding="2" border="0">
					<tr>
						<td>
							<input type="submit" name="insertbutton" value="Find Patient(s)"/>
						</td>
						<td>
							<input type="submit" name="backbutton" value="Back"/>
						</td>
					</tr>
				</table>
				<p>
					&nbsp;
				</p>
			</div>
		</form>
	</body>
</html>