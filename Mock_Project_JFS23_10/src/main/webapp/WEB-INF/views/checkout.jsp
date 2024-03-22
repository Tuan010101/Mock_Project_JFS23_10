<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Vegefoods - Checkout</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<jsp:include page="basefragments/header.jsp"></jsp:include>

<c:if test="${success == 'false'}">
	<div
		class="alert alert-custome alert-danger alert-dismissible fade show"
		role="alert">
		<strong>Failure!</strong> There was an error while paying Bill.
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
						href="${pageContext.request.contextPath}/">Home</a></span> <span>Checkout</span>
				</p>
				<h1 class="mb-0 bread">Checkout</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section">
	<div class="container">
		<form:form action="" class="billing-form form-row" method="POST"
			modelAttribute="bill">
			<div class="col-xl-7 ftco-animate">
				<h3 class="mb-4 billing-heading">Billing Details</h3>
				<div class="row align-items-end">
					<div class="col-12" style="height: 120px">
						<div class="form-group">
							<label for="fullName">Your Name</label>
							<form:input type="text" class="form-control" path="fullName"
								placeholder="Input your name" />
							<form:errors class="text-danger" path="fullName"></form:errors>
						</div>
					</div>
					<div class="col-12" style="height: 120px">
						<div class="form-group">
							<label for="address">Street Address</label>
							<form:input type="text" class="form-control" path="address"
								placeholder="House number and street name" />
							<form:errors class="text-danger" path="address"></form:errors>
						</div>
					</div>
					<div class="col-md-6" style="height: 120px">
						<div class="form-group">
							<label for="phoneNumber">Phone</label>
							<form:input type="text" class="form-control" path="phoneNumber"
								placeholder="Input your phone" />
							<form:errors class="text-danger" path="phoneNumber"></form:errors>
						</div>
					</div>
					<div class="col-md-6" style="height: 120px">
						<div class="form-group">
							<label for="email">Your Email</label>
							<form:input type="text" class="form-control" path="email"
								placeholder="Input your email" />
							<form:errors class="text-danger" path="email"></form:errors>
						</div>
					</div>

				</div>
				<!-- END -->
			</div>
			<div class="col-xl-5">
				<div class="row mt-5 pt-3">
					<div class="col-md-12 d-flex mb-5">
						<div class="cart-detail cart-total p-3 p-md-4">
							<h3 class="billing-heading mb-4">Cart Total</h3>
							<p class="d-flex">
								<span>Subtotal</span> <span> $ ${ totalPrice }</span>
							</p>
							<p class="d-flex">
								<span>Delivery</span> <span>$ 0.0</span>
							</p>
							<hr>
							<p class="d-flex total-price">
								<span>Total</span> <span>$ ${ totalPrice }</span>
							</p>
						</div>
					</div>
					<div class="col-md-12">
						<div class="cart-detail p-3 p-md-4">
							<h3 class="billing-heading mb-4">Payment Method</h3>
							<div class="form-group">
								<div class="col-md-12">
									<div class="radio">
										<label> <form:radiobutton path="paymentMethod"
												value="0" class="mr-2" /> COD
										</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12">
									<div class="radio">
										<label> <form:radiobutton path="paymentMethod"
												value="1" class="mr-2" /> VNPAY
										</label>
									</div>
								</div>
							</div>

							<p>
								<input type="submit" class="btn btn-primary py-3 px-4"
									placeholder="Place an order">
							</p>
						</div>
					</div>
				</div>
			</div>
		</form:form>
	</div>
</section>
<!-- .section -->

<jsp:include page="basefragments/footer.jsp"></jsp:include>
</body>

</html>