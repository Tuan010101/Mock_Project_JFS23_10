<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Vegefoods - History</title>
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

	<section class="ftco-section">
		<div class="container">
						<table class="table">
							<thead class="thead-primary">
								<tr>
									<th>ID</th>
									<th>Address</th>
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
									<c:forEach items="${bills}" var="bill" varStatus="loopCounter">
										
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
												<c:set var="total" value="0" />
												<c:forEach items="${bill.userProducts}" var="userProduct">
													<c:set var="maxDiscountPercent" value="0" />
													<c:forEach var="productDiscount" items="${userProduct.productId.productDiscounts}">
														<c:if
															test="${!bill.buyDate.isBefore(productDiscount.discount.startDiscountDate) && !bill.buyDate.isAfter(productDiscount.discount.endDiscountDate)}">
															<c:set var="maxDiscountPercent"
																value="${Math.max(maxDiscountPercent, productDiscount.discount.discountPercent)}" />
														</c:if>
													</c:forEach>
													
													<p>${userProduct.productId.productName } x ${userProduct.quantity}</p>
													<c:set var="subtotal" value="${userProduct.quantity * userProduct.productId.price * (100-maxDiscountPercent) / 100}" />
  													<c:set var="total" value="${total + subtotal}" />
												</c:forEach>						
											</td>
											<td>
												<p><fmt:formatNumber value="${total}" pattern="#,##0.00" />$</p>
											</td>																			
											<td>
												<c:if test="${bill.status == 1}">
													<p>Chờ xác nhận</p>
												</c:if>
												<c:if test="${bill.status == 2}">
													<p>Chờ lấy hàng</p>
												</c:if>
												<c:if test="${bill.status == 3}">
													<p>Đang giao</p>
												</c:if>
												<c:if test="${bill.status == 4}">
													<p>Giao thành công</p>	
												</c:if>
												<c:if test="${bill.status == 5}">
													<p>Giao thất bại</p>
												</c:if>
												<c:if test="${bill.status == 6}">
													<p>Hủy đơn</p>
												</c:if>
											</td>							
											<td>
												<c:if test="${bill.status == 1}">
													<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modalDelete${loopCounter.count }">
													  Cancel
													</button>
													
													<!-- Modal -->
													<div class="modal fade" id="modalDelete${loopCounter.count }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
													  <div class="modal-dialog" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <form action="${pageContext.request.contextPath}/user/history/delete/bill/${bill.billId }" method="post">
														      <div class="modal-body">
														        <p>Are you sure about delete the bill with id ${bill.billId}?</p>
														      </div>
														      <div class="modal-footer">
														        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
														        <button type="submit" class="btn btn-danger">Delete</button>
														      </div>
													      </form>
													    </div>
													  </div>
													</div>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</tr>
							</tbody>
						</table>
		    <c:if test="${billPage.totalPages > 1}">
			    <nav aria-label="Page navigation">
			        <ul class="pagination justify-content-center">
			            <c:if test="${billPage.hasPrevious()}">
			                <li class="page-item">
			                    <a class="page-link" href="?page=${billPage.number - 1}" aria-label="Previous">
			                        <span aria-hidden="true">&laquo;</span>
			                        <span class="sr-only">Previous</span>
			                    </a>
			                </li>
			            </c:if>
			            <c:forEach begin="0" end="${billPage.totalPages - 1}" step="1" var="i">
			                <li class="page-item">
			                    <c:choose>
			                        <c:when test="${billPage.number eq i}">
			                            <span class="page-link">${i + 1}</span>
			                        </c:when>
			                        <c:otherwise>
			                            <a class="page-link" href="?page=${i}">${i + 1}</a>
			                        </c:otherwise>
			                    </c:choose>
			                </li>
			            </c:forEach>
			            <c:if test="${billPage.hasNext()}">
			                <li class="page-item">
			                    <a class="page-link" href="?page=${billPage.number + 1}" aria-label="Next">
			                        <span aria-hidden="true">&raquo;</span>
			                        <span class="sr-only">Next</span>
			                    </a>
			                </li>
			            </c:if>
			        </ul>
			    </nav>
			</c:if>
		</div>
	</section>

	<jsp:include page="basefragments/footer.jsp"></jsp:include>
</body>

</html>