<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>Admin - Discount List</title>
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
									<li class="breadcrumb-item active"><a href="#"><b>Bill
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
														placeholder="Full Name" name="keyword" value="${keyword}">
													<div class="input-group-appenda ml-2">
														<button class="btn btn-outline-secondary" type="submit">Search</button>
													</div>
												</form>

											</div>
											<table
												class="table table-hover table-bordered js-copytextarea"
												cellpadding="0" cellspacing="0" border="0" id="sampleTable">
												<thead>
													<tr>
														<th>#</th>
														<th>Full Name</th>
														<th>Address</th>
														<th>Phone Number</th>
														<th>Email</th>
														<th>Status</th>
														<th>Payment Method</th>
														<th>Buy Date</th>
														<th>Buy Time</th>
														<th>Product</th>
														<th>Action</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="bill" items="${bills.content}"
														varStatus="status">
														<tr>
															<td>${status.index + 1}</td>
															<td>${bill.fullName}</td>
															<td>${bill.address}</td>
															<td>${bill.phoneNumber}</td>
															<td>${bill.email}</td>
															<td><c:if test="${bill.status == 1}">
																	<p>Chờ xác nhận</p>
																</c:if> <c:if test="${bill.status == 2}">
																	<p>Chờ lấy hàng</p>
																</c:if> <c:if test="${bill.status == 3}">
																	<p>Đang giao</p>
																</c:if> <c:if test="${bill.status == 4}">
																	<p>Giao thành công</p>
																</c:if> <c:if test="${bill.status == 5}">
																	<p>Giao thất bại</p>
																</c:if> <c:if test="${bill.status == 6}">
																	<p>Hủy đơn</p>
																</c:if></td>
															<td>${bill.paymentMethod}</td>
															<td>${bill.buyDate}</td>
															<td>${bill.buyTime}</td>
															<td><c:if test="${not empty bill.userProducts}">
																	<c:forEach var="product" items="${bill.userProducts}">
                                                                    ${product.productId.productName}<br>
																	</c:forEach>
																</c:if></td>
															<td class="table-td-center">
																<!-- Các nút chỉnh sửa và xóa --> <a
																href="${pageContext.request.contextPath}/admin/bill/edit/${bill.billId}"
																class="btn btn-primary btn-sm trash">Edit</a>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<!-- Pagination -->
											<div>
												<ul class="pagination">
													<li
														class="page-item ${bills.number == 0 ? 'disabled' : ''}">
														<a class="page-link" href="?pageNo=1&keyword=${keyword}">First</a>
													</li>
													<c:forEach var="i"
														begin="${(bills.number - 1) ge 0 ? bills.number - 1 : 0}"
														end="${(bills.number + 1) le bills.totalPages - 2 ? (bills.number + 1) : Math.max(0, bills.totalPages - 1)}"
														varStatus="loop">
														<li class="page-item ${i == bills.number ? 'active' : ''}">
															<a class="page-link"
															href="?pageNo=${i + 1}&keyword=${keyword}">${i + 1}</a>
														</li>
													</c:forEach>
													<li
														class="page-item ${bills.number == Math.max(0, bills.totalPages - 1 ) ? 'disabled' : ''}">
														<a class="page-link"
														href="?pageNo=${bills.totalPages}&keyword=${keyword}">Last</a>
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