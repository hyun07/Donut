<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- ===========================================alert============================================== -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


<style>
a{
	color: #0d6efd;
	
}
a:hover{
text-decoration: none;
}
.men-container {
	padding: 0px;
	margin: 0px, 16px;
	border: 0px;
	background-color: #b9f1f1;
}

.men-container-img {
	margin: 0px;
	border: 0px;
	padding: 0px;
	background-image:
		url("../../../resources/images/mentor/mentors_banner_w.png");
	background-position: right 30%;
	background-repeat: no-repeat;
}

.men-text {
	margin-left: 0.75rem;
}

.men-container-img h1 {
	font-size: 20px;
	font-weight: 800;
	line-height: 1.46;
	margin-top: 50px;
}

.men-container-img p {
	margin-top: 0.75rem;
	letter-spacing: -.3px;
	font-size: 1rem;
	font-weight: 500;
	line-height: 1.5;
	display: block;
}

.is-hidden-tablet {
	display: none !important;
}

.main-center-container {
	display: flex;
}

/* .men-side-container {
	flex: 1;
} */

.men-center-container {
	flex: 5;
}

.men-side-container {
	margin-top: 10px;
}

#nav-cantainer {
	margin-left: 15px;
	width: max-content;
}

.navbar {
	position: sticky;
	top: 70px;
	padding: 0px;
}

.container mt-3 {
	min-width: 160px;
	max-width: 180px;
}

.form-select {
	padding: 0px;
	width: 150px;
	text-align: center;
}

@media ( min-width : 768px) {
	.col-md-3 {
		flex: 0 0 25%;
		max-width: 100%;
		padding: 0px;
	}
}

.card-body {
	padding: 0.5rem;
}

.card-body .stretched-link2 {
	text-align: center;
	padding: 8px;
}

.card {
	height: 530px !important;
}

.card-img-top {
	height: 168px !important;
}

.men-side-container {
	width: 340px !important;
}

.pull-center {
	margin-left: 50%;
}
/* TOP 버튼  */
#myBtn {
	display: none;
	position: fixed;
	bottom: 20px;
	right: 30px;
	z-index: 99;
	font-size: 18px;
	border: none;
	outline: none;
	background-color: #F2BF5E;
	color: white !important;
	cursor: pointer;
	padding: 15px;
	border-radius: 4px;
}

#myBtn:hover {
	background-color: #F1FBFD;
	color: red !important;
}

/* modal */
.w3-animate-zoom {
	width: 40%;
	height: 80%;
}

.chapter {
	overflow: auto;
	height: 80%;
}

.write-message #message-text {
	height: 100px;
}
/* 검색 */
.search_wrap {
	margin-top: 10px;
}

.search_bar {
	width: 200px;
	border-radius: 10px;
	text-align: center;
}

.search_btn {
	width: 30px;
	border-radius: 10px;
}
.can_btn{
height: 49.08px;
font-size: x-large;
color: white;
background-color: deepskyblue;
}
.app_btn{
    background-color: orange;
    color: white;
}
</style>
<!-- 전 페이지 -->
<main class="main-men-container">
	<!-- 상단 헤더 -->
	<section class="men-header">
		<div class="men-container">
			<div class="men-container-img">
				<div class="men-text container">
					<h1>멘토링</h1>
					<p>업계 선배들 혹은 동료들에게 도움을</p>
					<br class="is-hidden-tablet">
					<p>얻어보세요</p>
					<br class="is-hidden-tablet">
					<p>더 빨리, 더 멀리 갈 수 있어요.</p>
				</div>
			</div>

		</div>
	</section>

	<!-- Page center -->
	<section class="main-center-container">
		<!-- sticky nav bar -->
		<div class="men-side-container">
			<nav class="navbar bg-light" id="nav-cantainer">
				<div class="container-fluid">
					<ul class="navbar-nav">
						<li class="nav-item">
							<div class="search_wrap">
								<div class="search_area">
									<input type="text" name="keyword" class="search_bar"
										placeholder="멘토링 제목을 입력하세요." value="${pageMaker.cri.keyword }">
									<button class="search_btn">
										<i class="fas fa-search"></i>
									</button>
								</div>
							</div>
						</li>
						<li class="nav-item">
							<div class="container mt-3">
								<form>
									<p style="border-bottom: 1px solid black; text-align: center">
										<strong>분야 체크</strong>
									</p>
									<c:forEach items="${nav }" var="n">
										<div class="form-check">
											<input type="checkbox" class="form-check-input"
												name="option1" value="${n.kinds_seq }" checked> <label
												class="form-check-label" for="check1">${n.kinds_name }</label>
										</div>
									</c:forEach>
								</form>
							</div>
						</li>
					</ul>
				</div>
			</nav>
		</div>
		<!-- 멘토 프로필 -->
		<div class="grid-item grid-item-2">
			<div class="men-center-container">
				<div class="card-deck">
					<c:forEach items="${mentors}" var="item" varStatus="status">
						<div class="card-body text-center">
							<div class="col-md-3 container">
								<div class="card" style="width: 200px">
									<h4>멘토링 종류</h4>
									<p>${item.kinds.kinds_name}</p>
									<img class="card-img-top"
										src="${path }/profile?member_id=${item.member_id}&img_nm=${item.member.member_profile_img_nm}"
										alt="Card image" style="width: 100%">
									<div class="card-body">
										<h3 class="card-title">${item.member.member_nickNM }</h3>
										<h5 class="card-title">${item.mentoring_title }</h5>
										<hr>
										<p class="card-text">멘토 생성일 :${item. mentoring_regDT }</p>
										<hr>
										<div class="w3-container stretched-link">
											<c:choose>
												<c:when test="${user != null }">
													<button type="button"
														onclick="showModal('pModal${status.index }','intro${status.index }')"
														class="w3-button w3-blue stretched-link2">내용보기&amp;신청하기</button>
												</c:when>
												<c:otherwise>
													<button type="button" onclick="showLoginModal()"
														class="w3-button w3-blue stretched-link2">내용보기&amp;신청하기</button>
												</c:otherwise>
											</c:choose>

										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- 프로필 -->
					<!-- modal -->
					<c:forEach var="i" items="${mentors }" varStatus="status">
						<div id="pModal${status.index }" class="w3-modal">
							<div class="w3-modal-content w3-card-4 w3-animate-zoom">
								<header class="w3-container w3-blue">
									<span
										onclick="document.getElementById('pModal${status.index }').style.display='none'"
										class="w3-button w3-display-topright can_btn" >&times;</span>
									<h3>멘토링 소개</h3>
								</header>

								<div class="w3-bar w3-border-bottom">
									<button class="tablink w3-bar-item w3-button"
										onclick="openChapter(event, 'intro${status.index }')">소개</button>
									<button class="tablink w3-bar-item w3-button"
										onclick="openChapter(event, 'apply${status.index }')">신청하기</button>
								</div>

								<div id="intro${status.index }" class="w3-container chapter">

									<h3>자기소개</h3>
									<p>${i.mentoring_content}</p>
									<br>
									<h3>사전 준비물</h3>
									<p>${i.mentoring_materials}</p>
									<br>
									<hr>
									<h4>멘토의 한마디</h4>
									<p>${i.mentoring_comment}</p>
									<br>
									<p>
										<b>1회(시간당)가격 : ${i.mentoring_price}원</b>
									</p>
								</div>



								<div id="apply${status.index }" class="w3-container chapter">
									<form method="post" name="apply_form${status.index }">
										<input type='hidden' name='member_id'
											value='${user.member_id}'>
										<h3>신청하기</h3>
										<input type='hidden' name='mentoring_seq'
											value='${i.mentoring_seq }'> <br>
										<div class="select-date-time">
											<h3>날짜&amp;시간 선택</h3>
											<input type="datetime-local" name="mentee_regdt" class="mentee_regdt"/>
										</div>
										<span name="cf-dy"></span> <br>
										<div class="write-phoneNum">
											<h3>연락처(연락 가능한 번호)</h3>
											<input type="text" name="member_phoneNO"
												value="${user.member_phoneNO }"></input>
										</div>
										<span name="cf-pn"></span> <br>
										<div class="write-email">
											<h3>이메일(연락 가능한 이메일 주소)</h3>
											<input type="text" name="member_email"
												value="${user.member_email }" readonly></input>
										</div>
										<br>
										<div class="write-message">
											<h3>멘토에게 한마디</h3>
											<input type="text" name="mentee_comment"></input>
										</div>
										<br>
										<div class="important-message">
											<span><b>&#8251;</b>희망 날짜와 시간은 차후 멘토와 조율하게 될 수 있음을
												알려드립니다.</span>
										</div>
										<hr>
										<div class="w3-container w3-vivid-blue w3-padding">
											<button type="button"
												class="w3-button w3-right w3-padding app_btn"
												onclick="sendMenteePlan(apply_form${status.index },${i.mentoring_seq })">신청</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
	<!-- top 버튼 -->
	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
	<!-- 페이징 -->
	<section class="page-num-container">
		<div class="pull-center">
			<ul class="pagination">

				<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous"><a
						href="${pageMaker.startPage -1}">Previous</a></li>
				</c:if>

				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
						<a href="${num}"><b>${num}</b>&nbsp;&nbsp;&nbsp;</a>
					</li>
				</c:forEach>



				<c:if test="${pageMaker.next}">
					<li class="paginate_button next"><a
						href="${pageMaker.endPage +1 }">Next</a></li>
				</c:if>


			</ul>
		</div>

	</section>
	<!--  end Pagination -->
	<form name="actionForm" id='actionForm' action="/mentoring"
		method='get'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
	</form>

	<script>
		$(document).ready(
				function() {
					var actionForm = $("#actionForm");
					$(".paginate_button a").on(
							"click",
							function(e) {
								//일단 실행되고있는거 정지
								e.preventDefault();
								console.log('click');

								actionForm.find("input[name='pageNum']").val(
										$(this).attr("href"));
								actionForm.submit();
							});
					if ($("#mentee_regdt").val() == "") {
			            $("span[name=cf-dy]").text("시간과 날짜를 선택하여 주세요.").css("color","red");
			            return false;
				  	}
				 if ($("input[name=member_phoneNO]").val().trim() == "") {
					 $("span[name= cf-pn]").text("휴대폰 번호를 (-)를 제외하고 입력해주세요.").css("color","red");
					 return false;
				 }

				});

		var mybutton = document.getElementById("myBtn");
		window.onscroll = function() {
			scrollFunction()
		};
		function scrollFunction() {
			if (document.body.scrollTop > 20
					|| document.documentElement.scrollTop > 20) {
				mybutton.style.display = "block";
			} else {
				mybutton.style.display = "none";
			}

		};

		function topFunction() {
			document.body.scrollTop = 0;
			document.documentElement.scrollTop = 0;
		};
		/* 모달 */
		function showModal(modal, tab) {
			document.getElementById(modal).style.display = 'block';
			openChapter(event, tab);

		}
	/* 시간의 기본 설정 */
		
		let regdt_length = document.getElementsByClassName('mentee_regdt').length;
		console.log(regdt_length);
		console.log(document.getElementsByClassName('mentee_regdt')[0]);
		console.log(new Date());
		console.log(new Date().toISOString());
		let offset = new Date().getTimezoneOffset() * 60000;
		let today = new Date(Date.now() - offset).toISOString().slice(0,-8);
		console.log(today);
		for(let i = 0; i < regdt_length; i ++ ){
			
			document.getElementsByClassName('mentee_regdt')[i].value= today;
		}

		function openChapter(evt, chapterNM) {
			var i, x, tablinks;
			x = document.getElementsByClassName("chapter");
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablink");
			for (i = 0; i < x.length; i++) {
				tablinks[i].classList.remove("w3-light-grey");
			}
			document.getElementById(chapterNM).style.display = "block";
			evt.currentTarget.classList.add("w3-light-grey");
		}
		/* 검색 */
		  $(".search_area button").on("click", function(e){
		        e.preventDefault();
		        let val = $("input[name='keyword']").val();
		        $("form[name='actionForm']").find("input[name='keyword']").val(val);
		        $("form[name='actionForm']").find("input[name='pageNum']").val(1);
		        actionForm.submit();
		    });
	</script>

	<script>
	$("input[name=member_phoneNO]").keyup(function(){
	 	var phone = $("input[name='member_phoneNO']").val();
		var regPhone = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
 	if (regPhone.test(phone)) {
    	$("span[name=cf-pn]").text("입력되었습니다.").css("color","black");  	
  }else{

	  $("span[name=cf-pn]").text("입력된 형식이 다릅니다.").css("color","purple");
	  return false;
  }
});
						function sendMenteePlan(obj,seq) {
							console.log("obj >>>>> ", obj);
							console.log("seq >>>>>", seq);
							console.log(".serialize() >>>>> ", $(obj)
									.serialize());
							let params = $(obj).serialize();
							$
									.ajax({
										type : "POST",
										url : "/mentoring", //데이터 전송받는 특정 주소
										dataType : "json",
										data : params,
										contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
										success : function(data) {
											//data == map
											var result = data.result;
											var link = data.link;
											var msg = data.msg;
											var icon = data.icon;
											console.log("msg>>>>>>>>>>>>>", msg);
												Swal.fire({
  												icon: icon,
  												html: msg,
  												showConfirmButton: false,
  												timer : 1200
									            }).then((result) => {
									            	location.href = '${path}' + link;
									            });
											}
									});
						} 
	</script>

</main>


<%@ include file="../common/footer.jsp"%>