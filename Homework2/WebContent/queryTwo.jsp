<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert a nurse record</title>
	</head>
	<body>
		<h2 align="center">
			CS5513: Emily Black's Homework 2
		</h2>
		<h3 align="center">
			Insert the complete information for a nurse.
		</h3>
		<h3 align="center">
			<jsp:useBean id="empsbean" class="CS5513.DataHandler" scope="session"/>
		</h3>
		<form action="queryTwoAction.jsp">
			<div align="center">
				<p>&nbsp;</p>
				<table cellspacing="2" cellpadding="3" border="1" width="369">
					<tr>
						<td width="38%">
							<strong>Nurse's Employee ID:</strong>
						</td>
						<td width="62%">
							<input type="text" name="eid"/>
						</td>
					</tr>
					<tr>
						<td width="38%">
							<strong>Nurse's Salary:</strong>
						</td>
						<td width="62%">
							<input type="text" name="salary"/>
						</td>
					</tr>
					<tr>
						<td width="38%">
							<strong>Nurse's Sex:</strong>
						</td>
						<td width="62%">
							<input type="text" name="e_sex"/>
						</td>
					</tr>
					<tr>
						<td width="38%">
							<strong>Nurse's Name:</strong>
						</td>
						<td width="62%">
							<input type="text" name="e_name"/>
						</td>
					</tr>
					<tr>
						<td width="38%">
							<strong>Nurse's Contact Number:</strong>
						</td>
						<td width="62%">
							<input type="text" name="e_contact_no"/>
						</td>
					</tr>
					<tr>
						<td width="38%">
							<strong>Nurse's Street:</strong>
						</td>
						<td width="62%">
							<input type="text" name="street"/>
						</td>
					</tr>
					<tr>
						<td width="38%">
							<strong>Nurse's City:</strong>
						</td>
						<td width="62%">
							<input type="text" name="city"/>
						</td>
					</tr>
					<tr>
						<td width="38%">
							<strong>Nurse's State:</strong>
						</td>
						<td width="62%">
							<input type="text" name="state"/>
						</td>
					</tr>
					<tr>
						<td width="38%">
							<strong>Nurse's Zipcode:</strong>
						</td>
						<td width="62%">
							<input type="text" name="zipcode"/>
						</td>
					</tr>
					<tr>
						<td width="38%">
							<strong>Nurse's Level:</strong>
						</td>
						<td width="62%">
							<input type="text" name="nurse_level"/>
						</td>
					</tr>
				</table>
				<table cellspacing="3" cellpadding="2" border="0">
					<tr>
						<td>
							<input type="submit" name="insertbutton" value="Insert Nurse"/>
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