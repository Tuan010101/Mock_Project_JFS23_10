<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.lang.Math"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>admin-product</title>
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
									<li class="breadcrumb-item active"><a href="#"><b>Product
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
														href="${pageContext.request.contextPath}/admin/products/create"
														title="Thêm"><i class="fas fa-plus"></i> Create new
														Product</a>
												</div>
												<form class="mb-2 d-flex seach align-items-center">
													<input type="text" class="form-control"
														placeholder="Search by Full Name, Email, or Subject"
														name="keyword" value="${keyword}">
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
														<th>Name</th>
														<th>Image</th>
														<th>Description</th>
														<th>Price</th>
														<th>Quantity</th>
														<th>Category</th>
														<th>Discount</th>
														<th>Status</th>

														<th>Action</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="product" items="${products.content}"
														varStatus="status">
														<c:set var="maxDiscountPercent" value="0" />
														<c:forEach var="productDiscount"
															items="${product.productDiscounts}">
															<c:if
																test="${!LocalDate.now().isBefore(productDiscount.discount.startDiscountDate) && !LocalDate.now().isAfter(productDiscount.discount.endDiscountDate)}">
																<c:set var="maxDiscountPercent"
																	value="${Math.max(maxDiscountPercent, productDiscount.discount.discountPercent)}" />
															</c:if>
														</c:forEach>

														<tr>
															<td>${products.number * products.size + status.index + 1}</td>
															<td>${product.productName}</td>
															<td><img src="${product.image}" width="100"></td>
															<td>${product.description}</td>
															<td>${product.price}</td>
															<td>${product.quantity}</td>
															<td>${product.categoryId.categoryName}</td>

															<td>${maxDiscountPercent}%</td>


															<td class="text-center" style="font-size: 20px">${product.deleted == false ? '<p class=" text-success m">Enable</P>' : '<p class="text-danger"Disable</p>'}</td>
															<td class="table-td-center">
																<!-- Edit button --> <a
																href="${pageContext.request.contextPath}/admin/products/edit/${product.productId}"
																class="btn btn-primary btn-sm trash">Edit</a> <!-- Delete button -->
																<c:if test="${product.deleted= true}">
																	<a class="btn btn-primary btn-sm">
																		<p class="m-0" data-toggle="modal"
																			data-target="#deleteModal${status.count}"
																			title="Delete">Delete</p>
																		<div id="deleteModal${status.count}"
																			class="modal fade">
																			<div class="modal-dialog">
																				<div class="modal-content">
																					<form
																						action="/products/delete/${product.productId}"
																						method="post">
																						<div class="modal-header">
																							<h4 class="modal-title"
																								style="color: #0b0b0b !important;">Delete
																								sản phẩm</h4>
																							<button type="button" class="close"
																								data-dismiss="modal" aria-hidden="true">&times;</button>
																						</div>
																						<div class="modal-body">
																							<p class="text-dark">Bạn có chắc là Delete
																								sản phẩm có tên ${product.productName} và id là
																								${product.productId} ?</p>

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
																</c:if> <c:if test="${product.deleted= false}">
																	<a class="btn btn-primary btn-sm">
																		<p class="m-0" data-toggle="modal"
																			data-target="#deleteModal${status.count}"
																			title="Delete">Un Delete</p>
																		<div id="deleteModal${status.count}"
																			class="modal fade">
																			<div class="modal-dialog">
																				<div class="modal-content">
																					<form
																						action="/products/delete/${product.productId}"
																						method="post">
																						<div class="modal-header">
																							<h4 class="modal-title"
																								style="color: #0b0b0b !important;">Un
																								Delete sản phẩm</h4>
																							<button type="button" class="close"
																								data-dismiss="modal" aria-hidden="true">&times;</button>
																						</div>
																						<div class="modal-body">
																							<p class="text-dark">Bạn có chắc là Un Delete
																								sản phẩm có tên ${product.productName} và id là
																								${product.productId} ?</p>

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



																</c:if>
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