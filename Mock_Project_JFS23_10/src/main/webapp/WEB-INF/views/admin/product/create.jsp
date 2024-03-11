<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>Admin - Create Product</title>
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
					<h2>Create Product</h2>
				</div>
				<!-- Form -->
				<form:form action="" method="post" class="form-row"
					modelAttribute="addProductForm">

					<div class="form-group col-12">
						<label for="productName" class="form-label font-weight-bold">Name</label>
						<form:input type="text" class="form-control" path="productName" />
						<form:errors path="productName" class="text-danger"></form:errors>
					</div>
					<div class="form-group col-12">
						<label for="image" class="form-label font-weight-bold">Image</label>
						<form:input type="text" class="form-control" path="image" />
						<form:errors path="image" class="text-danger"></form:errors>
					</div>
					<div class="form-group col-12">
						<label for="description" class="form-label font-weight-bold">Description</label>
						<form:input type="text" class="form-control" path="description" />
						<form:errors path="description" class="text-danger"></form:errors>
					</div>
					<div class="form-group col-12">
						<label for="price" class="form-label font-weight-bold">Price</label>
						<form:input type="number" class="form-control" path="price"
							min="0" step="0.01" />
						<form:errors path="price" class="text-danger"></form:errors>
					</div>
					<div class="form-group col-12">
						<label for="quantity" class="form-label font-weight-bold">Quantity</label>
						<form:input type="number" class="form-control" path="quantity" />
						<form:errors path="quantity" class="text-danger"></form:errors>
					</div>
					<div class="form-group col-12">
						<label for="categoryId" class="form-label font-weight-bold">Category</label>
						<form:select class="form-control" path="categoryId">
							<form:options items="${categories}"></form:options>
						</form:select>
						<form:errors path="categoryId" class="text-danger"></form:errors>
					</div>
					<div class="form-group col-12">
						<label for="startDiscountDate" class="form-label font-weight-bold">Start
							Discount Date</label>
						<form:input type="date" class="form-control"
							path="startDiscountDate" />
						<form:errors path="startDiscountDate" class="text-danger"></form:errors>
					</div>
					<div class="form-group col-12">
						<label for="endDiscountDate" class="form-label font-weight-bold">End
							Discount Date</label>
						<form:input type="date" class="form-control"
							path="endDiscountDate" />
						<form:errors path="endDiscountDate" class="text-danger"></form:errors>
					</div>

					<button type="submit" class="btn btn-success mr-3">Create</button>
					<!-- Back -->
					<a href="${pageContext.request.contextPath}/admin/products"
						type="button" class="btn btn-primary">Back to Products</a>
				</form:form>
			</div>
		</div>
	</div>

	<%@ include file="../common/foot.jsp"%>

</body>
</html>
