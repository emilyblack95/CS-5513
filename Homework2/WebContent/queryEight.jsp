<%@page import="java.sql.ResultSet"%>
<%@page import="CS5513.DataHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
			<title>Nurses</title>
	</head>
	<body>
		<h2 align="center">
			CS5513 Web Application
		</h2>
		<h3 align="center">
			All nurses who tend to patients that are given a certain medicine.
		</h3>
		<h3 align="center">
			<jsp:useBean id="empsbean" class="CS5513.DataHandler" scope="session"/>
		</h3>
		<form action="queryEightAction.jsp">
			<div align="center">
				<p>&nbsp;</p>
				<table cellspacing="2" cellpadding="3" border="1" width="369">
					<tr>
						<td width="38%">
							<strong>Medicine's Code:</strong>
						</td>
						<td width="62%">
							<input type="text" name="code"/>
						</td>
					</tr>
				</table>
				<table cellspacing="3" cellpadding="2" border="0">
					<tr>
						<td>
							<input type="submit" name="insertbutton" value="Find Nurse(s)"/>
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