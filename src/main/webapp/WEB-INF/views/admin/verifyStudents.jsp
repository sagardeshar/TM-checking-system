<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript"
	src="<spring:url value="/resources/js/ajax.js"/>"></script>
<h2>Verification of New Students</h2>
<hr>

<form:form modelAttribute="newStudents" method="POST">
	<c:choose>
		<c:when test="${empty newStudents}">
	No new students are registered.
 </c:when>
		<c:otherwise>

			<table id="product-table">
				<tr>
					<th class="table-header-check"><a id="toggle-all"></a></th>
					<th class="table-header-repeat line-left"><a href="#">#</a></th>
					<th class="table-header-repeat line-left"><a href="#">Student
							Name</a></th>
					<th class="table-header-repeat line-left"><a href="#">Student
							ID</a></th>
					<th class="table-header-repeat line-left"><a href="#">Email</a></th>
					<th class="table-header-repeat line-left"><a href="#">Entry
							Year</a></th>
					<th class="table-header-repeat line-left"><a href="#">Entry
							Month</a></th>
					<th class="table-header-repeat line-left"><a href="#">Status</a></th>
					<th class="table-header-options line-left"><a href="#">Options</a></th>
				</tr>
				<tbody>
					<c:forEach items="${newStudents}" var="newStudent"
						varStatus="count">
						<tr id="row-${newStudent.id}">
							<td><input type="checkbox" /></td>
							<td>${count.count}</td>
							<td>${newStudent.user.name}</td>
							<td>${newStudent.studentId}</td>
							<td>${newStudent.user.email}</td>
							<td>${newStudent.entryYear}</td>
							<td>${newStudent.entryMonth}</td>
							<td><form:select id="statusType" path="">
									<form:options items="${statusType}" />
								</form:select></td>
							<td><a
								href="<spring:url value="/admin/student/delete/${newStudent.id}" />"
								title="Delete" class="icon-2 info-tooltip"
								onclick="return confirm('Are you sure to delete this student?')"></a><a
								href="#" title="Change Status"
								onclick="changeStudentStatus(${newStudent.id})"
								class="icon-5 info-tooltip"></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:otherwise>
	</c:choose>
</form:form>
