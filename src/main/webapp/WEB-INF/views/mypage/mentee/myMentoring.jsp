<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<link rel="stylesheet" href="/resources/css/myPage.css" />
<style>
#menteePage-mentoring .tab {
	display: flex;
	flex-wrap: wrap;
}

#menteePage-mentoring .tab button {
	margin: 0 0.5em;
	width: max-content;
}

#menteePage-mentoring .tab>div {
	width: max-content;
	margin: auto;
}

#menteePage-mentoring .flex-item {
	display: flex;
	flex-wrap: wrap;
}

#menteePage-mentoring .flex-wrap {
	display: flex;
	flex-wrap: wrap;
}

#menteePage-mentoring .flex-wrap * {
	padding: 0.2em;
}

#menteePage-mentoring .validate {
	display: none;
	color: var(- -accent-color);
	font-weight: bold;
	color: var(- -accent-color);
}

#menteePage-mentoring .apply-wrapper>div {
	padding: 0.5em 0;
}

#menteePage-mentoring .method-check {
	display: none;
}
</style>
<script src="/resources/js/summernote/summernote-lite.js"></script>
<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet"
	href="/resources/css/summernote/summernote-lite.css">
<div id="mypage-wrapper">
	<%@ include file="../../common/aside.jsp"%>
	<section id="mypage-mentoring-content">
		<div id="menteePage-mentoring">
			<div class="tab">
				<div>
					<button class="btn btn-outline-primary tablinks"
						onclick="openTab(event, 'check-ready')">승인 대기중</button>
				</div>
				<div>
					<button class="btn btn-outline-primary tablinks"
						onclick="openTab(event, 'pay-ready')">결제 대기중</button>
				</div>
				<div>
					<button class="btn btn-outline-success tablinks"
						onclick="openTab(event, 'show-mentoring')">현재 진행중</button>
				</div>
				<div>
					<button class="btn btn-outline-warning tablinks"
						onclick="openTab(event, 'record-mentoring')">들었던 멘토링 보기</button>
				</div>
			</div>


			<div id="show-mentoring" class="tabcontent">
				<div class="show-mentoring-list">
					<c:choose>
						<c:when test="${infoMento != null}">

							<c:forEach var="i" items="${infoMento }">
								<div class="flex-item">
									<!-- content 시작 -->
									<div style="padding-left: 1em; margin: auto 0;">
										<div class="mento_list_content_container">
											<!-- 제목 -->
											<strong class="mentoring_title"> 제목:
												${i.mentoring.mentoring_title } </strong>
											<!-- 가격 -->
											<div class="mentoring_price">
												<div class="product_price">
													<c:choose>
														<c:when test="${i.mentoring.mentoring_price != null}">
															<span> <!-- 가격표시 --> <strong> 가격:
																	${i.mentoring.mentoring_price}원 </strong>
															</span>
														</c:when>
														<c:otherwise>
															<span class="pay_price dark-font">${i.mentoring_price }</span>
														</c:otherwise>
													</c:choose>
												</div>
												<!-- 멘토링 생성 날짜 -->
												<strong class="mentoring_regdt"> 생성 날짜:
													${i.mentoring.mentoring_regDT } </strong>
													<!-- 결제  날짜 -->
												<strong class="mentee_redgt"> 결제 날짜:
													${i.mentee_regdt } </strong>
											</div>
										</div>

									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<h6>신청한 멘토링이 없습니다.</h6>
						</c:otherwise>
					</c:choose>
				</div>

			</div>

			<div id="check-ready" class="tabcontent">
				<div class="show-mentoring-list">
					<c:choose>
						<c:when test="${noCheck != null}">
							<c:forEach var="i" items="${noCheck }">
								<div class="flex-item">
									<!-- content 시작 -->
									<div style="padding-left: 1em; margin: auto 0;">
										<div class="mento_list_content_container">
											<div>
												<!-- 제목 -->
												<strong class="mentoring_title"> 제목:
													${i.mentoring.mentoring_title } </strong>
											</div>
											<div>
												<!-- 준비물 -->
												<span class="mentoring_materials gray-font"> 준비물:
													${i.mentoring.mentoring_materials } </span>
											</div>
											<div>
												<!-- 코멘트 -->
												<span class="mentoring_content gray-font"> 멘토의 코멘트:
													${i.mentoring.mentoring_content } </span>
											</div>
											<!-- 가격 -->
											<div class="mentoring_price">
												<div class="product_price">
													<c:choose>
														<c:when test="${i.mentoring.mentoring_price != null}">
															<span> <!-- 가격표시 --> <strong> 가격:
																	${i.mentoring.mentoring_price}원 </strong>
															</span>
														</c:when>
														<c:otherwise>
															<span class="pay_price dark-font">${i.mentoring.mentoring_price }</span>
														</c:otherwise>
													</c:choose>
												</div>
												<!-- 멘토링 생성 날짜 -->
												<strong class="mentoring_regdt"> 생성 날짜:
													${i.mentoring.mentoring_regDT } </strong>
													<!-- 결제  날짜 -->
												<strong class="mentee_redgt"> 결제 날짜:
													${i.mentee_regdt } </strong>
											</div>
										</div>

									</div>
									<div class="cancel_btn_container"
										style="padding-left: 1em; margin: auto 0;">
										<!-- 등록 취소 버튼 -->
										<button type="button" class="btn btn-info cancel-btn" style="color: white;"
											onclick="delMentoring(${i.mentee_seq})" >멘토링 삭제</button>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<h6>미승인된 멘토링이 없습니다.</h6>
						</c:otherwise>
					</c:choose>
				</div>

			</div>

			<div id="pay-ready" class="tabcontent">
				<div class="show-mentoring-list">
					<c:choose>
						<c:when test="${noPay != null}">

							<c:forEach var="i" items="${noPay }">
								<div class="flex-item">
									<!-- content 시작 -->
									<div style="padding-left: 1em; margin: auto 0;">
										<div class="mento_list_content_container">
											<div>
												<!-- 제목 -->
												<strong class="mentoring_title"> 제목:
													${i.mentoring.mentoring_title } </strong>
											</div>
											<div>
												<!-- 준비물 -->
												<span class="mentoring_materials gray-font"> 준비물:
													${i.mentoring.mentoring_materials } </span>
											</div>
											<div>
												<!-- 코멘트 -->
												<span class="mentoring_content gray-font"> 멘토의 코멘트:
													${i.mentoring.mentoring_content } </span>
											</div>
											<!-- 가격 -->
											<div class="mentoring_price">
												<div class="product_price">
													<c:choose>
														<c:when test="${i.mentoring.mentoring_price != null}">
															<span> <!-- 가격표시 --> <strong> 가격:
																	${i.mentoring.mentoring_price}원 </strong>
															</span>
														</c:when>
														<c:otherwise>
															<span class="pay_price dark-font">${i.mentoring.mentoring_price }</span>
														</c:otherwise>
													</c:choose>
												</div>
												<!-- 등록 날짜 -->
												<strong class="mentoring_regdt"> 생성 날짜:
													${i.mentoring.mentoring_regDT } </strong>
													<strong class="mentee_redgt"> 결제 날짜:
													${i.mentee_regdt } </strong>
											</div>
										</div>
										<a href="${path }/order/purchaseMentoring/${i.mentee_seq}" class="btn btn-danger">결제하러가기</a>
									</div>
									<div class="cancel_btn_container"
										style="padding-left: 1em; margin: auto 0;">
										<!-- 등록 취소 버튼 -->
										<button type="button" class="btn btn-info cancel-btn" style="color: white;"
											onclick="delMentoring(${i.mentee_seq})" >멘토링 삭제</button>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<h6>미결제된 멘토링이 없습니다.</h6>
						</c:otherwise>
					</c:choose>
				</div>

			</div>

			<div id="record-mentoring" class="tabcontent">
				<div class="show-mentee-list">
					<c:choose>
						<c:when test="${recordMento != null}">
							<c:forEach var="i" items="${recordMento }">
								<div class="flex-item">
									<!-- content 시작 -->
									<div style="padding-left: 1em; margin: auto 0;">
										<div class="mento_list_content_container">
											<div>
												<!-- 강좌 -->
												<span class="mentoring_course gray-font"> 강좌명:
													${i.course.course_NM } </span>
											</div>
											<div>
												<!-- 분야 -->
												<span class="mentoring_kinds gray-font"> 선택 분야:
													${i.kinds.kinds_name } </span>
											</div>
											<!-- 제목 -->
											<strong class="mentoring_title"> 제목:
												${i.mentoring_title } </strong>
											<!-- 가격 -->
											<div class="mentoring_price">
												<div class="product_price">
													<c:choose>
														<c:when test="${i.mentoring_price != null}">
															<span> <!-- 가격표시 --> <strong> 가격:
																	${i.mentoring_price}원 </strong>
															</span>
														</c:when>
														<c:otherwise>
															<span class="pay_price dark-font">${i.mentoring_price }</span>
														</c:otherwise>
													</c:choose>
												</div>
												<!-- 등록 날짜 -->
												<strong class="mentoring_regdt"> 생성 날짜:
													${i.mentoring_regDT } </strong>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<h6>기록된 멘토링 정보가 없습니다.</h6>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</section>
</div>
<script>
$(document).ready(function() {
	openTab(event, 'show-mentoring');
	if("${delete }" != null && "${delete }" != "" ){
		openTab(event, 'show-mentoring');
	}
});
function delMentoring(seq){
	$.ajax({
		url : "${path}/mypage/delMentoring",
		type : "post",
		dataType : "json",
		data : {"mentee_seq" : seq },
		success : function(data) {
			var result = data.result;
			var msg = data.msg;
			var link = data.link;
			var icon = data.icon;
			console.log(msg ,"+", result)
			if(result){
				Swal.fire({
					icon: icon,
					text: msg,
					showConfirmButton: false,
					timer : 1200
		            }).then((result) => {
		            	//location.href = "${path}/mypage/delMento";
		            	location.href = "${path}" + link;
		            });
			}
		}
		
	})
}
</script>

<script type="text/javascript">
	function openTab(evt, cityName) {
		var i, tabcontent, tablinks;
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className
					.replace(" active", "");
		}

		document.getElementById(cityName).style.display = "block";
		evt.currentTarget.className += " active";
	}
</script>

<%@ include file="../../common/footer.jsp"%>