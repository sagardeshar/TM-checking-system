<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript"
	src='<spring:url value="/resources/js/jquery-1.10.1.min.js" />'></script>
<script type="text/javascript"
	src='<spring:url value="/resources/js/ajax.js"/>'></script>
<title>Insert title here</title>
</head>
<body>
	<h1>Checking Details</h1>
	<div><c:if test="${message != null }">
		<c:out value="${message}"></c:out>
	</c:if> </div>
	<form:form commandName="availableEntry" action="add" method="POST">
		<table>
			<tr>
				<td colspan="2"><form:errors path="*" cssStyle="color:red;" /></td>
			</tr>
			<tr>
				<td>Buildings:</td>
				<td><form:select path="" id="building" onchange="showRooms()">
						<form:option value="" label="Select Building" />
						<c:forEach var="building" items="${buildings}">
							<form:option value="${building.id }">${building.buildingName }</form:option>
						</c:forEach>
					</form:select></td>
			</tr>
			<tr>
				<td>Rooms:</td>
				<td><form:select id="room" path="room.id">
						<form:option value="" label="Select Room" />
					</form:select></td>
			</tr>
			<tr>
				<td>Available Date:</td>
				<td><form:input path="checkingDate" placeholder="MM/DD/YYYY"/>
			</tr>
			<tr>
				<td>Time:</td>
				<td><form:select path="checkingTimes">
						<form:option value="10:00 AM" label="10:00 AM" />
						<form:option value="12:00 PM" label="12:00 PM" />
						<form:option value="12:30 PM" label="12:30 PM" />
						<form:option value="3:00 PM" label="3:00 PM" />
						<form:option value="3:30 PM" label="3:30 PM" />
						<form:option value="4:00 PM" label="4:00 PM" />
					</form:select>
			</tr>
			<tr>
				<td>Checking Type:</td>
				<td><form:select path="checkingType">
						<form:option value="" label="Select Checking Type" />
						<form:options items="${checkingtype}" />
					</form:select></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Add Checking Dates" /></td>
			</tr>
		</table>


	</form:form>
</body>
</html>