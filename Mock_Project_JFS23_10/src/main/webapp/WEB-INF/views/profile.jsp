<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Vegefoods - Profile</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<style>
.form-control {
	border: 1px solid #cfd1d8;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px;
	font-size: .825rem;
	background: #ffffff;
	color: #2e323c;
}
</style>
<jsp:include page="basefragments/header.jsp"></jsp:include>

<div style="background-color: #82ae46;">
	<div class="container pt-5 pb-5">
		<div class="row gutters">	
			<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
				<div class="card h-100">
					<div class="card-body">
						<div class="account-settings">
							<div class="row user-profile">
								<div class="col-12 user-avatar text-center pb-3">
									<img width="50%"
										src="https://bootdey.com/img/Content/avatar/avatar7.png"
										class="rounded-circle" alt="Not yet image">
								</div>
								<h5 class="col-12 text-center user-name">${appUserForm.fullName }</h5>
							</div>
							<div class="about text-center">
								<h5>About</h5>
								<div>Phone: ${appUserForm.phoneNumber }</div>
								<div>Address: ${appUserForm.address }</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
				<div class="card h-100">
					<form:form id="inforForm" action="${pageContext.request.contextPath}/user/profile" method="post" modelAttribute="profileForm" class="card-body">
						<div class="row gutters">
							<div id="response" class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							</div>
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<h6 class="mb-2 text-primary">Personal Details</h6>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="fullName">Full Name</label> 
									<form:input path="fullName" type="text"
										class="form-control" id="fullName"
										placeholder="Enter full name"/>
									<form:errors path="fullName" class="text-danger"></form:errors>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
<!-- 									<label for="image">Image</label> -->
<%-- 									<form:input path="image" type="file" accept="image/*" class="form-control-file"/> --%>
<%-- 									<form:errors path="image" class="text-danger"></form:errors> --%>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="email">Email</label><br>
									<div class="d-flex justify-content-between">
										<label for="phone">${appUserForm.email }</label> 
										<c:if test="${appUserForm.status == 0 }">
											<div class="d-flex">
												<a class="text-warning" href="#" data-toggle="modal" data-target="#modalEmail">Change</a>
												<div class="pr-1 pl-1">|</div>
												<a class="text-warning" href="${pageContext.request.contextPath}/user/active/email">Active email</a>
											</div>
										</c:if>
									</div>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="phoneNumber">Phone</label> 
									<form:input path="phoneNumber" type="text"
										class="form-control"
										placeholder="Enter phone number"/>
									<form:errors path="phoneNumber" class="text-danger"></form:errors>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="phone">Password</label> <br>
									<div class="d-flex justify-content-between">
										<label for="phone">${appUserForm.password }</label> 
										<a href="#" data-toggle="modal" data-target="#modalPass">Change password</a>
									</div>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="phone">Address</label> 
									<form:input path="address" type="text"
										class="form-control"
										placeholder="Enter address"/>
									<form:errors path="address" class="text-danger"></form:errors>
								</div>
							</div>
						</div>
						<div class="row gutters">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<div class="text-right">
									<button id="submitInfor" type="submit" class="btn btn-primary">Update</button>
								</div>
							</div>
						</div>
					</form:form>
					<!-- Modal Change Password-->
					<div class="modal fade" id="modalPass" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">Change Password</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <form action="${pageContext.request.contextPath}/user/profile/change-password" method="post">
						      <div class="modal-body">
						          <div id="groupCurrentPassword" class="form-group">
						            <label for="currentPassword" class="col-form-label">Current Password</label>
						            <input id="currentPassword" name="currentPassword" type="password" class="form-control"/>
						          </div>
						          <div class="form-group">
						            <label for="newPassword" class="col-form-label">New Password</label>
						            <input id="newPassword" name="newPassword" type="password" class="form-control"/>
						          </div>
						          <div class="form-group">
						            <label for="rePassword" class="col-form-label">Confirm Password</label>
						            <input id="rePassword" name="rePassword" type="password" class="form-control">
						          </div>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						        <button id="submitPassword" type="submit" class="btn btn-primary">Save changes</button>
						      </div>
					      </form>
					    </div>
					  </div>
					</div>
					
					<!-- Modal Change Email-->
					<div class="modal fade" id="modalEmail" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">Change Email</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <form id="submitEmail" action="${pageContext.request.contextPath}/user/profile/change-email" method="post">
						      <div class="modal-body">
						          <div id="groupEmail" class="form-group">
						            <label for="email" class="col-form-label">Email</label>
						            <input id="email" name="email" type="text" class="form-control"/>
						          </div>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						        <button id="submitEmail" type="submit" class="btn btn-primary">Save changes</button>
						      </div>
					      </form>
					    </div>
					  </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="basefragments/footer.jsp"></jsp:include>

<script>
	function hideError(element) {
	        element.next(".text-danger").remove();
	    }
	
	function submit(e) {
        e.preventDefault();
        $('#submitInfor').prop('disabled', true);
        const fullName = $(this.fullName).val();
        const fullNameElement = $(this.fullName);
        
        const phoneNumber = $(this.phoneNumber).val();
        const phoneNumberElement = $(this.phoneNumber);
        
        const address = $(this.address).val();
        const addressElement = $(this.address);

        if(fullName){
            hideError(fullNameElement);
        } else {
        	fullNameElement.next(".text-danger").remove();
        	fullNameElement.parent().append(`
	          <div class="text-danger">Can not be empty</div>
	        `);
        }
        
        if(phoneNumber && phoneNumber.match(/(0|84|\+84)\d{9}/)){
            hideError(phoneNumberElement);
        } else {
        	phoneNumberElement.next(".text-danger").remove();
        	phoneNumberElement.parent().append(`
	          <div class="text-danger">The phone number is not in the correct format</div>
	        `);
        }
        
        if(address){
            hideError(addressElement);
        } else {
        	addressElement.next(".text-danger").remove();
        	addressElement.parent().append(`
	          <div class="text-danger">Can not be empty</div>
	        `);
        }

        const isInvalid = !!$(".text-danger").length;
      
        if (isInvalid) {
        	$('#submitInfor').prop('disabled', false);
        	return;
        }
        this.submit();
    }
	
	    function submitChangePass(e) {
	        e.preventDefault();
	        $('#submitPassword').prop('disabled', true);
	        const currentPassword = $(this.currentPassword).val();
	        const currentPasswordElement = $(this.currentPassword);
	        
	        const newPassword = $(this.newPassword).val();
	        const newPasswordElement = $(this.newPassword);
	        
	        const rePassword = $(this.rePassword).val();
	        const rePasswordElement = $(this.rePassword);

	        if(currentPassword){
	            hideError(currentPasswordElement);
	        } else {
	        	currentPasswordElement.next(".text-danger").remove();
	        	currentPasswordElement.parent().append(`
		          <div class="text-danger">Can not be empty</div>
		        `);
	        }
	        
	        if(newPassword){
	            hideError(newPasswordElement);
	        } else {
	        	newPasswordElement.next(".text-danger").remove();
	        	newPasswordElement.parent().append(`
		          <div class="text-danger">Can not be empty</div>
		        `);
	        }
	        
	        if(rePassword && newPassword == rePassword){
	            hideError(rePasswordElement);
	        } else {
	        	rePasswordElement.next(".text-danger").remove();
	        	rePasswordElement.parent().append(`
		          <div class="text-danger">Passwords are not the same</div>
		        `);
	        }
	
	        const isInvalid = !!$(".text-danger").length;
	      
	        if (isInvalid) {
	        	$('#submitPassword').prop('disabled', false);
	          return;
	        }
	        this.submit();
	    }
	    
	    function submitChangeEmail(e) {
	        e.preventDefault();
	        $('#submitEmail').prop('disabled', true);
	        const email = $(this.email).val();
	        const emailElement = $(this.email);
	        
	        if(email && email.match(/^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/)) {
	            hideError(emailElement);
	        } else {
	        	emailElement.next(".text-danger").remove();
	        	emailElement.parent().append(`
		          <div class="text-danger">Incorrect email format</div>
		        `);
	        }
	
	        const isInvalid = !!$(".text-danger").length;
	      
	        if (isInvalid) {
	        	$('#submitEmail').prop('disabled', false);
	          return;
	        }
	        this.submit();
	    }
	    
	    $(document).ready(function(){
	        $("#inforForm").on("submit", submit);
	        $("#changePasswordForm").on("submit", submitChangePass);
	        $("#submitEmail").on("submit", submitChangeEmail);
	        
	        var x;
	        var sPageURL = window.location.search.substring(1);
	        var sURLVariables = sPageURL.split('?');
	        for (var i = 0; i < sURLVariables.length; i++) {
	            var sParameterName = sURLVariables[i].split('=');
	            if (sParameterName[0] === "status") {
	                x = sParameterName[1];
	                console.log(x)
	                break;
	            }
	        }
	        if (x === "change_profile_success") {
	            $("#response").html("<div class='alert alert-success' role='alert'>Information changed successfully!</div>").fadeIn(200).fadeOut(7000)
	            return;
	        } else if (x === "send_active_code") {
	        	$("#response").html("<div class='alert alert-success' role='alert'>The verification code has been sent to your email. Please check your email!</div>").fadeIn(200).fadeOut(10000)
	        	return;
	        } else if (x === "change_email_success") {
	        	$("#response").html("<div class='alert alert-success' role='alert'>Email changed successfully!</div>").fadeIn(200).fadeOut(7000)
	        	return;
	        } else if (x === "change_email_fail") {
	        	$('#modalEmail').modal('show');
	        	$('#groupEmail').append("<div class='text-danger'>Email already exists</div>");
	        	return;
	        } else if (x === "change_password_success") {
	        	$("#response").html("<div class='alert alert-success' role='alert'>Password changed successfully!</div>").fadeIn(200).fadeOut(7000)
	        	return;
	        } else if (x === "incorrect_password") {
	        	$('#modalPass').modal('show');
	        	$('#groupCurrentPassword').append("<div class='text-danger'>Incorrect Password</div>");
	        	return;
	        }
	    })
	</script>
</body>
</html>