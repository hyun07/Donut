<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<link rel="stylesheet" href="/resources/css/myPage.css" />
<style>
#mentoPage-mentoring .tab {
	display: flex;
	flex-wrap: wrap;
}

#mentoPage-mentoring .tab button {
	margin: 0 0.5em;
	width: max-content;
}

#mentoPage-mentoring .tab>div {
	width: max-content;
	margin: auto;
}

#mentoPage-mentoring .flex-item {
	display: flex;
	flex-wrap: wrap;
}

#mentoPage-mentoring .flex-wrap {
	display: flex;
	flex-wrap: wrap;
}

#mentoPage-mentoring .flex-wrap * {
	padding: 0.2em;
}

#mentoPage-mentoring .validate {
	display: none;
	color: var(- -accent-color);
	font-weight: bold;
	color: var(- -accent-color);
}

#mentoPage-mentoring .apply-wrapper>div {
	padding: 0.5em 0;
}

#mentoPage-mentoring .method-check {
	display: none;
}
</style>
<script src="/resources/js/summernote/summernote-lite.js"></script>
<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet"
	href="/resources/css/summernote/summernote-lite.css">
<div id="mypage-wrapper">
	<%@ include file="../../common/aside_mentor.jsp"%>
	<section id="mypage-mentoring-content">
		<div id="mentoPage-mentoring">
			<div class="tab">
				<div>
					<button class="btn btn-outline-primary tablinks"
						onclick="openTab(event, 'show-mentoring')">내가 등록한 멘토링 보기</button>
				</div>
				<div>
					<button class="btn btn-outline-primary tablinks"
						onclick="openTab(event, 'show-mentee')">멘티보기(승인&amp;결제
						완료)</button>
				</div>
				<div>
					<button class="btn btn-outline-success tablinks"
						onclick="openTab(event, 'no-check-mentee')">미승인(결제완료)</button>
				</div>
				<div>
					<button class="btn btn-warning tablinks"
						onclick="openTab(event, 'apply-mentoring')">멘토링 등록하기</button>
				</div>
			</div>

			<div id="apply-mentoring" class="tabcontent">
				<h5 style="padding: 1em 0; font-weight: bold;">멘토링 등록 구현</h5>
				<!-- 멘토링 등록 구현 -->

				<div class="apply-wrapper">
					<!-- 본인 강좌 선택 -->
					<div class="course-select">
						<div class="flex-wrap">
							<div class="name">
								<h6>
									<strong>등록된 강좌</strong>
								</h6>
							</div>
							<select id="cs_list" name="cs_list">
								<option value="" disabled="disabled" hidden=""
									selected="selected">강좌</option>
								<option value="0" label="선택안함"></option>
								<c:forEach items="${courseList }" var="cl">
									<option value="${cl.course_seq }" label="${cl.course_NM }">
								</c:forEach>
							</select>
							<div id="cs_selected"></div>
						</div>
					</div>
					<!-- 멘토링 분류 번호 선택  -->
					<div class="kinds-select">
						<p id="kinds-check" class="validate">멘토링을 분류할 번호를 하나 선택해 주세요.</p>
						<p id="kinds-check-null" class="validate">분야를 하나 선택해 주세요.</p>
						<div class="flex-wrap">
							<div class="name">
								<h6>
									<strong>멘토링 분야</strong>
								</h6>
							</div>
							<select id="kinds_list" name="kinds_list">
								<option value="" disabled="disabled" hidden=""
									selected="selected">분야</option>
								<c:forEach items="${applyMentoList }" var="k">
									<c:forEach items="${k.k_list }" var="i">
										<option value="${i.kinds_seq}" label="${i.kinds_name}">
									</c:forEach>
								</c:forEach>
							</select>
							<div id="k_selected"></div>
						</div>
					</div>
					<!-- 판매 방식 -->
					<div class="mentoring-sell">
						<div class="flex-wrap">
							<div class="name">
								<h6>
									<strong>판매 방식</strong>
								</h6>
							</div>
							<div>
								<button id="free" type="button"
									class="btn btn-outline-info sell-btn" data-check="N"
									value="free">무료</button>
							</div>
							<div>
								<button id="pay" type="button"
									class="btn btn-outline-warning sell-btn" data-check="N"
									value="false">유료</button>
							</div>
						</div>
					</div>
					<!-- 판매 금액 -->
					<div class="mentoring-price">
						<p id="price-check-null" class="validate">가격을 입력해주세요.</p>
						<div class="flex-wrap">
							<div class="name">
								<h6>
									<strong>판매 금액</strong>
								</h6>
							</div>
							<p id="sell-method-check" style="color: red;">
								<strong>판매방식을 선택하세요.</strong>
							</p>
							<div class="price method-check method-free-check">
								<input name="mentoring_price" id="mentoring_price_free"
									type="number" size="10" placeholder="무료" disabled="disabled" />
							</div>
							<div class="price method-check method-sell-check">
								<input name="mentoring_price" id="mentoring_price" type="number"
									size="10" placeholder="유료" />
							</div>
						</div>
					</div>
					<!-- 멘토링 타이틀 -->
					<div class="mentoring-title">
						<p id="title-check" class="validate">멘토링 제목을 입력해 주세요.(max
							33글자)</p>
						<p id="title-check-null" class="validate">멘토링 제목을 입력하세요.</p>
						<div class="flex-wrap">
							<div class="name">
								<h6>
									<strong>멘토링 타이틀</strong>
								</h6>
							</div>
							<input id="mentoring_title" type="text" maxlength="33" size="60"
								name="mentoring_title" placeholder="제목">
						</div>

						<p id="null-check" class="validate">모든 정보를 입력하셔야 합니다.</p>

					</div>
					<!-- 멘토&멘토링 소개 -->
					<div class="mentoring-intro-contents">
						<div class="flex-wrap">
							<div class="name">
								<h6>
									<strong>멘토&amp;멘토링 소개</strong>
								</h6>
							</div>
						</div>
						<div class="flex-wrap">
							<textarea id="summernote1" name="mentoring_intro"></textarea>
						</div>
					</div>
					<!-- 준비물 -->
					<div class="mentoring-intro-materials">
						<div class="flex-wrap">
							<div class="name">
								<h6>
									<strong>멘토링에 필요한 준비물</strong>
								</h6>
							</div>
						</div>
						<div class="flex-wrap">
							<textarea id="summernote2" name="mentoring_materials"></textarea>
						</div>
					</div>
					<!-- 멘토의 한마디 -->
					<div class="mentoring-intro-comment">
						<div class="flex-wrap">
							<div class="name">
								<h6>
									<strong>멘토의 한마디</strong>
								</h6>
							</div>
						</div>
						<div class="flex-wrap">
							<textarea id="summernote3" name="mentoring_comment"></textarea>
						</div>
					</div>
				</div>
				<!-- 강의 등록 구현 END -->
				<button id="m-submit" class="btn btn-primary" type="button">멘토링
					신청</button>
			</div>

			<div id="show-mentoring" class="tabcontent">
				<div class="show-mentoring-list">
					<c:choose>
						<c:when test="${applyMentoList != null}">
							<c:forEach var="i" items="${applyMentoList }">
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
									<div class="cancel_btn_container"
										style="padding-left: 1em; margin: auto 0;">
										<!-- 등록 취소 버튼 -->
										<button type="button" class="btn btn-danger cancel-btn"
											onclick="cancelMentoring(${i.mentoring_seq})">멘토링 삭제</button>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<h6>등록한 멘토링이 없습니다.</h6>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<div id="show-mentee" class="tabcontent">
				<div class="show-mentee-list">
					<c:choose>
						<c:when test="${appliedMenteeList != null}">
							<c:forEach var="i" items="${appliedMenteeList }">
								<div class="flex-item">
									<!-- content 시작 -->
									<div style="padding-left: 1em; margin: auto 0;">
										<div class="mentee_list_content_container">
											<!-- 제목 -->
											<strong class="mentee_mentoring_title"> 제목:
												${i.mentoring.mentoring_title } </strong> <br>
											<!-- 닉네임 -->
											<strong class="mentee_member_nickNM"> 닉네임:
												${i.member.member_nickNM } </strong> <br>
											<!-- 이메일 -->
											<strong class="mentee_member_email"> 이메일:
												${i.member_email } </strong> <br>
											<!-- 전화번호 -->
											<strong class="mentee_member_phoneNO"> 전화번호:
												${i.member_phoneNO } </strong> <br>
											<!-- 멘토에게 한마디 -->
											<strong class="mentee_mentee_comment"> 희망사항:
												${i.mentee_comment } </strong> <br>
											<!-- 신청한 희망날짜 -->
											<strong class="mentee_mentee_regdt"> 희망 날짜&amp;시간:
												${i.mentee_regdt } </strong> <br>
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

											</div>

										</div>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<h6>멘티가 없습니다.</h6>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<div id="no-check-mentee" class="tabcontent">
				<div class="show-mentee-list">
					<c:choose>
						<c:when test="${noCheckMentee != null}">
							<c:forEach var="i" items="${noCheckMentee }">
								<div class="flex-item">
									<!-- content 시작 -->
									<div style="padding-left: 1em; margin: auto 0;">
										<div class="mentee_list_content_container">
											<!-- 제목 -->
											<strong class="mentee_mentoring_title"> 제목:
												${i.mentoring.mentoring_title } </strong> <br>
											<!-- 닉네임 -->
											<strong class="mentee_member_nickNM"> 닉네임:
												${i.member.member_nickNM } </strong> <br>
											<!-- 이메일 -->
											<strong class="mentee_member_email"> 이메일:
												${i.member_email } </strong> <br>
											<!-- 전화번호 -->
											<strong class="mentee_member_phoneNO"> 전화번호:
												${i.member_phoneNO } </strong> <br>
											<!-- 멘토에게 한마디 -->
											<strong class="mentee_mentee_comment"> 희망사항:
												${i.mentee_comment } </strong> <br>
											<!-- 신청한 희망날짜 -->
											<strong class="mentee_mentee_regdt"> 희망 날짜&amp;시간:
												${i.mentee_regdt } </strong> <br>
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
											</div>
										</div>
									</div>
									<div class="cancel_btn_container"
										style="padding-left: 1em; margin: auto 0;">
										<!-- 승인버튼 -->
										<button type="button" class="btn btn-danger check-btn"
											onclick="checkMentee(${i.mentee_seq})">멘티 승인</button>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<h6>미승인 멘티가 없습니다.(결제완료)</h6>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</section>
</div>
<script type="text/javascript">
$(document).ready(function() {
	openTab(event, 'apply-mentoring')
	/* if("${apply }" != null && "${apply }" != "" ){
		openTab(event, 'show-mentoring');
	}else if("${cancel }" != null && "${cancle }" != "" ){
		openTab(event, 'show-mentee');
	}else if("${consent }" != null && "${consent }" != "" ){
		openTab(event, 'no-check-mentee');
	}else{
		openTab(event, 'apply-mentoring');
	} */
		$('#summernote1').summernote({
			placeholder : '내용을 작성하세요.',
			minHeight : 400,
			maxHeight : 700,
			maxWidth : 600,
			minWidth : 320
		});
		$('#summernote2').summernote({
			placeholder : '내용을 작성하세요.',
			minHeight : 100,
			maxHeight : 200,
			maxWidth : 600,
			minWidth : 320
		});
		$('#summernote3').summernote({
			placeholder : '내용을 작성하세요.',
			minHeight : 100,
			maxHeight : 200,
			maxWidth : 600,
			minWidth : 320
		});
		/* ready끝 */
	});
	// 정가 판매시
	$("#pay").on("click", function() {
		if ($(this).data("check") == "N") {
			$(this).data("check","Y");
			$(this).prop("disabled", true);
			$(".method-free-check").css("display", "none");
			$(".method-sell-check").css("display", "block");
			$("#sell-method-check").css("display", "none");
		}
		if ($("#free").data("check") =="Y") {
			$("#free").data("check","N");
			$("#free").prop("disabled", false);
		}
	});
	
	// 무료 판매시
	$("#free").on("click", function() {
		if ($(this).data("check") == "N") {
			$(this).data("check","Y");
			$(this).prop("disabled", true);
			$(".method-free-check").css("display", "block");
			$(".method-common-check").css("display", "none");
			$("#sell-method-check").css("display", "none");
		}
		if ($("#pay").data("check") =="Y") {
			$("#pay").data("check","N");
			$("#pay").prop("disabled", false);
		}
	});
	// 정가 form validation
	$("#mentoring_price_pay").on("input",function() {
		$(this).val($(this).val().replace(/[^0-9.]/g, "").replace(/(\..*)\./g, "$1"));
	});
	// 멘토링 제목 33글자 넘게 입력시
	$("#mentoring_title").on("input",function(){
		if($(this).val().length > 33){
			$("#title-check").css("display","block");
		}else{
			$("#title-check").css("display","none");
		}
	});
	// submit
	$("#m-submit").on("click", function() {
		var ks = $('#kinds_list').val();
		if(ks == null || ks == " "){
			$("#kinds-check-null").css("display","block");
			$("#kinds_list").focus();
			return false;
		}
		var isSell;
		$(".sell-btn").each(function(){
			if($(this).data("check") == "Y"){
				isSell = $(this).val();
			}	
		});
		if(isSell == undefined){
			alert("판매 방식을 설정하세요.");
			return false;
		};
		/* 무료 */
		var price;
		if(isSell == 'free'){
			price = 0;
		/* 유료 */
		}else if(isSell == 'false'){
			if(isNull("mentoring_price")){
				alert("가격를 입력하세요.");
				$("#mentoring_price").focus();
				return false;
			}else{
				price = parseInt($("#mentoring_price").val());
			}
		};
		
	
	var course = $('#cs_list').val();
	var kinds = $('#kinds_list').val();
	var title = $('#mentoring_title').val();
	var intro = $('#summernote1').val();
	var materials = $('#summernote2').val();
	var comment = $('#summernote3').val(); 
	var objParam = {
					"member_id" : "${user.member_id}",
					"course_seq" : course,
					"kinds_seq" : kinds,
					"mentoring_title" : title,
					"mentoring_price" : price,
					"mentoring_content" : intro,
					"mentoring_materials" : materials,
					"mentoring_comment" : comment,
		};  
		console.log("objParam>>>>>" , objParam);
		$.ajax({
			type:"post",
			url:"${path}/mypage/applyMentoring",
			dataType: "json",
			contentType: "application/json; charset=utf-8",
			data : JSON.stringify(objParam),
			success: function(data){
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
			            	location.href = "${path}" + link;
			            });
				}
			}
			
		})
	});
	function isNull(id){
		var item = document.getElementById(id).value;
		if(item == null || item == ""){
			return true;
		}else{
			return false;
		}
	};
	
	function cancelMentoring(seq){
		$.ajax({
			url : "${path}/mypage/cancelMentoring",
			type : "post",
			dataType : "json",
			data : {"mentoring_seq" : seq },
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
			            	//showRePageCancel();
			            	location.href = "${path}" + link;
			            });
				}
			}
		})
	};
	function checkMentee(seq){
		$.ajax({
			url : "${path}/mypage/consentMentee",
			type : "post",
			dataType : "json",
			data : {"mentee_seq" : seq },
			success : function(data) {
				var result = data.result;
				var msg = data.msg;
				var link = data.link;
				console.log(msg ,"+", result)
				if(result){
					Swal.fire({
						icon: 'success',
						text: msg,
						showConfirmButton: false,
						timer : 1200
			            }).then((result) => {
			            	//showRePageConsent();
			            	location.href = "${path}" + link;
			            });
				}
			}
		})
	};
</script>

<script type="text/javascript">
/* function showRePageApply(){
	location.href = "${path}/mypage/applyMento";
}
function showRePageCancel(){
	location.href = "${path}/mypage/cancelMento";
}
	function showRePageConsent(){
		location.href = "${path}/mypage/consentMento";
	} */
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
	};
</script>

<%@ include file="../../common/footer.jsp"%>