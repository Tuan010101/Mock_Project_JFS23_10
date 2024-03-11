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
					<h2>Category List</h2>
					<div class="d-flex">
						<form class="form-inline m-0 mr-3 ">
							<div class="input-group">
								<input type="text" class="form-control"
									placeholder="Search by Full Name, Email, or Subject"
									name="keyword" value="${keyword}">
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" type="submit">Search</button>
								</div>
							</div>
						</form>
						<!-- Add button -->
						<a href="${pageContext.request.contextPath}/admin/products/create"
							class="btn btn-success">Create</a>
					</div>
				</div>
				<!-- Table -->
				<table class="table table-hover table-bordered">
					<thead class="thead-dark">
						<tr>
							<th>#</th>
							<th>Name</th>
							<th>Image</th>
							<th>Description</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Category</th>
							<th>Discount</th>
							<th>Start Discount</th>
							<th>End Discount</th>
							<th>Action</th>
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
								<td>${product.discount}</td>
								<td>${product.startDiscountDate}</td>
								<td>${product.endDiscountDate}</td>
								<td>
									<!-- Edit button --> <a
									href="${pageContext.request.contextPath}/admin/products/edit/${product.productId}"
									class="btn btn-warning">Edit</a> <!-- Delete button --> <a
									href="${pageContext.request.contextPath}/admin/products/delete/${product.productId}"
									class="btn btn-danger">Delete</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<!-- Pagination -->
				<div>
					<ul class="pagination">
						<li class="page-item ${products.number == 0 ? 'disabled' : ''}">
							<a class="page-link" href="?pageNo=1&keyword=${keyword}">First</a>
						</li>
						<c:forEach var="i"
							begin="${(products.number - 1) ge 0 ? products.number - 1 : 0}"
							end="${(products.number + 1) le products.totalPages - 2 ? (products.number + 1) : Math.max(0, products.totalPages - 1)}"
							varStatus="loop">
							<li class="page-item ${i == products.number ? 'active' : ''}">
								<a class="page-link" href="?pageNo=${i + 1}&keyword=${keyword}">
									${i + 1} </a>
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

	<%@ include file="../common/foot.jsp"%>

</body>
</html>
