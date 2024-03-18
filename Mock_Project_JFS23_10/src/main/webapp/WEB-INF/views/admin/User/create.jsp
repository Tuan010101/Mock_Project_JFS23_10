<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>admin-User</title>
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
										<li class="breadcrumb-item active"><a href="#"><b>Create
													User</b></a></li>
									</ul>
								</div>
								<div class="tile-body">
									<form:form action="" method="post" class="form-row"
										modelAttribute="addUserForm">

										<div class="form-group col-3">
											<label for="userName" class="form-label font-weight-bold">User
												Name</label>
											<form:input type="text" class="form-control" path="userName" />
											<form:errors path="userName" class="text-danger"></form:errors>
										</div>
										<div class="form-group col-3">
											<label for="password" class="form-label font-weight-bold">Password</label>
											<form:input type="text" class="form-control" path="password" />
											<form:errors path="password" class="text-danger"></form:errors>
										</div>

										<div class="form-group col-3">
											<label for="email" class="form-label font-weight-bold">Email</label>
											<form:input type="text" class="form-control" path="email" />

											<form:errors path="email" class="text-danger"></form:errors>
										</div>
										<div class="form-group col-3">
											<label for="fullName" class="form-label font-weight-bold">Full
												Name</label>
											<form:input type="text" class="form-control"
												path="fullName" />
											<form:errors path="fullName" class="text-danger"></form:errors>
										</div>
										<div class="form-group col-3">
											<label for="address" class="form-label font-weight-bold">Address</label>
											<form:input type="text" class="form-control" path="address" />
											<form:errors path="address" class="text-danger"></form:errors>
										</div>
										<div class="form-group col-3">
											<label for="phoneNumber" class="form-label font-weight-bold">Phone
												Number</label>
											<form:input type="number" class="form-control"
												path="phoneNumber" />
											<form:errors path="phoneNumber" class="text-danger"></form:errors>
										</div>
										<div class="form-group col-3">
											<label for="verifyCode" class="form-label font-weight-bold">Verify
												Code</label>
											<form:input type="number" class="form-control"
												path="verifyCode" />
											<form:errors path="verifyCode" class="text-danger"></form:errors>
										</div>

										<div class="form-group col-3">
											<label for="roleId" class="form-label font-weight-bold">Role</label>
											<form:select class="form-control" path="roleId">
												<form:options items="${rolesMap}" />
											</form:select>


											<form:errors path="roleId" class="text-danger"></form:errors>
										</div>
										<div class="col-12">

											<button type="submit" class="btn btn-success mr-3">Create</button>
											<!-- Back -->
											<a href="${pageContext.request.contextPath}/admin/User"
												type="button" class="btn btn-primary">Back to User List</a>
										</div>



									</form:form>
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