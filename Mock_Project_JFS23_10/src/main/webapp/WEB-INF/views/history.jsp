<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>History - Vinh</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<jsp:include page="basefragments/header.jsp"></jsp:include>
	
	<div class="hero-wrap hero-bread" style="background-image: url(${pageContext.request.contextPath}/resources/images/bg_1.jpg);">
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>History</span></p>
					<h1 class="mb-0 bread">My History</h1>
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
							<thead>
								<tr>
									<th>ID</th>
									
									<th>Place of Receipt</th>
									<th>Order time</th>
									<th>Order date</th>
									<th>Products</th>
									<th>Cost</th>
									<th>Status</th>
									<th>Action</th>

								</tr>
							</thead>
							<tbody>
								<tr>
									<c:choose>
										<c:when test="${not empty bills}">
											<c:forEach items="${bills}" var="bill">
												
												<tr class="text-center">
													<td>
														<p>${bill.billId}</p>
													</td>
												
													<td>
														<p>${bill.address}</p>
													</td>
													
													<td>
														<p>${bill.buyTime}</p>
													</td>
													
													<td>
														<p>${bill.buyDate}</p>
													</td>
													
													<td>
														<p></p>
													</td>
													
													<td>
														<p></p>
													</td>
													
													<td>
														<c:if test="${bill.status == 1}">
														   <i>Chờ lấy hàng</i>
														</c:if>
														<c:if test="${bill.status == 2}">
														   <i>Đang giao</i>
														</c:if>
														<c:if test="${bill.status == 3}">
														   <i>Giao thành công</i>
														</c:if>
														<c:if test="${bill.status == 4}">
														   <i>Giao thất bại</i>
														</c:if>
														<c:if test="${bill.status == 5}">
														   <i>Hủy đơn</i>
														</c:if>
													</td>
													<td>
														<c:if test="${bill.status == 0}">
														    <button type="button" class="btn btn-danger">Hủy đơn</button>
														</c:if>
														
													</td>
												</tr>
											</c:forEach>
										</c:when>
										
										<c:otherwise>
											<td colspan="4" style="text-align: center">No record</td>
										</c:otherwise>
									</c:choose>
								</tr>
								
							</tbody>
						</table>
				
						
						 
						  <ul class="pagination">
							  <li><a href="#">1</a></li>
							  <li class="active"><a href="#">2</a></li>
							  <li><a href="#">3</a></li>
							  <li><a href="#">4</a></li>
							  <li><a href="#">5</a></li>
							</ul>
						
					</div>
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
			var arrPrices = $("td.price");
			var arrQuans = $("input[name='quantity']");
			var arrTotals = $("td.total");

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
			//fix decimal part of price and render the correcsponde total
			for (let index = 0; index < arrPrices.length; index++) {
				let tempPriceLeng = arrPrices.eq(index).text().length;
				let tempPrice = arrPrices.eq(index).text().slice(0, tempPriceLeng - 2);
				let tempTotal = tempPrice * arrQuans.eq(index).val();
				// console.log(arrPrices.eq(index).text("$" + tempPrice.toFixed(2)))
				console.log("this line: " + tempTotal);
				arrTotals.eq(index).text("$" + tempTotal);
				arrPrices.eq(index).text("$" + tempPrice);


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
			
			// pagination
			function getData(page) {
			    $.ajax({
			      url: "get_data.php",
			      type: "GET",
			      data: { page: page },
			      success: function(response) {
			        $("#result").html(response.data); // Hiển thị dữ liệu lấy được
			        $("#pagination").html(response.pagination); // Hiển thị thanh phân trang
			      }
			    });

		});
	</script>
	
	

</body>

</html>