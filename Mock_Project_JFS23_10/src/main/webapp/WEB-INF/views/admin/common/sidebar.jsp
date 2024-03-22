<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <ul class="list-unstyled m-0">
	<li class="nav-item border-bottom"><a
		class="mx-3 my-2 nav-link d-flex align-items-center"
		href="${pageContext.request.contextPath}/admin/contacts"> <i
			class="icomoon icon-quill"></i> Contact
	</a> <a class="mx-3 my-2 nav-link d-flex align-items-center"
		href="${pageContext.request.contextPath}/admin/categories"> <i
			class="icomoon icon-star-3"></i> Category
	</a> <a class="mx-3 my-2 nav-link d-flex align-items-center"
		href="${pageContext.request.contextPath}/admin/products"> <i
			class="icomoon icon-star-3"></i> Product
	</a></li>
</ul>
 --%>
<div id="sidebar">
	<ul class="list-group">
		<a href="${pageContext.request.contextPath}/admin/contacts">
			<li class="list-group-item"><i
				class="icomoon icon-address-book pr-2"></i>Contacts report</li>
		</a>
		<a href="${pageContext.request.contextPath}/admin/products">
			<li class="list-group-item"><i class="icomoon icon-tags pr-1"></i>Product
				Management</li>
		</a>
		<a href="${pageContext.request.contextPath}/admin/User">
			<li class="list-group-item"><i class="icomoon icon-users pr-2"></i>User
				management</li>
		</a>
		<a href="${pageContext.request.contextPath}/admin/categories">
			<li class="list-group-item"><i
				class="icomoon icon-address-card pr-2"></i>Category manager</li>
		</a>
		<a href="${pageContext.request.contextPath}/admin/bill">
			<li class="list-group-item"><i
				class="icomoon icon-shopping-cart pr-2"></i>Order management</li>
		</a>
		<a href="${pageContext.request.contextPath}/admin/discount">
			<li class="list-group-item"><i class="icomoon icon-ticket pr-2"></i>Sales
				report</li>
		</a>

		<a href="#">
			<li class="list-group-item"><i class="icomoon icon-cogs pr-2"></i>System
				installation</li>
		</a>
	</ul>
</div>

