<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
												</form>

											</div>
											<table
												class="table table-hover table-bordered js-copytextarea"
												cellpadding="0" cellspacing="0" border="0" id="sampleTable">
												<thead>
													<tr>
														<th width="100">ID Product</th>
														<th width="150">Product Name</th>
														<th width="100">Image</th>
														<th width="100">Description</th>
														<th width="100">Price</th>
														<th width="100">Quantity</th>
														<th width="100">Category</th>
														<th width="100">Status</th>
														<th width="200">Action</th>


													</tr>
												</thead>
												<tbody>
													<c:forEach var="product" items="${products.content}"
														varStatus="status">
														<tr>
															<td>${products.number * products.size + status.index + 1}</td>
															<td>${product.productName}</td>
															<td><img src="${product.image}" width="100"></td>
															<td>${product.description}</td>
															<td>${product.price}</td>
															<td>${product.quantity}</td>
															<td>${product.categoryId.categoryName}</td>
															<td class="text-center" style="font-size: 20px">${contact.replied == true ? '<i class="icomoon icon-thumbs-up text-success"></i>' : '<i class="icomoon icon-close text-danger"></i>'}</td>

															<td class="table-td-center">
																<!-- Edit button --> <a
																href="${pageContext.request.contextPath}/admin/products/edit/${product.productId}"
																class="btn btn-primary btn-sm trash ">Edit</a> <!-- Delete button -->
																<a
																href="${pageContext.request.contextPath}/admin/products/delete/${product.productId}"
																class="btn btn-primary btn-sm edit">Delete</a>
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