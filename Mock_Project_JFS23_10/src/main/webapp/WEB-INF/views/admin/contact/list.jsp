<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>Admin - Contact List</title>
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
					<h2>Contact List</h2>
					<form class="form-inline mb-3 ">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Search by Full Name, Email, or Subject"
								name="keyword" value="${keyword}">
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="submit">Search</button>
							</div>
						</div>
					</form>
				</div>
				<!-- Table -->
				<table class="table table-hover table-bordered">
					<thead class="thead-dark">
						<tr>
							<th>#</th>
							<th>Full Name</th>
							<th>Email</th>
							<th>Subject</th>
							<th>Message</th>
							<th>Created Date</th>
							<th>Replied</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="contact" items="${contacts.content}"
							varStatus="status">
							<tr>
								<td>${contacts.number * contacts.size + status.index + 1}</td>
								<td>${contact.fullName}</td>
								<td>${contact.email}</td>
								<td>${contact.subject}</td>
								<td>${contact.message}</td>
								<td>${contact.createdDate}</td>
								<td class="text-center" style="font-size: 20px">${contact.replied == true ? '<i class="icomoon icon-thumbs-up text-success"></i>' : '<i class="icomoon icon-thumbs-down text-danger"></i>'}</td>
								<td>
									<!-- Edit button --> <a
									href="${pageContext.request.contextPath}/admin/contacts/${contact.contactId}"
									class="btn btn-info">View</a> <!-- Reply button --> <a
									href="${pageContext.request.contextPath}/admin/contacts/reply/${contact.contactId}"
									class="btn btn-success">Reply</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<!-- Pagination -->
				<div>
					<ul class="pagination">
						<li class="page-item ${contacts.number == 0 ? 'disabled' : ''}">
							<a class="page-link" href="?pageNo=1&keyword=${keyword}">First</a>
						</li>
						<c:forEach var="i"
							begin="${(contacts.number - 1) ge 0 ? contacts.number - 1 : 0}"
							end="${(contacts.number + 1) le contacts.totalPages - 2 ? (contacts.number + 1) : contacts.totalPages - 1}"
							varStatus="loop">
							<li class="page-item ${i == contacts.number ? 'active' : ''}">
								<a class="page-link" href="?pageNo=${i + 1}&keyword=${keyword}">
									${i + 1} </a>
							</li>
						</c:forEach>
						<li
							class="page-item ${contacts.number == contacts.totalPages - 1 ? 'disabled' : ''}">
							<a class="page-link"
							href="?pageNo=${contacts.totalPages}&keyword=${keyword}">Last</a>
						</li>
					</ul>
				</div>

			</div>
		</div>
	</div>

	<%@ include file="../common/foot.jsp"%>

</body>
</html>
