<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
									<th>Customer ID</th>
									<th>Bill ID</th>									
									<th>Products</th>
									<th>Cost</th>
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
														<p>${mapUserProducts.get(bill.billId)[0].userId.userId}</p>														
													</td>
												
													<td>
														<p>${bill.billId}</p>
													</td>
													
													<td>
														<c:forEach items="${mapUserProducts.get(bill.billId)}" var="userProduct">
															<c:if test="${userProduct.quantity > 1}">
																<p>${userProduct.productId.productName} x${userProduct.quantity}</p>
															</c:if>												
															<c:if test="${userProduct.quantity == 1}">
																<p>${userProduct.productId.productName}</p>
															</c:if>		
														</c:forEach>	
													</td>
													
													<td>
														<c:set var="total1" value="0" />
														<c:forEach items="${mapUserProducts.get(bill.billId)}" var="userProduct">	
															<c:set var="subtotal" value="${userProduct.quantity * userProduct.productId.price}" />
    														<c:set var="total1" value="${total1 + subtotal}" />																																																														
														</c:forEach>
														<p><fmt:formatNumber value="${total1}" pattern="#,##0.00" />$</p>
													</td>					
													
													<td class="tick-remove">
														<button id="delete${bill.billId}" class="deleteBtn btn"><i class="icon icon-close cross-box" style="color:#EB3817"></i></button>
														<button id="update${bill.billId}" class="updateBtn btn"><i class="icon icon-check tick-box"></i></button>
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
				
						
						 
						
					</div>
					
				</div>
				<ul class="pagination mx-auto mt-4">
					<c:if test="${billpage.number > 1}">
						<li class="page-item"><a class="page-link" href="?page=${billpage.number - 1}">Previous</a></li>
			        </c:if>
		        	<li class="page-item"><a class="page-link" href="?page=${billpage.number}">${billpage.number + 1}</a></li>
		        	<c:if test="${currentPage < totalPages}">
			            <li class="page-item"><a class="page-link" href="?page=${billpage.number + 1}">Next</a></li>
			        </c:if>
		        </ul>
				
				
						 
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
	  $(document).ready(function() {
	    $('.deleteBtn').click(function() {
	    	console.log("clicked!!!");
	    	var billIdTemp = $(this).attr('id');
	    	var billId = billIdTemp.substring(6, billIdTemp.length - 1);
	    	
	    	var url = `${pageContext.request.contextPath}/history/${billId}`;
		    var choose = confirm("Delete Bill with billId " + billId);
	    	if (choose) {
	    		$.ajax({
	    	        url: url,
	    	        method: 'DELETE',
	    	        success: function(response) {
	    	            console.log(response);
	    	        },
	    	        error: function(xhr, status, error) {
	    	            console.error(error);
	    	        }
	    	      });	
	    	}
	    });
	  });
	</script>
</body>

</html>