<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>Admin - User List</title>
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
									<li class="breadcrumb-item active"><a href="#"><b>User
												list</b></a></li>
								</ul>
							</div>
							<div class="row m-0 p-0">
								<div class="col-12 m-0 p-0">
									<div class="tile">
										<div class="tile-body">
											<div class="row element-button justify-content-between p-3">
												<div class="col-sm-2 d-flex align-items-center p-0">
													<a class="btn btn-add btn-sm p-2"
														href="${pageContext.request.contextPath}/admin/User/create"
														title="Thêm"><i class="fas fa-plus"></i> Create new
														User</a>
												</div>
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
														<th>User Name</th>
														<th>Email</th>
														<th>Full Name</th>
														<th>Address</th>
														<th>Phone Number</th>
														<th>Roles</th>

														<th>Action</th>


													</tr>
												<tbody>
													<c:forEach var="appUserPage" items="${appUserPage.content}"
														varStatus="status">
														<tr>
															<td>${status.index + 1}</td>
															<td>${appUserPage.username}</td>
															<td>${appUserPage.email}</td>
															<td>${appUserPage.fullName}</td>
															<td>${appUserPage.address}</td>
															<td>${appUserPage.phoneNumber}</td>
															<td><c:forEach var="userRole"
																	items="${appUserPage.userRoles}">
    ${userRole.roleId.roleName}<br />
																</c:forEach></td>
															<td class="table-td-center">
																<!-- Edit button --> <a
																href="${pageContext.request.contextPath}/admin/User/edit/${appUserPage.userId}"
																class="btn btn-primary btn-sm trash ">Edit</a> <!-- Delete button -->
																<%-- <a
																href="${pageContext.request.contextPath}/admin/products/delete/${product.productId}"
																class="btn btn-primary btn-sm edit">Delete</a> --%> <a
																class="btn btn-primary btn-sm">
																	<p class="m-0" data-toggle="modal"
																		data-target="#deleteModal${status.count}"
																		title="Delete">Delete</p>
																	<div id="deleteModal${status.count}" class="modal fade">
																		<div class="modal-dialog">
																			<div class="modal-content">
																				<form
																					action="/products/delete/${appUserPage.userId}"
																					method="post">
																					<div class="modal-header">
																						<h4 class="modal-title"
																							style="color: #0b0b0b !important;">Xóa sản
																							phẩm</h4>
																						<button type="button" class="close"
																							data-dismiss="modal" aria-hidden="true">&times;
																						</button>
																					</div>
																					<div class="modal-body">
																						<p class="text-dark">Bạn có chắc là xóa sản
																							phẩm có tên ${appUserPage.username} và id là
																							${appUserPage.userId} ?</p>
																						<p class="text-danger">
																							<small>Sản phẩm này sẽ không thể phục hồi
																								lại</small>
																						</p>
																					</div>
																					<div class="modal-footer">
																						<input type="button" class="btn btn-default"
																							data-dismiss="modal" value="Trở về"> <input
																							type="submit" class="btn btn-danger" value="Xóa">
																					</div>
																				</form>
																			</div>
																		</div>
																	</div>
															</a>
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