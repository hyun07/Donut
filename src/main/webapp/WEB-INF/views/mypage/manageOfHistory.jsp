<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<link rel="stylesheet" href="/resources/css/myPage.css" />
<style>
</style>
<div id="mypage-wrapper">
	<%@ include file="../common/aside_admin.jsp"%>
	<section id="mypage-content">
		<div id="menteePage-history">
			<div class="container mt-3">
				<h2>멘토링 총 결제 현황</h2>
			</div>
			<form id="sell-list">
				<div class="container mt-3">
					<c:choose>
						<c:when test="${buy != null}">
							<c:forEach var="i" items="${buy }">
								<ul class="list-group list-group-flush">
									<li class="list-group-item">구매자 이름: ${i.buyer_name }</li>
									<li class="list-group-item">구매자 아이디: ${i.member_id }</li>
									<li class="list-group-item">판매자 아이디:
										${i.mentoring.member_id  }</li>
									<li class="list-group-item">결제 멘토링 제목 :
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
							<h4>결제 내역이 없습니다.</h4>
						</c:otherwise>
					</c:choose>
				</div>
			</form>
		</div>
	</section>
</div>









<%@ include file="../common/footer.jsp"%>