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
	<div id="main">
		<!-- Header -->
		<%@ include file="../common/nav.jsp"%>

		<!-- Content -->
		<div id="content">
			<!-- Sidebar -->
			<%@ include file="../common/sidebar.jsp"%>
			<!-- Main -->
			<div id="main"
				class="p-0 d-flex flex-column justify-content-between align-items-center">
				<div class="content-item w-100 pl-3 pr-3">
					<div class="col-12 p-0">
						<div class="app-content">
							<div class="app-title">
								<ul class="app-breadcrumb breadcrumb side">
									<li class="breadcrumb-item active"><a href="#"><b>Contact
												list</b></a></li>
								</ul>
							</div>
							<div class="row m-0 p-0">
								<div class="col-12 m-0 p-0">
									<div class="tile">
										<div class="tile-body">
											<div class="row element-button justify-content-between p-3">
												<form class="mb-2 d-flex seach align-items-center">
													<input type="text" class="form-control"
														placeholder="Search by Full Name, Email, or Subject"
														name="keyword" value="${keyword}">
													<div class="input-group-appenda ml-2">
														<button class="btn btn-outline-secondary" type="submit">Search</button>
												</form>

											</div>
											<table
												class="table table-hover table-bordered js-copytextarea"
												cellpadding="0" cellspacing="0" border="0" id="sampleTable">
												<thead>
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
															<td class="text-center" style="font-size: 20px">${contact.replied == false ? '<p class=" text-success m-0">Enable</P>' : '<p class="text-danger m-0"Disable</p>'}</td>
															<td>
																<!-- Edit button --> <a
																href="${pageContext.request.contextPath}/admin/contacts/${contact.contactId}"
																class="btn btn-primary btn-sm trash ">View</a> <!-- Reply button -->
																<a
																href="${pageContext.request.contextPath}/admin/contacts/reply/${contact.contactId}"
																class="btn btn-primary btn-sm edit">Reply</a>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<!-- Pagination -->

											<div>
												<ul class="pagination">
													<li
														class="page-item ${products.number == 0 ? 'disabled' : ''}">
														<a class="page-link" href="?pageNo=1&keyword=${keyword}">First</a>
													</li>
													<c:forEach var="i"
														begin="${(products.number - 1) ge 0 ? products.number - 1 : 0}"
														end="${(products.number + 1) le products.totalPages - 2 ? (products.number + 1) : Math.max(0, products.totalPages - 1)}"
														varStatus="loop">
														<li
															class="page-item ${i == products.number ? 'active' : ''}">
															<a class="page-link"
															href="?pageNo=${i + 1}&keyword=${keyword}"> ${i + 1}
														</a>
														</li>
													</c:forEach>
													<li
														class="page-item ${products.number == Math.max(0, products.totalPages - 1 ) ? 'disabled' : ''}">
														<a class="page-link"
														href="?pageNo=${products.totalPages}&keyword=${keyword}">Last</a>
													</li>
												</ul>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../common/foot.jsp"%>

</body>
</html>


<style>
:root {
	--primary-color: #82ae46;
	--text-color: #f8f9fa;
}

li a:hover {
	text-decoration: none;
}

.btn {
	background-color: var(--primary-color);
	border: 0;
	color: white !important;
}

li a b {
	color: var(--primary-color);
}

.form-control {
	height: 30px !important;
}

.seach {
	font-weight: 600;
	white-space: nowrap;
	text-align: left;
	background: white;
	color: black;
	padding: 10px;
	border-radius: 0.357rem;
	border: 1px solid #ddd;
	border-radius: 0.357rem;
}

.element-button div a:hover {
	background-color: gray;
}

.table-td-center .btn:hover {
	background-color: gray;
	color: black;
}

.owl-dots {
	text-align: center;
}
</style>