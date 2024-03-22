
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Vegefoods</title>
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
					<span class="mr-2"><a href="index.html">Home</a></span> <span>About
						us</span>
				</p>
				<h1 class="mb-0 bread">About us</h1>
			</div>
		</div>
	</div>
</div>
<section class="ftco-section ftco-no-pb ftco-no-pt bg-light">
	<div class="container">
		<div class="row">
			<div
				class="col-md-5 p-md-5 img img-2 d-flex justify-content-center align-items-center"
				style="background-image: url(${pageContext.request.contextPath}/resources/images/about.jpg);">
				<a href="https://www.youtube.com/watch?v=FWrBHAJNEyY"
					class="icon popup-vimeo d-flex justify-content-center align-items-center">
					<span class="icon-play"></span>
				</a>
			</div>
			<div class="col-md-7 py-5 wrap-about pb-md-5 ftco-animate">
				<div class="heading-section-bold mb-4 mt-md-5">
					<div class="ml-md-0">
						<h2 class="mb-4">Welcome to Vegefoods an eCommerce website</h2>
					</div>
				</div>
				<div class="pb-md-5">
					<p>Welcome to VEGEFOODS Direct, your one-stop destination for
						fresh, nutritious, and sustainably sourced vegetables delivered
						straight to your doorstep. At FreshVege Direct, we believe in
						promoting healthy lifestyles and supporting local farmers by
						connecting you with the finest selection of farm-fresh produce.</p>
					<p>Our mission at VEGEFOODS Direct is simple: to provide
					
						convenient access to high-quality vegetables while supporting
						local communities and promoting environmental sustainability. We
						strive to revolutionize the way you shop for vegetables by
						offering a seamless online platform that prioritizes freshness,
						variety, and customer satisfaction.</p>
					<p>
						<a href="${pageContext.request.contextPath}/products?category=-1" class="btn btn-primary">Shop now</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section ftco-counter img" id="section-counter"
	style="background-image: url(images/bg_3.jpg);">
	<div class="container">
		<div class="row justify-content-center py-5">
			<div class="col-md-10">
				<div class="row">
					<div
						class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18 text-center">
							<div class="text">
								<strong class="number" data-number="10000">0</strong> <span>Happy
									Customers</span>
							</div>
						</div>
					</div>
					<div
						class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18 text-center">
							<div class="text">
								<strong class="number" data-number="100">0</strong> <span>Branches</span>
							</div>
						</div>
					</div>
					<div
						class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18 text-center">
							<div class="text">
								<strong class="number" data-number="1000">0</strong> <span>Partner</span>
							</div>
						</div>
					</div>
					<div
						class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18 text-center">
							<div class="text">
								<strong class="number" data-number="100">0</strong> <span>Awards</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section testimony-section">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-3">
			<div class="col-md-7 heading-section ftco-animate text-center">
				<span class="subheading">Testimony</span>
				<h2 class="mb-4">Our satisfied customer says</h2>
				<p>Buổi tối bụng đói cồn cào. Ăn thì sợ mập nhịn thì sợ đau. Chi
					bằng bỏ chút hầu bao. Uống ly sinh tố cho qua cơn thèm. Còn là hoa
					quả tươi ngon. Uống vừa không mập lại còn thêm xinh! <3</p>
			</div>
		</div>
		<div class="row ftco-animate">
			<div class="col-md-12">
				<div class="carousel-testimony owl-carousel">
					<div class="item">
						<div class="testimony-wrap p-4 pb-5">
							<div class="user-img mb-5"
								style="background-image: url(${pageContext.request.contextPath}/resources/images/person_1.jpg)">
								<span
									class="quote d-flex align-items-center justify-content-center">
									<i class="icon-quote-left"></i>
								</span>
							</div>
							<div class="text text-center">
								<p class="mb-5 pl-4 line">Tại đây có bán hoa quả TƯƠI hơn
									người yêu cũ của bạn.</p>
								<p class="name">Le Viet Nam</p>
								<span class="position">Sieu Nhan Dien Quang</span>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="testimony-wrap p-4 pb-5">
							<div class="user-img mb-5"
								style="background-image: url(${pageContext.request.contextPath}/resources/images/person_2.jpg)">
								<span
									class="quote d-flex align-items-center justify-content-center">
									<i class="icon-quote-left"></i>
								</span>
							</div>
							<div class="text text-center">
								<p class="mb-5 pl-4 line">Trái cây ngon, giá rẻ, bao ăn</p>
								<p class="name">Phung Hoang Phu Loc</p>
								<span class="position">Interface Designer</span>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="testimony-wrap p-4 pb-5">
							<div class="user-img mb-5"
								style="background-image: url(${pageContext.request.contextPath}/resources/images/person_3.jpg)">
								<span
									class="quote d-flex align-items-center justify-content-center">
									<i class="icon-quote-left"></i>
								</span>
							</div>
							<div class="text text-center">
								<p class="mb-5 pl-4 line">Trái cây tươi ngon, mọng nước phù
									hợp cho ngày hè.</p>
								<p class="name">Nguyen Canh Thanh</p>
								<span class="position">UI Designer</span>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="testimony-wrap p-4 pb-5">
							<div class="user-img mb-5"
								style="background-image: url(${pageContext.request.contextPath}/resources/images/person_1.jpg)">
								<span
									class="quote d-flex align-items-center justify-content-center">
									<i class="icon-quote-left"></i>
								</span>
							</div>
							<div class="text text-center">
								<p class="mb-5 pl-4 line">Người ta thích rượu, thích trà. Em
									đây chỉ thích mua trái cây miền Tây thơm ngon, chất lượng ạ!</p>
								<p class="name">Nguyen Ngoc Tuan</p>
								<span class="position">Web Developer</span>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="testimony-wrap p-4 pb-5">
							<div class="user-img mb-5"
								style="background-image: url(${pageContext.request.contextPath}/resources/images/person_1.jpg)">
								<span
									class="quote d-flex align-items-center justify-content-center">
									<i class="icon-quote-left"></i>
								</span>
							</div>
							<div class="text text-center">
								<p class="mb-5 pl-4 line">Sầu riêng quá phê, ngon tê đầu
									lưỡi.</p>
								<p class="name">Nguyen Thi Hoa</p>
								<span class="position">Tester</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section bg-light">
	<div class="container">
		<div class="row no-gutters ftco-services">
			<div
				class="col-lg-3 text-center d-flex align-self-stretch ftco-animate">
				<div class="media block-6 services mb-md-0 mb-4">
					<div
						class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
						<span class="flaticon-shipped"></span>
					</div>
					<div class="media-body">
						<h3 class="heading">Free Shipping</h3>
						<span>On order over $100</span>
					</div>
				</div>
			</div>
			<div
				class="col-lg-3 text-center d-flex align-self-stretch ftco-animate">
				<div class="media block-6 services mb-md-0 mb-4">
					<div
						class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
						<span class="flaticon-diet"></span>
					</div>
					<div class="media-body">
						<h3 class="heading">Always Fresh</h3>
						<span>Product well package</span>
					</div>
				</div>
			</div>
			<div
				class="col-lg-3 text-center d-flex align-self-stretch ftco-animate">
				<div class="media block-6 services mb-md-0 mb-4">
					<div
						class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
						<span class="flaticon-award"></span>
					</div>
					<div class="media-body">
						<h3 class="heading">Superior Quality</h3>
						<span>Quality Products</span>
					</div>
				</div>
			</div>
			<div
				class="col-lg-3 text-center d-flex align-self-stretch ftco-animate">
				<div class="media block-6 services mb-md-0 mb-4">
					<div
						class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
						<span class="flaticon-customer-service"></span>
					</div>
					<div class="media-body">
						<h3 class="heading">Support</h3>
						<span>24/7 Support</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<jsp:include page="basefragments/footer.jsp"></jsp:include>
</body>
</html>