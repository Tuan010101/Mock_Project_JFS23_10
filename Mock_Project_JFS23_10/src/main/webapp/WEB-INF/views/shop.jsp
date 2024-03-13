<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<jsp:include page="basefragments/header.jsp"></jsp:include>

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
			<form action="" method="get" class="col-md-8 text-center">
				<div class="input-group mb-3  ">
					<input type="search" name="keyword" value="${keyword }"
						class="form-control  rounded-left" placeholder="Bạn muốn tìm ..."
						aria-label="Recipient's username" aria-describedby="basic-addon2">
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
					<li><a class="${empty param.category ? 'active' : ''}"
						href="${pageContext.request.contextPath}/shop?category=-1">All</a>
					</li>
					<c:forEach var="category" items="${categories}">
						<li><a
							class="${param.category eq category.categoryId ? 'active' : ''}"
							href="${pageContext.request.contextPath}/shop?category=${category.categoryId}">
								${category.categoryName} </a></li>
					</c:forEach>
				</ul>
			</div>
		</div>



		<div class="row">
			<c:forEach var="product" items="${products}">
				<div class="col-md-6 col-lg-3 ftco-animate abc">
					<div class="product">
						<a
							href="${pageContext.request.contextPath}/product-single/${product.productId}"
							class="img-prod"> <img class="img-fluid"
							src="<c:out value="${product.image}" />" alt="Product Image">
							<c:if test="${product.discount gt 0}">
								<span class="status"><c:out value="${product.discount}" />%</span>
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
											<c:when test="${product.discount gt 0}">
												<span class="mr-2 price-dc">$<c:out
														value="${product.price}" /></span>
												<span class="price">$${product.price - (product.price
													* product.discount / 100)}</span>
											</c:when>
											<c:otherwise>
												<span class="price">$${product.price}</span>
											</c:otherwise>
										</c:choose>
									</p>
								</div>
							</div>
							<div class="bottom-area d-flex px-3">
								<div class="m-auto d-flex">
									<a href="#"
										class="buy-now d-flex justify-content-center align-items-center mx-1">
										<span><i class="ion-ios-cart"></i></span>
									</a> <a href="#"
										class="heart d-flex justify-content-center align-items-center">
										<span><i class="ion-ios-heart"></i></span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
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

<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
	<div class="container py-4">
		<div class="row d-flex justify-content-center py-5">
			<div class="col-md-6">
				<h2 style="font-size: 22px;" class="mb-0">Subcribe to our
					Newsletter</h2>
				<span>Get e-mail updates about our latest shops and special
					offers</span>
			</div>
			<div class="col-md-6 d-flex align-items-center">
				<form action="#" class="subscribe-form">
					<div class="form-group d-flex">
						<input type="text" class="form-control"
							placeholder="Enter email address"> <input type="submit"
							value="Subscribe" class="submit px-3">
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<jsp:include page="basefragments/footer.jsp"></jsp:include>


<script type="text/javascript">
	
</script>
</body>
</html>