<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">

<style>
		:root {
			--primary-color: #82ae46;
			--text-color: #f8f9fa;
		}
		
		body {
			background-color: #f2f2f2;
			font-family: "Poppins", Arial, sans-serif;
			margin: 0;
			padding: 0;
			box-sizing: border-box;
			background-image:
				url("${pageContext.request.contextPath}/resources/images/imge_background_DK.jpg");
			/* Added single quotes around image URL */
			background-position: center center;
			background-repeat: no-repeat;
			background-attachment: fixed;
			background-size: cover;
			height: 100vh;
			margin: 0;
			padding: 0;
		}
		
		.sticky-header {
		    position: sticky;
		    top: 0;
		    z-index: 1000; /* Đảm bảo thanh header hiển thị trên các phần khác của trang */
		}
		
		.header {
			position: sticky;
			top: 0;
			z-index: 1;
		}
		
		.header-background {
			background-color: var(--primary-color);
			color: var(--text-color);
		}
		
		.main-Body {
			/* height: calc(100vh - 32px); */
			position: relative;
			width: 100%;
			/* background: url(../IMG/food-4k-jx0j7rqea6yv9phh.webp) top center/ cover no-repeat; */
		}
		
		.DK-Logo {
			display: flex;
			justify-content: center;
			align-items: center;
		}
		
		.text-logo {
			text-transform: uppercase;
			color: var(--text-color);
			font-weight: 800;
			font-size: 70px;
			line-height: inherit;
			white-space: nowrap;
			letter-spacing: -3px;
			text-decoration: none;
			border: 1px solid;
			padding: 5px 19px;
			line-height: normal;
		}
		
		.text-logo:hover {
			text-decoration: none;
			color: gray;
		}
		
		.DK-Body {
			padding-right: 2%;
		}
		
		.DK-Content {
			display: flex;
			justify-content: center;
			align-items: center;
			width: 100%;
			height: 100%;
			/* overflow: hidden; */
		}
		
		.text-muted {
			color: red;
		}
		
		.card {
			align-items: center;
			margin: 5%;
			width: 100%;
			padding: 20px;
			background-color: #fff;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
			border-radius: 10px;
			height: auto;
			margin: 25% 20px;
		}
		
		.btn-success {
			background-color: var(--primary-color);
			border: none;
			color: var(--text-color);
		}
	</style>
</head>

<body onload="countdown()">
	<header class = "sticky-header">
		<div class="header-background">
			<div class="py-1 d-flex justify-content-between">
				<div class="container">
					<div
						class="row no-gutters d-flex align-items-start align-items-center px-md-0">
						<div class="col-lg-12 d-block">
							<div class="row d-flex ju">
								<div class="col-md pr-4 d-flex topper align-items-center">
									<div class="icon mr-2">
										<i class="fa-solid fa-phone"></i>
									</div>
									<span class="text">+ 1235 2355 98</span>
								</div>
								<div
									class="col-md pr-4 d-flex topper justify-content-center align-items-center">
									<div
										class="icon mr-2 d-flex justify-content-center align-items-center">
										<i class="fa-solid fa-paper-plane"></i>
									</div>
									<span class="text">youremail@email.com</span>
								</div>
								<div
									class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right justify-content-end">
									<span class="text">3-5 Business days delivery & Free
										Returns</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<main class="main-Body">
		<div class="row p-0 m-0">
			<div class="col-8 DK-Logo">
				<a class="text-logo" href="${pageContext.request.contextPath}/index"> <span class="vegefoods-text">Vegefoods</span>
				</a>
			</div>
			<div class="col-4 DK-Body ">
				<div>
					<div class="DK-Content">
						<div class="card">
							<div class="card-body" style="width: 100%;">
								<c:if test="${sendCode == 'notyet' }">
									<form:form id="inforForm" action="${pageContext.request.contextPath}/forgot-password" method="post" modelAttribute="forgotPasswordForm">
										<h3 class="text-center">Forgot Password</h3>
										<div class="form-group">
											<label for="Email">Please enter email to go to the next step</label> 
											<div class="input-group mb-2">
												<form:input path="email" type="text" class="form-control" id="inlineFormInputGroup" placeholder="Email"/>
												<div class="input-group-prepend">
													<button id="submitEmail" type="submit" class="btn btn-secondary input-group-text">Send</button>
												</div>
											</div>
											<form:errors path="email" class="text-danger"></form:errors>
										</div>
										<div class="d-flex justify-content-between mb-3">
											<a class="text-muted" href="${pageContext.request.contextPath}/login"><small>Login</small></a>
											<a class="text-muted" href="${pageContext.request.contextPath}/register"><small>Register</small></a>
										</div>
									</form:form>
								</c:if>
								<c:if test="${sendCode == 'done' }">
									<div>
										<h3 class="text-center">Forgot Password</h3>
										<c:if test="${message != null }">
											<div class="alert alert-${messageColor }" role="alert">
												${message}
											</div>
										</c:if>
										<div class="form-group">
											<label for="Email">Email</label> 
											<form:form id="inforForm" action="${pageContext.request.contextPath}/forgot-password" method="post" modelAttribute="forgotPasswordForm" class="input-group mb-2">
												<form:input path="email" readonly="true" type="text" class="form-control" placeholder="Email"/>
												<div class="input-group-prepend">
													<button type="submit" id="resend" class="btn btn-secondary input-group-text rounded-right">Resend <div class="countdown pl-1" id="countdown">60</div></button>
												</div>
											</form:form>
										</div>
										<form:form id="forgotPasswordForm" action="${pageContext.request.contextPath}/forgot-password/check-verifycode" method="post" modelAttribute="forgotPasswordForm">
											<form:input path="email" type="hidden" class="form-control"/>
											<div class="form-group">
												<label for="verifyCode">Code</label> 
												<form:input path="verifyCode" type="text" class="form-control"/>
												<form:errors path="verifyCode" class="text-danger"></form:errors>
											</div>
											<div class="d-flex justify-content-between mb-3">
												<a class="text-muted" href="${pageContext.request.contextPath}/login"><small>Login</small></a>
												<a class="text-muted" href="${pageContext.request.contextPath}/register"><small>Register</small></a>
											</div>
											<div class="d-flex justify-content-center">
												<button id="submitCode" type="submit" class="btn btn-success">Submit</button>
											</div>
										</form:form>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
	<script>
	    function countdown() {
	      var count = 60;
	      var countdownElement = document.getElementById('countdown');
	      var resend = document.getElementById('resend');
	      
	      resend.disabled = true;
	      
	      var interval = setInterval(function() {
	        countdownElement.innerText = count;
	        count--;
	        
	        if (count < 0) {
	          clearInterval(interval);
	          countdownElement.innerText = "";
	          resend.disabled = false;
	        }
	      }, 1000);
	    }
	    
	    function hideError(element) {
	        element.parent().next(".text-danger").remove();
	    }
	    
	    function hideErrorForm(element) {
	        element.next(".text-danger").remove();
	    }
	
	    function submit(e) {
	        e.preventDefault();
	        $('#submitEmail').prop('disabled', true);
	        const email = $(this.email).val();
	        const emailElement = $(this.email);

	        if(email && email.match(/^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/)) {
	            hideError(emailElement);
	        } else {
	        	emailElement.parent().next(".text-danger").remove();
	        	emailElement.parent().parent().append(`
		          <div class="text-danger">Incorrect email format</div>
		        `);
	        }
	        
	        const isInvalid = !!$(".text-danger").length;
	      
	        if (isInvalid) {
	        	$('#submitEmail').prop('disabled', false);
	        	return;
	        }
	        console.log(this);
			this.submit();
	    }
	    
	    function submitForm(e) {
	        e.preventDefault();
	        $('#submitCode').prop('disabled', true);
	        const email = $(this.email).val();
	        const emailElement = $(this.email);
	        
	        const verifyCode = $(this.verifyCode).val();
	        const verifyCodeElement = $(this.verifyCode);

	        if(verifyCode) {
	            hideErrorForm(verifyCodeElement);
	        } else {
	        	verifyCodeElement.next(".text-danger").remove();
	        	verifyCodeElement.parent().append(`
		          <div class="text-danger">Can not be emply</div>
		        `);
	        }
	        
	        if(email && email.match(/^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/)) {
	            hideError(emailElement);
	        } else {
	        	emailElement.parent().next(".text-danger").remove();
	        	emailElement.parent().parent().append(`
		          <div class="text-danger">Incorrect email format</div>
		        `);
	        }
	        
	        const isInvalid = !!$(".text-danger").length;
	      
	        if (isInvalid) {
	        	$('#submitCode').prop('disabled', false);
	        	return;
	        }
	        console.log(this);
	        this.submit();
	    }
	    
	    $(document).ready(function(){
	        $("#inforForm").on("submit", submit);
	        $("#forgotPasswordForm").on("submit", submitForm);
	    })
  	</script>
</body>
</html>
