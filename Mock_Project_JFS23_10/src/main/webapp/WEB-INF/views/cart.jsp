<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.lang.Math"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Vegefoods - Cart</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<style>
.input-group .button-minus, .input-group .button-plus {
	font-weight: bold;
	height: 38px;
	line-height: 38px;
	padding: 0;
	width: 38px;
	position: relative;
	border: 1px solid #eeeeee;
	-webkit-appearance: button;
	cursor: pointer;
	background-color: #eeeeee;
	min-width: 38px;
	width: auto;
	padding: 0;
}

.input-group .quantity-field {
	position: relative;
	height: 38px;
	text-align: center;
	width: 62px;
	display: inline-block;
	font-size: 13px;
	margin: 0 0 5px;
	resize: vertical;
	border: 1px solid #eeeeee;
	display: flex;
	align-items: center;
	justify-content: center;
}
</style>
<jsp:include page="basefragments/header.jsp"></jsp:include>


<c:if test="${param.pay_status == 'success'}">
	<div
		class="alert alert-custome alert-success alert-dismissible fade show"
		role="alert">
		<strong>Success!</strong> Payment successfully.
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
					<span class="mr-2"><a href="index.html">Home</a></span> <span>Cart</span>
				</p>
				<h1 class="mb-0 bread">My Cart</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section ftco-cart">
	<div class="container">
		<div class="row">
			<div class="col-md-12 ftco-animate">
				<div class="cart-list">
					<table class="table">
						<thead class="thead-primary">
							<tr class="text-center">
								<th>&nbsp;</th>
								<th>&nbsp;</th>
								<th>Product name</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>Total</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="userProducts" items="${userProducts}">
								<c:set var="maxDiscountPercent" value="0" />
								<c:forEach var="productDiscount"
									items="${userProducts.productId.productDiscounts}">
									<c:if
										test="${!LocalDate.now().isBefore(productDiscount.discount.startDiscountDate) && !LocalDate.now().isAfter(productDiscount.discount.endDiscountDate)}">
										<c:set var="maxDiscountPercent"
											value="${Math.max(maxDiscountPercent, productDiscount.discount.discountPercent)}" />
									</c:if>
								</c:forEach>
								<tr class="text-center">
									<td class="product-remove">
										<%-- <form action="${pageContext.request.contextPath}/cart/delete/${userProducts.productId.productId}" method="post" >
										<button type="submit" class="btn btn-outline-danger "><span
											class="ion-ios-close"></span></button>
									<form> --%> <a
										href="${pageContext.request.contextPath}/cart/delete/${userProducts.productId.productId}"
										onclick="handleClick(event, this);"><span
											class="ion-ios-close"></span></a>
									</td>

									<td class="image-prod">
										<div class="img">
											<img class="w-100 h-100"
												src="${userProducts.productId.image}" />
										</div>
									</td>

									<td class="product-name">
										<h3>${userProducts.productId.productName}</h3>
										<p>${userProducts.productId.description	}</p>
									</td>

									<td class="price">$<fmt:formatNumber
											value="${userProducts.productId.price * (1 - maxDiscountPercent / 100 ) }"
											pattern="0.00" />

									</td>

									<td class="quantity">
										<div class="input-group mb-3">
											<div class="input-group justify-content-center">
												<a type="button"
													href="${pageContext.request.contextPath}/cart/minus/${userProducts.productId.productId}"
													class="button-minus" onclick="handleClick(event, this);">
													- </a>
												<div class="quantity-field">${userProducts.quantity }</div>
												<a type="button"
													href="${pageContext.request.contextPath}/cart/plus/${userProducts.productId.productId}"
													class="button-plus" onclick="handleClick(event, this);">
													+ </a>
											</div>

										</div>
									</td>

									<td class="total">$<fmt:formatNumber
											value="${userProducts.productId.price * (1 - maxDiscountPercent / 100 ) * userProducts.quantity }"
											pattern="0.00" /></td>
								</tr>
								<!-- END TR-->
							</c:forEach>


						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row justify-content-end">

			<div class="offset-lg-8 col-lg-4 mt-5 cart-wrap ftco-animate">
				<div class="cart-total mb-3">
					<h3>Cart Totals</h3>
					<p class="d-flex">
						<span>Subtotal</span> <span>$${totalPrice}</span>
					</p>
					<p class="d-flex">
						<span>Delivery</span> <span>$0.00</span>
					</p>

					<hr>
					<p class="d-flex total-price">
						<span>Total</span> <span>$${totalPrice}</span>
					</p>
				</div>
				<c:if test="${not empty userProducts}">
					<p>
						<a href="checkout.html" class="btn btn-primary py-3 px-4">Proceed
							to Checkout</a>
					</p>
				</c:if>
			</div>
		</div>
	</div>
</section>


<jsp:include page="basefragments/footer.jsp"></jsp:include>
<script>
	function handleClick(event, element) {
		event.preventDefault();

		window.location.href = element.getAttribute("href");
		element.setAttribute("href", "");
	}
</script>
</body>

</html>