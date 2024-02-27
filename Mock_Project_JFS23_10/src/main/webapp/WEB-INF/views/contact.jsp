<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <title>Vegefoods - Free Bootstrap 4 Template by Colorlib</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

      <jsp:include page="basefragments/header.jsp"></jsp:include>

	  <c:if test="${success == 'true'}">
	  <div class="alert alert-custome alert-success alert-dismissible fade show" role="alert">
	    <strong>Success!</strong>  Email sent successfully.
	    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	      <span aria-hidden="true">&times;</span>
	    </button>
	  </div>
	  </c:if>
	  <c:if test="${success == 'false'}">
	  <div class="alert alert-custome alert-danger alert-dismissible fade show" role="alert">
	    <strong>Failure!</strong> There was an error while sending Email.
	    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	      <span aria-hidden="true">&times;</span>
	    </button>
	  </div>
	  </c:if>
	  
	  
      <div class="hero-wrap hero-bread"
        style="background-image: url(${pageContext.request.contextPath}/resources/images/bg_1.jpg);">
        <div class="container">
          <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
              <p class="breadcrumbs"><span class="mr-2"><a href="/">Home</a></span> <span>Contact us</span></p>
              <h1 class="mb-0 bread">Contact us</h1>
            </div>
          </div>
        </div>
      </div>

      <section class="ftco-section contact-section bg-light">
        <div class="container">
          <div class="row d-flex mb-5 contact-info">
            <div class="w-100"></div>
            <div class="col-md-3 d-flex">
              <div class="info bg-white p-4 text-center">
                <p><span>Address:</span> </br> <a href="https://maps.app.goo.gl/bmLhAPBPAP1HmA6T7">FPT Complex Building,
                    Da Nang City</a></p>
              </div>
            </div>
            <div class="col-md-3 d-flex">
              <div class="info bg-white p-4 text-center">
                <p><span>Phone:</span> </br> <a href="tel:+84912698173">(+84) 912 698 173</a></p>
              </div>
            </div>
            <div class="col-md-3 d-flex">
              <div class="info bg-white p-4 text-center">
                <p><span>Email:</span> </br> <a href="mailto:info@yoursite.com">info@yoursite.com</a></p>
              </div>
            </div>
            <div class="col-md-3 d-flex">
              <div class="info bg-white p-4 text-center">
                <p><span>Website</span> </br> <a href="">yoursite.com</a></p>
              </div>
            </div>
          </div>
          <div class="row block-9">
            <div class="col-md-6 order-md-last d-flex">
              <form:form action="" method="POST" class="bg-white p-5 contact-form" modelAttribute="contact">
                <div class="form-group">
                  <form:input type="text" class="form-control" path="fullName" placeholder="Your Name" />
                  <form:errors class="text-danger" path="fullName"></form:errors>
                </div>
                <div class="form-group">
                  <form:input type="text" class="form-control" path="email" placeholder="Your Email" />
                  <form:errors class="text-danger" path="email"></form:errors>
                </div>
                <div class="form-group">
                  <form:input type="text" class="form-control" path="subject" placeholder="Subject" />
                  <form:errors class="text-danger" path="subject"></form:errors>
                </div>
                <div class="form-group">
                  <form:textarea name="" id="" cols="30" rows="7" class="form-control" path="message"
                    placeholder="Message"></form:textarea>
                  <form:errors class="text-danger" path="message"></form:errors>
                </div>
                <div class="form-group">
                  <input type="submit" value="Send Message" class="btn btn-primary py-3 px-5">
                </div>
              </form:form>

            </div>

            <div class="col-md-6 d-flex">

              <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d50140.39726279561!2d108.23749863252657!3d15.966171946782135!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314210f2d038af0f%3A0x51c64b1130497f99!2zRlBUIENvbXBsZXggxJDDoCBO4bq1bmc!5e0!3m2!1sen!2s!4v1708586191963!5m2!1sen!2s"
                width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"></iframe>

            </div>
          </div>
        </div>
      </section>

      <jsp:include page="basefragments/footer.jsp"></jsp:include>

      </body>

    </html>