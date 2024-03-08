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

	<%@ include file="../common/nav.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<div class="col-2 p-0 bg-light">
				<%@ include file="../common/sidebar.jsp"%>
			</div>

			<div class="col-10 p-5">
				<!-- Top -->
				<div class="d-flex justify-content-between align-items-center mb-4">
					<h2>Edit Category</h2>
				</div>
				<!-- Form -->
				<form:form action="" method="post" modelAttribute="category">
					<div class="mb-3">
						<label for="categoryName" class="form-label font-weight-bold">Category
							name</label>
						<form:input type="text" class="form-control" path="categoryName"
							placeholder="Enter category name" />
						<form:errors path="categoryName" class="text-danger"></form:errors>
					</div>

					<button type="submit" class="btn btn-warning">Edit</button>
					<!-- Back -->
					<a href="${pageContext.request.contextPath}/admin/categories"
						type="button" class="btn btn-primary">Back to Categories</a>
				</form:form>
			</div>
		</div>
	</div>

	<%@ include file="../common/foot.jsp"%>

</body>
</html>
