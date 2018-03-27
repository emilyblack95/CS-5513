<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"  session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert a medicine record</title>
	</head>
	<body>
		<h2 align="center">
			CS5513: Emily Black's Homework 2
		</h2>
		<h3 align="center">
			Insert the complete information for a medicine and associate it with a patient.
		</h3>
		<h3 align="center">
			<jsp:useBean id="empsbean" class="CS5513.DataHandler" scope="session"/>
		</h3>
		<form action="queryFiveAction.jsp">
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
					<tr>
						<td width="38%">
							<strong>Medicine's Name:</strong>
						</td>
						<td width="62%">
							<input type="text" name="medicine_name"/>
						</td>
					</tr>
					<tr>
						<td width="38%">
							<strong>Patient's ID:</strong>
						</td>
						<td width="62%">
							<input type="text" name="pid"/>
						</td>
					</tr>
					<tr>
						<td width="38%">
							<strong>Patient's Quantity:</strong>
						</td>
						<td width="62%">
							<input type="text" name="quantity"/>
						</td>
					</tr>
				</table>
				<table cellspacing="3" cellpadding="2" border="0">
					<tr>
						<td>
							<input type="submit" name="insertbutton" value="Insert Medicine"/>
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