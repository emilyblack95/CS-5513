<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Delete a patient record</title>
	</head>
	<body>
		<h2 align="center">
			CS5513: Emily Black's Homework 2
		</h2>
		<h3 align="center">
			Delete all the patients who have not been assigned a room.
		</h3>
		<h3 align="center">
			<jsp:useBean id="empsbean" class="CS5513.DataHandler" scope="session"/>
		</h3>
		<form action="queryTenAction.jsp">
			<div align="center">
				<p>&nbsp;</p>
				<table cellspacing="3" cellpadding="2" border="0">
					<tr>
						<td>
							<input type="submit" name="deletebutton" value="Delete Patient(s)"/>
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