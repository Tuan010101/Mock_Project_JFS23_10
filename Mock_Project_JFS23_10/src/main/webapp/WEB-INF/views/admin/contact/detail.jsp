<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>Admin - Contact Detail</title>
<%@ include file="../common/head.jsp"%>
</head>
<body>

	<%@ include file="../common/nav.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<div class="col-2 p-0 bg-light">
				<%@ include file="../common/sidebar.jsp"%>
			</div>

			<div class="col-10 p-5">
				<!-- Top -->
				<div class="d-flex justify-content-between align-items-center mb-4">
					<h2>Contact Detail</h2>
					<!-- Reply button -->
					<a
						href="${pageContext.request.contextPath}/admin/contacts/reply/${contact.contactId}"
						class="btn btn-success">Reply</a>
				</div>
				<!-- Table -->
				<table class="table table-bordered">
					<tr>
						<td><b>Full Name:</b></td>
						<td>${contact.fullName}</td>
					</tr>
					<tr>
						<td><b>Email:</b></td>
						<td>${contact.email}</td>
					</tr>
					<tr>
						<td><b>Subject:</b></td>
						<td>${contact.subject}</td>
					</tr>
					<tr>
						<td><b>Message:</b></td>
						<td>${contact.message}</td>
					</tr>
					<tr>
						<td width="125px"><b>Created At:</b></td>
						<td>${contact.createdDate}</td>
					</tr>
				</table>
				<!-- Back -->
				<a href="${pageContext.request.contextPath}/admin/contacts"
					type="button" class="btn btn-primary">Back to Contacts</a>

			</div>
		</div>
	</div>

	<%@ include file="../common/foot.jsp"%>

</body>
</html>
