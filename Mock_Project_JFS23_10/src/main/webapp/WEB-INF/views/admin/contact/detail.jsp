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
	<div id="">
		<!-- Header -->
		<%@ include file="../common/nav.jsp"%>

		<!-- Content -->
		<div id="content">
			<!-- Sidebar -->
			<%@ include file="../common/sidebar.jsp"%>
			<div id="main "
				class="p-0 d-flex flex-column justify-content-between align-items-center">
				<div class="content-item w-100 pl-3 pr-3">
					<div class="row">
						<div class="col-md-12">
							<div class="tile mb-3">
								<div class="app-title">
									<ul class="app-breadcrumb breadcrumb side">
										<li class="breadcrumb-item active"><a href="#"><b>Contact
													Detail</b></a></li>
									</ul>
								</div>
								<div class="tile-body">

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
										type="button" class="btn btn-primary btn-cancel">Back to Contacts</a>


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

.seach {
	font-weight: 600;
	white-space: nowrap;
	text-align: left;
	background: white;
	color: black;
	padding: 10px;
	margin: 0 15px;
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

.form-control {
	height: 40px !important;
}

.btn-cancel:hover {
	background-color: gray;
}
</style>
