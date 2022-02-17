<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<link rel="stylesheet" href="/resources/css/myPage.css" />
<style>
</style>
<div id="mypage-wrapper">
			<%@ include file="../common/aside_mentor.jsp"%>
	<section id="mypage-content">
		<div id="menteePage-history">
			<div class="container mt-3">
				<h2>멘토링 현황</h2>
			</div>
			<form id="sell-list">
				<div class="container mt-3">
					<c:choose>
						<c:when test="${sale != null}">
							<c:forEach var="i" items="${sale }">
								<ul class="list-group list-group-flush">
									<li class="list-group-item">구매자 닉네임: ${i.buyer_name }</li>
									<li class="list-group-item">구매자 연락처: ${i.buyer_phoneNO }</li>
									<li class="list-group-item">구매자 이메일: ${i.buyer_email }</li>
									<li class="list-group-item">멘토링 제목 :
										${i.mentoring.mentoring_title }</li>
									<li class="list-group-item">결제 날짜 : ${i.orderDT }</li>
									<c:choose>
										<c:when test="${i.amounted_pay == 0}">
											<li class="list-group-item">무료</li>
											<input type="number" id="price" value="${i.amounted_pay }"
												hidden="hidden">
										</c:when>
										<c:otherwise>
											<li class="list-group-item">가격 : ${i.amounted_pay}원</li>
											<input type="number" id="price" value="${i.amounted_pay }"
												hidden="hidden">
										</c:otherwise>
									</c:choose>
								</ul>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<h4>판매 내역이 없습니다.</h4>
						</c:otherwise>
					</c:choose>
				</div>
			</form>
		</div>
	</section>
</div>









<%@ include file="../common/footer.jsp"%>