<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<body>
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
								<form id="inforForm" action="${pageContext.request.contextPath}/j_spring_security_check" method="post">
									<h3 class="text-center">Login</h3>
									<div class="form-group">
										<label for="UserName">UserName</label> 
										<input name="username" type="text"
											class="form-control" id="UserName" placeholder="UserName">
									</div>
									<div class="form-group">
										<label for="Password">Password</label> 
										<input name="password" type="password"
											class="form-control" id="Password" placeholder="Password">
									</div>
									<div class="form-group form-check">
										<input name="remember-me" type="checkbox" class="form-check-input">
										<label class="form-check-label" for="checkbox" style="font-size: 14px;">Remember Me</label>
									</div>
									<div class="d-flex justify-content-between mb-3">
										<a class="text-muted" href="${pageContext.request.contextPath}/forgot-password"><small>Forgot password</small></a>
										<a class="text-muted" href="${pageContext.request.contextPath}/register"><small>Register</small></a>
									</div>
									<div class="d-flex justify-content-center">
										<button type="submit" id="submit" class="btn btn-success">Login</button>
									</div>
								</form>
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
		function hideError(element) {
	        element.next(".text-danger").remove();
	    }
	
	    function submit(e) {
	        e.preventDefault();
	        
	        const username = $(this.username).val();
	        const usernameElement = $(this.username);
	        
	        const password = $(this.password).val();
	        const passwordElement = $(this.password);
	        
	        const checkbox = $(".type:checked").val();
	        const checkboxElement = $(".type:checked");
	
	        if(username){
	            hideError(usernameElement);
	        } else {
	        	usernameElement.next(".text-danger").remove();
	        	usernameElement.parent().append(`
		          <div class="text-danger">Can not be empty</div>
		        `);
	        }
	        
	        if(password){
	            hideError(passwordElement);
	        } else {
	        	passwordElement.next(".text-danger").remove();
	        	passwordElement.parent().append(`
		          <div class="text-danger">Can not be empty</div>
		        `);
	        }
	
	        const isInvalid = !!$(".text-danger").length;
	      
	        if (isInvalid) {
	          return;
	        }
	        $(this).unbind('submit').submit();
	    }
	    $(document).ready(function(){
	        $("#inforForm").on("submit", submit);
	    })
	</script>	
</body>
</html>
