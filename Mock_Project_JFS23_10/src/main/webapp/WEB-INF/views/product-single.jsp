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
<title>Vegefoods - Single</title>
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
					<span class="mr-2"><a
						href="${pageContext.request.contextPath}/index">Home</a></span> <span
						class="mr-2"><a
						href="${pageContext.request.contextPath}/product">Product</a></span> <span>Product
						Single</span>
				</p>
				<h1 class="mb-0 bread">Product Single</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 mb-5 ftco-animate">
				<a href="images/product-1.jpg" class="image-popup"><img
					src="${product.image }" class="img-fluid" alt="Colorlib Template"></a>
			</div>
			<div class="col-lg-6 product-details pl-md-5 ftco-animate">
				<h3>${product.productName }</h3>

				<p class="price-dc">
					<c:set var="maxDiscountPercent" value="0" />
					<c:forEach var="productDiscount"
						items="${product.productDiscounts}">
						<c:if
							test="${!LocalDate.now().isBefore(productDiscount.discount.startDiscountDate) && !LocalDate.now().isAfter(productDiscount.discount.endDiscountDate)}">
							<c:set var="maxDiscountPercent"
								value="${Math.max(maxDiscountPercent, productDiscount.discount.discountPercent)}" />
						</c:if>
					</c:forEach>
					<span>Original price:</span> <span>$${product.price}</span>
				</p>
				<span>sale ${maxDiscountPercent }%</span>

				<p class="price">
					<span class="price">$<fmt:formatNumber
							value="${product.price * (100 - maxDiscountPercent) / 100}"
							pattern="0.00" /></span>


				</p>
				<p>${product.description }</p>




				<form id="addToCartForm"
					action="${pageContext.request.contextPath}/add-to-cart"
					method="get">
					<div class="row mt-4">
						<div class="col-md-6"></div>
						<div class="w-100"></div>
						<div class="input-group col-md-6 d-flex mb-3">
							<span class="input-group-btn mr-2">
								<button type="button" class="quantity-left-minus btn"
									data-type="minus" data-field="">
									<i class="ion-ios-remove"></i>
								</button>
							</span> <input type="number" id="quantity" name="quantity"
								class="form-control input-number" value="1" min="1" max="100"
								step="1" required> <span class="input-group-btn ml-2">
								<button type="button" class="quantity-right-plus btn"
									data-type="plus" data-field="">
									<i class="ion-ios-add"></i>
								</button>
							</span> <input type="hidden" name="productId"
								value="${product.productId}">
						</div>
						<div class="w-100"></div>
					</div>
					<p>
						<input id="addToCartBtn" type="submit" value="Add to Cart"
							class="btn btn-black py-3 px-5">
					</p>
				</form>




			</div>
		</div>
	</div>
</section>

<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center mb-3 pb-3">
			<div class="col-md-12 heading-section text-center ftco-animate">
				<span class="subheading">Products</span>
				<h2 class="mb-4">Related Products</h2>
				<p>Far far away, behind the world mountains, far from the
					countries Vokalia and Consonantia</p>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">



			<c:forEach var="relatedProducts" items="${relatedProducts}"
				varStatus="loopStatus">
				<c:if test="${loopStatus.index < 4}">
					<!-- Display only the first 4 items -->
					<c:set var="maxDiscountPercent" value="0" />
					<c:forEach var="productDiscount"
						items="${relatedProducts.productDiscounts}">
						<c:if
							test="${!LocalDate.now().isBefore(productDiscount.discount.startDiscountDate) && !LocalDate.now().isAfter(productDiscount.discount.endDiscountDate)}">
							<c:set var="maxDiscountPercent"
								value="${Math.max(maxDiscountPercent, productDiscount.discount.discountPercent)}" />
						</c:if>
					</c:forEach>
					<!-- The following code is executed for each related product -->
					<div class="col-md-6 col-lg-3 ftco-animate">
						<div class="product">
							<!-- Product image and details -->
							<a
								href="${pageContext.request.contextPath}/products/${relatedProducts.productId}"
								class="img-prod"> <img class="img-fluid"
								src="<c:out value="${relatedProducts.image}" />"
								alt="Product Image"> <c:if
									test="${maxDiscountPercent gt 0}">
									<span class="status"><c:out
											value="${maxDiscountPercent}" />%</span>
								</c:if>
								<div class="overlay"></div>
							</a>

							<div class="text py-3 pb-4 px-3 text-center">
								<!-- Product name -->
								<h3>
									<a href="#"><c:out value="${relatedProducts.productName}" /></a>
								</h3>

								<!-- Pricing details -->
								<div class="d-flex">
									<div class="pricing">
										<p class="price">


											<c:choose>
												<c:when test="${maxDiscountPercent gt 0}">
													<span class="mr-2 price-dc">$<c:out
															value="${relatedProducts.price}" /></span>
													<span class="price"> $<fmt:formatNumber
															value="${relatedProducts.price - (relatedProducts.price * maxDiscountPercent / 100)}"
															pattern="0.00" />
													</span>
												</c:when>
												<c:otherwise>
													<span class="price">$<fmt:formatNumber
															value="${relatedProducts.price}" pattern="0.00" /></span>
												</c:otherwise>
											</c:choose>
										</p>
									</div>
								</div>

								<!-- Buttons for actions like adding to cart and favorites -->

								<div class="bottom-area d-flex px-3">
									<div class="m-auto d-flex">
										<a 
											href="${pageContext.request.contextPath}/quick-add-to-cart/${relatedProducts.productId}?quantity=1"
											class="buy-now quickAddToCartLink d-flex justify-content-center align-items-center mx-1">
											<span><i class="ion-ios-cart"></i></span>
										</a>
									</div>
								</div>

							</div>
						</div>
					</div>
					<!-- End of product display -->
				</c:if>
			</c:forEach>




		</div>
	</div>
</section>

<jsp:include page="basefragments/footer.jsp"></jsp:include>

<script>
	$(document).ready(function() {

		var quantitiy = 0;
		$('.quantity-right-plus').click(function(e) {

			// Stop acting like a button
			e.preventDefault();
			// Get the field name
			var quantity = parseInt($('#quantity').val());

			// If is not undefined

			$('#quantity').val(quantity + 1);

			// Increment

		});

		$('.quantity-left-minus').click(function(e) {
			e.preventDefault();
			var quantity = parseInt($('#quantity').val());
			if (quantity > 0) {
				$('#quantity').val(quantity - 1);
			}
		});

	});

	document.querySelectorAll('.quickAddToCartLink').forEach(function(link) {
	    link.addEventListener('click', function(event) {
	        event.preventDefault();
	        
	        // Disable the clicked link
	        link.classList.add('disabled');
	        link.style.pointerEvents = 'none'; // Disable pointer events to prevent multiple clicks
	        
	        // Navigate to the URL
	        window.location.href = this.href;
	    });
	});
	
	document.getElementById("addToCartForm").addEventListener("submit",
			function() {
				// Disable the submit button after it's clicked
				document.getElementById("addToCartBtn").disabled = true;
			});
</script>
</body>
</html>