<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>Admin - Edit Discount</title>
<%@ include file="../common/head.jsp"%>
</head>
<body>
	<div id="main">
		<!-- Header -->
		<%@ include file="../common/head.jsp"%>

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
							<div class="row">
								<div class="col-md-12">
									<div class="tile mb-3">
										<div class="app-title">
											<ul class="app-breadcrumb breadcrumb side">
												<li class="breadcrumb-item active"><a href="#"><b>Edit
															Discount</b></a></li>
											</ul>
										</div>
										<div class="tile-body">
											<form:form action="" method="post" class="form-row"
												modelAttribute="addDiscountForm">
												<div class="row m-0 p-0">
													<div class="form-group col-12">
														<label for="userName" class="form-label font-weight-bold">Discount
															Percent</label>
														<form:input type="number" class="form-control"
															path="discountPercent" />
														<form:errors path="discountPercent" class="text-danger"></form:errors>
													</div>
													<div class="form-group col-12">
														<label for="startDiscountDate"
															class="form-label font-weight-bold">Start
															DiscountDate</label>
														<form:input type="date" class="form-control"
															path="startDiscountDate" />
														<form:errors path="startDiscountDate" class="text-danger"></form:errors>
													</div>

													<div class="form-group col-12">
														<label for="endDiscountDate"
															class="form-label font-weight-bold">End
															DiscountDate</label>
														<form:input type="date" class="form-control"
															path="endDiscountDate" />

														<form:errors path="endDiscountDate" class="text-danger"></form:errors>
													</div>
													<div class="col-12">

														<button type="submit" class="btn btn-success mr-3">Edit</button>
														<!-- Back -->
														<a
															href="${pageContext.request.contextPath}/admin/discount"
															type="button" class="btn btn-primary">Back to
															Discount List</a>
													</div>
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

.btn-cancel:hover {
	background-color: gray;
}
</style>
