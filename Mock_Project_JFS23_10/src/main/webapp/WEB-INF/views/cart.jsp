<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Cart - Vinh</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<jsp:include page="basefragments/header.jsp"></jsp:include>
	
	<div class="hero-wrap hero-bread" style="background-image: url(${pageContext.request.contextPath}/resources/images/bg_1.jpg);">
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Cart</span></p>
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
						<table class="table table-hover">
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
								<c:choose>
										<c:when test="${not empty userProducts}">
											<c:forEach items="${userProducts}" var="userProduct">
												
												<tr class="text-center">
													<td class="tick-remove">
														<button class="cross-box btn"><i class="icon icon-close"></i></button>
														<button class="tick-box btn"><i class="icon icon-check"></i></button>
													</td>
				
													<td class="image-prod">
														<div class="img" style="background-image:url(images/product-3.jpg);"></div>
													</td>
				
													<td class="product-name">
														<h3>${userProduct.productId.productName}</h3>
														<p>${userProduct.productId.description}</p>
													</td>
				
													<td class="price">${userProduct.productId.price}</td>
				
													<td class="quantity">
														<div class="input-group mb-3">
															<input type="number" name="quantity"
																class="quantity form-control input-number" value="${userProduct.quantity}" min="1" max="100">
														</div>
													</td>
				
													<td class="total">${userProduct.productId.price * userProduct.quantity}</td>
												</tr>
											</c:forEach>
										</c:when>
										
										<c:otherwise>
											<td colspan="4" style="text-align: center">No record</td>
										</c:otherwise>
									</c:choose>

								<tr class="text-center">
									<td colspan="4" class="product-remove display-4">
										Total of cart
									</td>


									<td colspan="2" class="total display-4 text-right">0</td>
								</tr>
								<!-- END TR-->
							
							</tbody>
						</table>
					</div>
				</div>
			</div>
		
			<div class="row justify-content-end">

				<div class="col-lg-4 mt-5 cart-wrap ftco-animate">

					<p><a href="checkout.html" class="btn btn-primary py-3 px-4">Proceed to Checkout</a></p>
				</div>
			</div>

		</div>
	</section>

	<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
		<div class="container py-4">
			<div class="row d-flex justify-content-center py-5">
				<div class="col-md-6">
					<h2 style="font-size: 22px;" class="mb-0">Subcribe to our Newsletter</h2>
					<span>Get e-mail updates about our latest shops and special offers</span>
				</div>
				<div class="col-md-6 d-flex align-items-center">
					<form action="#" class="subscribe-form">
						<div class="form-group d-flex">
							<input type="text" class="form-control" placeholder="Enter email address">
							<input type="submit" value="Subscribe" class="submit px-3">
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="basefragments/footer.jsp"></jsp:include>

	<script>

		$(document).ready(function () {
			var quantitiy = 0;
			var arrPrices = $("td.price");
			var arrQuans = $("input[name='quantity']");
			var arrTotals = $("td.total");
			
			var quantitiy = 0;
			$('.quantity-right-plus').click(function (e) {

				// Stop acting like a button
				e.preventDefault();
				// Get the field name
				var quantity = parseInt($('#quantity').val());

				// If is not undefined

				$('#quantity').val(quantity + 1);


				// Increment

			});

			$('.quantity-left-minus').click(function (e) {
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





			$(".cross-box").click(function (e) {
				// Stop acting like a button
				e.preventDefault();
				let crossBox = $(e.currentTarget);
				let tickBox = crossBox.next();
				crossBox.toggleClass("cross-box-actived");
				if (tickBox.hasClass("tick-box-actived")) {
					tickBox.removeClass("tick-box-actived");
				}

			});

			$(".tick-box").click(function (e) {
				// Stop acting like a button
				e.preventDefault();
				let tickBox = $(e.currentTarget);
				let crossBox = tickBox.prev();
				tickBox.toggleClass("tick-box-actived");
				if (crossBox.hasClass("cross-box-actived")) {
					crossBox.removeClass("cross-box-actived");
				}
			});
			
			//fix decimal part of total
			for (let index = 0; index < arrQuans.length; index++) {
				let tempPrice = arrPrices.eq(index).text().substring(1);
				let tempQuan = arrQuans.eq(index).val();
				let tempTotal = arrTotals.eq(index).text().substring(1);
				arrTotals.eq(index).text("$" + (tempPrice * tempQuan).toFixed(2));
			}
	
			// render the total of cart
			function calCartTotal() {
				var cartTotalTemp = 0;
				for (let i = 1; i < $("tr").length - 1; i++) {
					cartTotalTemp += parseFloat($("tr").eq(i).children().last().text().substring(1));
				}
				var cartTotal = $("tr").last().children().last();
				cartTotal.text("$" + cartTotalTemp.toFixed(2));
			};
			calCartTotal();

			// render total with change in quantity
			$("[name='quantity']").change(function (e) {
				let target = $(e.currentTarget);
				let totalPrice = target.closest("td.quantity").next();

				let quantity = target.val();
				let price = target.closest("td.quantity").prev().text().substring(1);

				let newTotalPrice = price * quantity;
				totalPrice.text("$" + parseFloat(newTotalPrice).toFixed(2));

				calCartTotal();
			});

		});
	</script>

</body>

</html>