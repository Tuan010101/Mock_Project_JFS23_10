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
					<h2>Reply Contact</h2>
				</div>
				<!-- Form -->
				<form:form action="" method="post"
					modelAttribute="replyEmailContactForm">
					<div class="mb-3">
						<label for="inputEmail" class="form-label font-weight-bold">Email</label>
						<form:hidden class="form-control" path="email" />
						<p>${replyEmailContactForm.email}</p>
					</div>
					<div class="mb-3">
						<label for="inputSubject" class="form-label font-weight-bold">Subject</label>
						<form:hidden class="form-control" path="subject" />
						<p>${replyEmailContactForm.subject}</p>
					</div>
					<div class="mb-3">
						<label for="inputMessage" class="form-label font-weight-bold">Message</label>
						<form:textarea class="form-control" path="message" rows="3"
							placeholder="Type your message"></form:textarea>
						<form:errors path="message" class="text-danger" />
					</div>
					<button type="submit" class="btn btn-success">Reply</button>
					<a href="${pageContext.request.contextPath}/admin/contacts"
						type="button" class="btn btn-primary">Back to Contacts</a>
				</form:form>
			</div>
		</div>
	</div>

	<%@ include file="../common/foot.jsp"%>
	<script src="https://cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
	<script>
		CKEDITOR.replace('message');
	</script>

</body>

</html>