<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<h2>Student TM Sign Up Details</h2>

<c:choose>
	<c:when test="${empty tmHistories}">
	No record of TM histories found.
 </c:when>
	<c:otherwise>

		<table id="product-table">
			<tr>
				<th class="table-header-check"><a id="toggle-all"></a></th>
				<th class="table-header-repeat line-left"><a href="#">#</a></th>
				<th class="table-header-repeat line-left"><a href="#">Checking Type</a></th>
				<th class="table-header-repeat line-left"><a href="#">SignUp Date</a></th>
				<th class="table-header-repeat line-left"><a href="#">Checking Date</a></th>
				<th class="table-header-repeat line-left"><a href="#">Building</a></th>
				<th class="table-header-repeat line-left"><a href="#">Room</a></th>
				<th class="table-header-repeat line-left"><a href="#">SignUp By</a></th>
				<th class="table-header-repeat line-left"><a href="#">Status</a></th>
				
			</tr>
			<tbody>
				<c:forEach items="${tmHistories}" var="tmHistory" varStatus="count">
					<tr id="row-${tmHistory.id}">
						<td><input type="checkbox" /></td>
						<td>${count.count}</td>
						<td>${tmHistory.checkingType}</td>
					<td><fmt:formatDate pattern="MMM dd, yyyy hh:mm a" 
							value="${tmHistory.signUpDate}" /></td>
					<td><fmt:formatDate pattern="MMM dd, yyyy hh:mm a"
								value="${tmHistory.checkedDate}" /></td>
					<td>${tmHistory.room.building.buildingName}</td>
					<td>${tmHistory.room.roomNumber}</td>
					<td>${tmHistory.student.user.name}</td>
					<td>${tmHistory.status}</td>					
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:otherwise>
</c:choose>
	