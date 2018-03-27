<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert a patient record</title>
	</head>
	<body>
		<h2 align="center">
			CS5513: Emily Black's Homework 2
		</h2>
		<h3 align="center">
			Insert the complete information for a patient.
		</h3>
		<h3 align="center">
			<jsp:useBean id="empsbean" class="CS5513.DataHandler" scope="session"/>
		</h3>
		<form action="queryOneAction.jsp">
			<div align="center">
				<p>&nbsp;</p>
				<table cellspacing="2" cellpadding="3" border="1" width="369">
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
							<strong>Patient's Name:</strong>
						</td>
						<td width="62%">
							<input type="text" name="p_name"/>
						</td>
					</tr>
					<tr>
						<td width="38%">
							<strong>Patient's Sex:</strong>
						</td>
						<td width="62%">
							<input type="text" name="p_sex"/>
						</td>
					</tr>
					<tr>
						<td width="38%">
							<strong>Patient's Address:</strong>
						</td>
						<td width="62%">
							<input type="text" name="address"/>
						</td>
					</tr>
					<tr>
						<td width="38%">
							<strong>Patient's Contacts (separate by commas):</strong>
						</td>
						<td width="62%">
							<input type="text" name="contacts"/>
						</td>
					</tr>
					<tr>
						<td width="38%">
							<strong>Patient's Day Admitted:</strong>
						</td>
						<td width="62%">
							<input type="text" name="a_day"/>
						</td>
					</tr>
					<tr>
						<td width="38%">
							<strong>Patient's Month Admitted:</strong>
						</td>
						<td width="62%">
							<input type="text" name="a_month"/>
						</td>
					</tr>
					<tr>
						<td width="38%">
							<strong>Patient's Year Admitted:</strong>
						</td>
						<td width="62%">
							<input type="text" name="a_year"/>
						</td>
					</tr>
					<tr>
						<td width="38%">
							<strong>Patient's Day Discharged:</strong>
						</td>
						<td width="62%">
							<input type="text" name="d_day"/>
						</td>
					</tr>
					<tr>
						<td width="38%">
							<strong>Patient's Month Discharged:</strong>
						</td>
						<td width="62%">
							<input type="text" name="d_month"/>
						</td>
					</tr>
					<tr>
						<td width="38%">
							<strong>Patient's Year Discharged:</strong>
						</td>
						<td width="62%">
							<input type="text" name="d_year"/>
						</td>
					</tr>
				</table>
				<table cellspacing="3" cellpadding="2" border="0">
					<tr>
						<td>
							<input type="submit" name="insertbutton" value="Insert Patient"/>
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