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

<!-- <link rel="stylesheet" href="../Common/boostrap/bootstrap.min.css">
<link rel="stylesheet" href="../Common/fontAwesome/all.min.css">
<link rel="stylesheet" href="../Common/fontAwesome/brands.min.css">
<link rel="stylesheet" href="../Common/fontAwesome/regular.min.css">
<link rel="stylesheet" href="../Common/fontAwesome/solid.min.css">
<link rel="stylesheet" href="../CSS/style.css"> -->
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
							<div class="card-body">
								<form action="">
									<h3 class="text-center">Sign Up</h3>
									<div class="form-group">
										<label for="UserName">UserName</label> <input type="text"
											class="form-control" id="UserName"
											aria-describedby="UserNameHelp" placeholder="Enter userName">
										<small class="form-text text-danger" id="UserName-error"></small>
									</div>
									<div class="form-group">
										<label for="Email">Email</label> <input type="email"
											class="form-control" id="Email" aria-describedby="emailHelp"
											placeholder="Enter email"> <small
											class="form-text text-danger" id="Email-error"></small>
									</div>
									<div class="form-group">
										<label for="Password">Password</label> <input type="password"
											class="form-control" id="Password" placeholder="Password">
										<small class="form-text text-danger" id="Password-error"></small>
									</div>
									<div class="form-group">
										<label for="Confirm-password">Confirm password</label> <input
											type="password" class="form-control" id="Confirm-password"
											placeholder="Password"> <small
											class="form-text text-danger" id="Confirm-password-error"></small>
									</div>
									<small class="form-text text-muted">By clicking Sign
										Up, you agree to our Terms, Privacy Policy and Cookie Policy.
										You can receive our notifications via email and unsubscribe at
										any time.</small> <br>
									<div class="d-flex justify-content-between mb-3">
										<small>If you have account</small>
										<a class="text-muted" href="${pageContext.request.contextPath}/login"><small>Login</small></a>
									</div>
									<div class="d-flex justify-content-center">
										<button id="submit" class="btn btn-success">Register</button>
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
	<!-- <script src="../Common/fontAwesome/all.min.js"></script>
<script src="../Common/fontAwesome/brands.min.js"></script>
<script src="../Common/fontAwesome/regular.min.js"></script>
<script src="../Common/boostrap/bootstrap.min.js"></script>
<script src="../Common/boostrap/jquery-3.5.1.slim.min.js"></script>
<script src="../Common/boostrap/popper.min.js"></script>
<script src="../Common/boostrap/bootstrap.bundle.min.js"></script>
<script src="../Common/boostrap/bootstrap.min.js"></script>
<script src="../Common/jquery/jquery.min.js"></script>
<script src="../JS/validation.js"></script>
<script src="../JS/scr.js"></script> -->

	----------------------------------------------------------------------------------------------------------------------------
	--css:
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


	----------------------------------------------------------------------------------------------------------------------------
	--Jquery:
	<script>
		$(function() {
			$("#submit").click(function(event) {
				event.preventDefault(); // Prevent page reload
				let user = {
					UserName : $("#UserName").val(),
					Email : $("#Email").val(),
					Password : $("#Password").val(),
					ConfirmPassword : $("#Confirm-password").val(),
				};
				if (!validateForm()) {
					return;
				}
				console.log(user);
			});

			function validateEmail(email) {
				var regex = /^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6})*$/;
				return (email.trim().length !== 0) && regex.test(email);
			}

			function validatePassword(password) {
				var regex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
				return (password.trim().length !== 0) && regex.test(password);
			}

			function validateUsername(username) {
				var regex = /^[a-zA-Z0-9]{6,}$/;
				return (username.trim().length !== 0) && regex.test(username);
			}

			function validateConfirmPassword(password, confirmPassword) {
				return password === confirmPassword;
			}

			function validateForm() {
				var username = $("#UserName").val();
				var email = $("#Email").val();
				var password = $("#Password").val();
				var confirmPassword = $("#Confirm-password").val();
				if (!validateUsername(username)) {
					$("#UserName").css("border", "1px solid red");
					$("#UserName-error").text("Invalid username !!!").show();
				} else {
					$("#UserName").removeAttr("style");
					$("#UserName-error").hide();
				}
				if (!validateEmail(email)) {
					$("#Email").css("border", "1px solid red");
					$("#Email-error").text("Invalid email !!!").show();
				} else {
					$("#Email").removeAttr("style");
					$("#Email-error").hide();
				}
				if (!validatePassword(password)) {
					$("#Password").css("border", "1px solid red");
					$("#Password-error")
							.text(
									"Password must have at least 8 characters including letters and numbers !!!")
							.show();
				} else {
					$("#Password").removeAttr("style");
					$("#Password-error").hide();
				}
				if (!validateConfirmPassword(password, confirmPassword)) {
					$("#Confirm-password").css("border", "1px solid red");
					$("#Confirm-password-error").text(
							"Passwords do not match !!!").show();
				} else {
					$("#Confirm-password").removeAttr("style");
					$("#Confirm-password-error").hide();
				}
			}
			return true;
		});
	</script>
</body>
</html>
