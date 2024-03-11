<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Vegefoods - Free Bootstrap 4 Template by Colorlib</title>
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
					<span class="mr-2"><a
						href="${pageContext.request.contextPath}/index">Home</a></span> <span
						class="mr-2"><a
						href="${pageContext.request.contextPath}/shop">Product</a></span> <span>Product
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
				<div class="rating d-flex">
					<p class="text-left mr-4">
						<a href="#" class="mr-2">5.0</a> <a href="#"><span
							class="ion-ios-star-outline"></span></a> <a href="#"><span
							class="ion-ios-star-outline"></span></a> <a href="#"><span
							class="ion-ios-star-outline"></span></a> <a href="#"><span
							class="ion-ios-star-outline"></span></a> <a href="#"><span
							class="ion-ios-star-outline"></span></a>
					</p>
					<p class="text-left mr-4">
						<a href="#" class="mr-2" style="color: #000;">100 <span
							style="color: #bbb;">Rating</span></a>
					</p>
					<p class="text-left">
						<a href="#" class="mr-2" style="color: #000;">500 <span
							style="color: #bbb;">Sold</span></a>
					</p>
				</div>
				<p class="price-dc">
				<span>Giá gốc:</span>
					<span>$${product.price}</span>
				</p>
				<span>sale ${product.discount }%</span>

				<p class="price">
					<span>$${product.price * (100 - product.discount) / 100}</span>

				</p>
				<p>${product.description }</p>
				<div class="row mt-4">
					<div class="col-md-6"></div>
					<div class="w-100"></div>
					<div class="input-group col-md-6 d-flex mb-3">
						<span class="input-group-btn mr-2">
							<button type="button" class="quantity-left-minus btn"
								data-type="minus" data-field="">
								<i class="ion-ios-remove"></i>
							</button>
						</span> <input type="text" id="quantity" name="quantity"
							class="form-control input-number" value="1" min="1" max="100">
						<span class="input-group-btn ml-2">
							<button type="button" class="quantity-right-plus btn"
								data-type="plus" data-field="">
								<i class="ion-ios-add"></i>
							</button>
						</span>
					</div>
					<div class="w-100"></div>
					<div class="col-md-12">
						<p style="color: #000;">Số lượng còn lại: ${product.quantity }</p>
					</div>
				</div>
				<p>
					<a href="cart.html" class="btn btn-black py-3 px-5">Add to Cart</a>
				</p>
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
		
		
		
	<c:forEach var="relatedProducts" items="${relatedProducts}" varStatus="loopStatus">
    <c:if test="${loopStatus.index < 4}">
        <!-- Display only the first 4 items -->

        <!-- The following code is executed for each related product -->
        <div class="col-md-6 col-lg-3 ftco-animate">
            <div class="product">
                <!-- Product image and details -->
                <a href="${pageContext.request.contextPath}/products/${relatedProducts.productId}" class="img-prod">
                    <img class="img-fluid" src="<c:out value="${relatedProducts.image}" />" alt="Product Image">
                    
                    <c:if test="${relatedProducts.discount gt 0}">
								<span class="status"><c:out value="${relatedProducts.discount}" />%</span>
							</c:if>
                    <div class="overlay"></div>
                </a>

                <div class="text py-3 pb-4 px-3 text-center">
                    <!-- Product name -->
                    <h3><a href="#"><c:out value="${relatedProducts.productName}" /></a></h3>

                    <!-- Pricing details -->
                    <div class="d-flex">
                        <div class="pricing">
                            <p class="price">
                                <c:choose>
											<c:when test="${relatedProducts.discount gt 0}">
												<span class="mr-2 price-dc">$<c:out
														value="${relatedProducts.price}" /></span>
												<span class="price">$${relatedProducts.price - (relatedProducts.price
													* relatedProducts.discount / 100)}</span>
											</c:when>
											<c:otherwise>
												<span class="price">$${relatedProducts.price}</span>
											</c:otherwise>
										</c:choose>
                            </p>
                        </div>
                    </div>

                    <!-- Buttons for actions like adding to cart and favorites -->
                    <div class="bottom-area d-flex px-3">
                        <div class="m-auto d-flex">
                            <a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                <span><i class="ion-ios-cart"></i></span>
                            </a>
                            <a href="#" class="heart d-flex justify-content-center align-items-center">
                                <span><i class="ion-ios-heart"></i></span>
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
			// Stop acting like a button
			e.preventDefault();
			// Get the field name
			var quantity = parseInt($('#quantity').val());

			// If is not undefined

			// Increment
			if (quantity > 0) {
				$('#quantity').val(quantity - 1);
			}
		});

	});
</script>
</body>
</html>