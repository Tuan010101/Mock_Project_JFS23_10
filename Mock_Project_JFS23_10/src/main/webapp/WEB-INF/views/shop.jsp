<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.lang.Math"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Vegefoods - Menu</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<jsp:include page="basefragments/header.jsp"></jsp:include>



<c:if test="${param.addtocart == 'success'}">
	<div
		class="alert alert-custome alert-success alert-dismissible fade show"
		role="alert">
		<strong>Success!</strong> Add to cart successfully.
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
</c:if>


<div class="hero-wrap hero-bread"
	style="background-image: url(${pageContext.request.contextPath}/resources/images/bg_1.jpg);">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="index.html">Home</a></span> <span>Products
					</span>
				</p>
				<h1 class="mb-0 bread">Products</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section">
	<div class="container">



		<div class="row justify-content-center">
			<form action="${pageContext.request.contextPath}/products?"
				method="get" class="col-md-8 text-center">
				<div class="input-group mb-3  ">
					<input id="searchInput" type="search" name="keyword"
						value="${keyword }" class="form-control  rounded-left"
						placeholder="Bạn muốn tìm ..." aria-label="Recipient's username"
						aria-describedby="basic-addon2" maxlength="50"> <input
						type="hidden" name="category" value="${param.category}">

					<div class="input-group-append">
						<button class="btn btn-outline-secondary rounded-right"
							style="background: #82ae46; color: white" type="submit">
							<i class="icomoon icon-search"></i>
						</button>
					</div>
				</div>
			</form>

			<div class="col-md-6 mb-5 text-center">
				<ul class="product-category d-flex justify-content-center p-0">
					<li><a
						class="${empty param.category || param.category eq '-1' ? 'active' : ''}"
						href="${pageContext.request.contextPath}/products?category=-1">All</a>
					</li>
					<c:forEach var="category" items="${categories}">
						<li><a
							class="${param.category eq category.categoryId ? 'active' : ''}"
							href="${pageContext.request.contextPath}/products?category=${category.categoryId}">
								${category.categoryName} </a></li>
					</c:forEach>
				</ul>
			</div>
		</div>



		<div class="row">



			<c:choose>
				<c:when test="${empty products}">
					<div class="container">
						<div class="row justify-content-center mt-5">
							<div class="col-md-6 text-center">
								<div class="alert alert-info" role="alert">
									<h3 class="mb-0">No products found.</h3>
								</div>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>

					<c:forEach var="product" items="${products}">
						<c:set var="maxDiscountPercent" value="0" />
						<c:forEach var="productDiscount"
							items="${product.productDiscounts}">
							<c:if
								test="${!LocalDate.now().isBefore(productDiscount.discount.startDiscountDate) && !LocalDate.now().isAfter(productDiscount.discount.endDiscountDate)}">
								<c:set var="maxDiscountPercent"
									value="${Math.max(maxDiscountPercent, productDiscount.discount.discountPercent)}" />
							</c:if>
						</c:forEach>

						<div class="col-md-6 col-lg-3 ftco-animate abc">
							<div class="product">
								<a
									href="${pageContext.request.contextPath}/products/${product.productId}"
									class="img-prod"> <img class="img-fluid"
									src="<c:out value="${product.image}" />" alt="Product Image">
									<c:if test="${maxDiscountPercent gt 0}">
										<span class="status">${maxDiscountPercent}%</span>
									</c:if>
									<div class="overlay"></div>
								</a>
								<div class="text py-3 pb-4 px-3 text-center">
									<h3>
										<a href="#"><c:out value="${product.productName}" /></a>
									</h3>
									<div class="d-flex">
										<div class="pricing">
											<p class="price">
												<c:choose>
													<c:when test="${maxDiscountPercent gt 0}">
														<span class="mr-2 price-dc">$<c:out
																value="${product.price}" /></span>
														<span class="price"> $<fmt:formatNumber
																value="${product.price - (product.price * maxDiscountPercent / 100)}"
																pattern="0.00" />
														</span>
													</c:when>
													<c:otherwise>
														<span class="price">$<fmt:formatNumber
																value="${product.price}" pattern="0.00" /></span>
													</c:otherwise>
												</c:choose>

											</p>
										</div>
									</div>
									<div class="bottom-area d-flex px-3">
										<div class="m-auto d-flex">

											<a
												href="${pageContext.request.contextPath}/quick-add-to-cart/${product.productId}?quantity=1&page=${param.pageNo}"
												class="buy-now quickAddToCart d-flex justify-content-center align-items-center mx-1">
												<span><i class="ion-ios-cart"></i></span>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>




		</div>


		<div class="row mt-5">
			<div class="col text-center">
				<div class="block-27">




					<ul>
						<li><c:if test="${productPage.number >= 1}">
								<a
									href="?categoryId=${categoryId}&keyword=${keyword}&pageNo=${productPage.number}&pageSize=${productPage.size}">&lt;</a>
							</c:if></li>
						<c:forEach var="i"
							begin="${productPage.number - 2 >= 1 ? productPage.number - 1 : 1}"
							end="${productPage.number + 2 < productPage.totalPages ? productPage.number + 3 : productPage.totalPages}">
							<c:choose>
								<c:when test="${i eq productPage.number + 1}">
									<li class="active"><span>${i}</span></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="?categoryId=${categoryId}&keyword=${keyword}&pageNo=${i}&pageSize=${productPage.size}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<li><c:if
								test="${productPage.number < (productPage.totalPages -1 )}">
								<a
									href="?categoryId=${categoryId}&keyword=${keyword}&pageNo=${productPage.number + 2 }&pageSize=${productPage.size}">&gt;</a>
							</c:if></li>
					</ul>




				</div>
			</div>
		</div>
</section>

<jsp:include page="basefragments/footer.jsp"></jsp:include>


<script>
	document.querySelectorAll('.quickAddToCart').forEach(function(link) {
		link.addEventListener('click', function(event) {
			event.preventDefault();

			// Disable the clicked link
			link.classList.add('disabled');
			link.style.pointerEvents = 'none'; // Disable pointer events to prevent multiple clicks

			// Navigate to the URL
			window.location.href = this.href;
		});
	});
</script>
</body>
</html>