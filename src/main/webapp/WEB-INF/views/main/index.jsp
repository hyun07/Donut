<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.courses-slider .c-rating-star{
	display:inline-block;
	width : max-content;
	position: relative;
}
.courses-slider .real-star{
  position: absolute;
  z-index: 1;
  top: 0;
  left: 0;
  overflow: hidden;
  white-space: nowrap;
}
.courses-slider .bg-star {
  z-index: 0;
  padding: 0;
}
.main-search #suggestItem li:hover{
	background: #ccc;
}
</style>
<%@ include file="../common/header.jsp"%>
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="/resources/css/swiper.css" />
<link rel="stylesheet" href="/resources/css/main.css" />

<!-- 메인 광고 슬라이더 : 자동 재생 / hover시 정지 -->
<section class="main-slider">
	<div class="container-fluid">
		<div class="swiper autoSwiper">
			<div class="swiper-wrapper event-wrapper">
				<div class="swiper-slide autoPlay"
					style="background-color: #59cf92;">
					<div class="event-wrapper">
						<div class="event-image-01 event-image"></div>
						<div class="event-content-wrapper">
							<div class="event-content">
								<h2>우리는 성장기회의</h2>
								<h2>평등을 추구합니다.</h2>
							</div>
						</div>
					</div>
				</div>

				<div class="swiper-slide autoPlay"
					style="background-color: #001029;">
					<div class="event-wrapper">
						<div class="event-image-02 event-image"></div>
						<div class="event-content-wrapper">
							<div class="event-content">
								<h2 style="color: var(--white-color)">Merry Inflearn!</h2>

							</div>
						</div>
					</div>
				</div>

				<div class="swiper-slide autoPlay"
					style="background-color: #086397;">
					<div class="event-wrapper">
						<div class="event-image-03 event-image"></div>
						<div class="event-content-wrapper">
							<div class="event-content">
								<h2 style="color: var(--white-color)">나누는 지식만큼</h2>
								<h2 style="color: var(--white-color)">커지는 보람과 보상.</h2>
							</div>
						</div>
					</div>
				</div>

				<div class="swiper-slide autoPlay"
					style="background-color: #ff7836;">
					<div class="event-wrapper">
						<div class="event-image-04 event-image"></div>
						<div class="event-content-wrapper">
							<div class="event-content">
								<h2 style="color: var(--white-color)">나만 몰랐었던 이 강의~</h2>
							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-pagination"></div>
		</div>
	</div>
</section>

<!-- 메인 검색창 -->
<section class="main-search">
	<div class="container pt-5">
		<h3 style="text-align: center;">인프런에서 연봉을 올리세요</h3>
		<div class="main-search-wrapper" style="position: relative;">
			<form name="search-form" action="${path }/course/search" method="post">
				<div class="input-group mb-3">
					<input type="text" name="type" value="all" hidden="hidden">
					<input id="search-item" type="text" class="form-control" name="item"
						placeholder="배우고 싶은 지식을 입력해보세요">
					<button class="btn btn-primary" type="submit">
						<span class="white-font">검색</span>
					</button>
				</div>
			</form>
			<ul id="suggestItem" style="padding:0;text-align: center;position: absolute;background-color: white;width: 100%;border-radius: 1em;z-index: 100;">
			</ul>
		</div>
	</div>
</section>

<!-- 입문 강의 슬라이더 -->
<section class="start-courses-slider courses-slider">
	<div class="container pt-5">
		<div class="start-course-wrapper">
			<div class="header">
				<div class="coures_headder">
					<h3 class="title1">
						<a href="${path }/course?levle=입문">여기서
							시작해 보세요! <span class="icon"> <i class="fal fa-angle-right">&gt;</i>
						</span>
						</a>
					</h3>
					<p>이미 검증된 쉽고 친절한 입문 강의!!</p>
				</div>
			</div>
			<div class="swiper courseSwiper">
				<div class="swiper-wrapper course-wrapper">

					<c:if test="${courseMap.startCourses != null}">
						<c:forEach var="i" items="${courseMap.startCourses }">
							<div class="swiper-slide">
								<a href="${path }/course/${i.course_seq}">
									<div class="course">
										<img class="course-img" alt="강의 ${i.course_seq }"
											src="${path }/thumbnails?course_seq=${i.course_seq}&img_nm=${i.course_img_nm}"
											style="width: 300px;height:200px;object-fit:cover;border:none;border-radius: 1em;">
										<div class="course-content">
											<h5 class="dark-font">${i.course_NM }</h5>
											<h6 class="dark-font">${i.member_id }</h6>
											<div class="c-rating-star">
													<div class="star-wrapper bg-star">
														<span class="fa fa-star gray-font"></span> <span
															class="fa fa-star gray-font"></span> <span
															class="fa fa-star gray-font"></span> <span
															class="fa fa-star gray-font"></span> <span
															class="fa fa-star gray-font"></span>
													</div>
													<div class="star-wrapper real-star"
														style="width: <fmt:formatNumber type="number" maxFractionDigits="0" value="${i.course_rating.rate *20 }" />%;">
														<span class="fa fa-star checked"></span> <span
															class="fa fa-star checked"></span> <span
															class="fa fa-star checked"></span> <span
															class="fa fa-star checked"></span> <span
															class="fa fa-star checked"></span>
													</div>
											</div>
											<span class="c_rating_avg dark-font">(${i.course_rating.rate })</span>
											<c:choose>
											<c:when test="${i.course_sales_price != null && i.course_sales_price != 0}">
												<h6 class="dark-font">
													<span class="gray-font line-through" >${i.course_price }</span>
													${i.course_sales_price }
												</h6>
											</c:when>
											<c:when test="${i.course_price == 0}">
												<h6 class="dark-font">
													<strong>무료</strong>
												</h6>
											</c:when>
											<c:otherwise>
												<h6 class="dark-font">${i.course_price }</h6>
											</c:otherwise>
										</c:choose>
											<h6 class="badge bg-success" style="display: block;width: max-content;margin:auto;">+ ${i.course_studyCNT }명</h6>
										</div>
									</div>
								</a>
							</div>
						</c:forEach>
					</c:if>
				</div>
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</div>
		</div>
	</div>
</section>

<!-- 우리의 이야기 - 블로그 인기글 --><!-- 
<section class="hot-blog-contents">
	<div class="container pt-5">
		<h3>우리들의 이야기</h3>
		<div class="blod-wrapper row">
			<div class="col-lg-4">
				<div class="blog-image">블로그 이미지 1</div>
				<h4>글 제목</h4>
				<p>글 내용</p>
			</div>
			<div class="col-lg-4">
				<div class="blog-image">블로그 이미지 2</div>
				<h4>글 제목</h4>
				<p>글 내용</p>
			</div>
			<div class="col-lg-4">
				<div class="blog-image">블로그 이미지 3</div>
				<h4>글 제목</h4>
				<p>글 내용</p>
			</div>
		</div>
	</div>
</section> -->

<!-- 신규 강의 슬라이더 -->
<section class="new_courses_slider courses-slider">
	<div class="container pt-5">
		<div class="new-course-wrapper">
			<div class="header">
				<div class="coures_headder">
					<h3 class="title1">
						<a href="<%=request.getContextPath()%>/course"> 따끈따끈, 신규 강의를
							만나보세요!&zwj;🔥 <span class="icon"> <i
								class="fal fa-angle-right">&gt;</i>
						</span>
						</a>
					</h3>
				</div>
			</div>
			<div class="swiper courseSwiper">
				<div class="swiper-wrapper course-wrapper">
					<c:if test="${courseMap.newCourses != null}">
						<c:forEach var="i" items="${courseMap.newCourses }">
							<div class="swiper-slide">
								<a href="${path }/course/${i.course_seq}">
								<div class="course">
									<img class="course-img" alt="강의 ${i.course_seq }"
										src="${path }/thumbnails?course_seq=${i.course_seq}&img_nm=${i.course_img_nm}"
										style="width: 300px;height:200px;object-fit:cover;border:none;border-radius: 1em;">
									<div class="course-content">
										<h5 class="dark-font">${i.course_NM }</h5>
										<h6 class="dark-font">${i.member_id }</h6>
										<div class="c-rating-star">
													<div class="star-wrapper bg-star">
														<span class="fa fa-star gray-font"></span> <span
															class="fa fa-star gray-font"></span> <span
															class="fa fa-star gray-font"></span> <span
															class="fa fa-star gray-font"></span> <span
															class="fa fa-star gray-font"></span>
													</div>
													<div class="star-wrapper real-star"
														style="width: <fmt:formatNumber type="number" maxFractionDigits="0" value="${i.course_rating.rate *20 }" />%;">
														<span class="fa fa-star checked"></span> <span
															class="fa fa-star checked"></span> <span
															class="fa fa-star checked"></span> <span
															class="fa fa-star checked"></span> <span
															class="fa fa-star checked"></span>
													</div>
											</div>
											<span class="c_rating_avg dark-font">(${i.course_rating.rate })</span>
										<c:choose>
											<c:when test="${i.course_sales_price != null && i.course_sales_price != 0}">
												<h6 class="dark-font">
													<span class="gray-font line-through">${i.course_price }</span>
													${i.course_sales_price }
												</h6>
											</c:when>
											<c:when test="${i.course_price == 0}">
												<h6 class="dark-font">
													<strong>무료</strong>
												</h6>
											</c:when>
											<c:otherwise>
												<h6 class="dark-font">${i.course_price }</h6>
											</c:otherwise>
										</c:choose>
											<h6 class="badge bg-success" style="display: block;width: max-content;margin:auto;">+ ${i.course_studyCNT }명</h6>
										</div>
								</div>
								</a>
							</div>
						</c:forEach>
					</c:if>
				</div>
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</div>
		</div>
	</div>
</section>

<!-- 수강평 -->
<section class="review">
	<div class="container pt-5 review-container">
		<div class="review-content row">
			<div class="content-left col-md-6">
				<h1 class="dark-font">
					<span class="accent-font">${memberCount }</span> 명이 <br> 인프런과 함께합니다.
				</h1>
				<div class="text1">
					<p class="gray-font">
						학교에서 배우기 어렵거나 큰 비용을 <br> 지불해야만 배울 수 있는 전문적인 지식들을 제공합니다.<br>
						오픈 플랫폼의 이점을 통해 다양성과 경제성을 모두 높입니다.<br>
					</p>
				</div>
				<div class="buttons">
					<a class="btn btn-outline-primary" href="${path }/review/course"> <span>수강평
							더보기 </span><span class="icon"><i class="fal fa-angle-right"></i></span>
					</a>
				</div>
			</div>
			<div class="content-right col-md-6">
				<div class="swiper reviewSwiper">
					<div class="swiper-wrapper review-wrapper">
						<c:forEach items="${review }" var="i">
						<div id="review-${i.reviewSeq }" class="swiper-slide">
							<div class="review-content">
								<div class="star-wrapper mb-1">
									<c:forEach begin="1" end="5" step="1" var="num">
										<c:choose>
											<c:when test="${num <= i.rate }">
												<p class="star selected" ><span class="fa fa-star"></span></p>
											</c:when>
											<c:otherwise>
												<p class="star" ><span class="fa fa-star"></span></p>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<span>( ${i.rate }점 )</span>
								</div>
								<div class="content mb-1">
									${i.content }
								</div>
								<div class="info">
									<span>글쓴이 : ${i.memberNick } </span> <span>강의명 : <a href="${path }/course/${i.courseSeq}">${i.courseName }</a></span> 
									<br><span>작성일 : <fmt:formatDate value="${i.regDate }" pattern="yyyy년 MM월 dd일  HH:mm"/>  </span> 
								</div>
							</div>
							<div class="review-thumbnail">
								<a href="${path }/course/${i.courseSeq}"> <!-- 썸네일 --> <img
									class="img-thumbnail" alt="thumbnail"
									src="${path }/thumbnails?course_seq=${i.courseSeq}&img_nm=${i.courseImg}"
									style="width: 100px; height: 80px; object-fit: cover; border: none; border-radius: 1em;">
								</a>
							</div>
						</div>
					</c:forEach>
					</div>
					<div class="swiper-pagination"></div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- 지식 공유 알아보기 루트는 커뮤니티로 -->
<section class="another-service">
	<div class="container pt-5">
		<h3>다양한 서비스를 신청하세요.</h3>
		<p>인프런의 지식공유자 ˙ 비즈니스 ˙ 대학생 신청방법에 대해 알아보세요.</p>
		<div class="service-wrapper row p-2">
			<div class="col-lg-4 pt-5 wrapper">
				<div class="main-service p-3">
					<div class="main-service-content">
						<h4>지식공유자 되기</h4>
						<p class="gray-font">
							9개월간 온라인 기술 강의로만 1억원! <br> 나의 지식을 나눠 사람들에게 배움의 기회를 주고, <br>
							의미있는 대가를 가져가세요.
						</p>
					</div>
					<div class="main-service-button">
						<button type="button" class="btn btn-outline-primary" onclick="location.href='${path }/mypage/applyMentor'">
							지식 공유 참여
						</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4 pt-5 wrapper">
				<div class="main-service p-3">
					<div class="main-service-content">
						<h4>인프런 비즈니스 신청</h4>
						<p class="gray-font">
							모든 팀원의 인프런의 강의들을 자유롭게 <br> 학습하는 환경을 제공해주세요. <br> 업무 스킬에
							집중된 콘텐츠를 통해 <br> 최신 트렌드의 업무역량을 습득할 수 있습니다.
						</p>
					</div>
					<div class="main-service-button">
						<button type="button" class="btn btn-outline-primary">
							비즈니스 신청하기
						</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4 pt-5 wrapper">
				<div class="main-service p-3">
					<div class="main-service-content">
						<h4>인프런 X 대학생</h4>
						<p class="gray-font">
							학교와 인프런이 함께 하여, <br> 많은 학생 분들께 정해진 커리큘럼 <br> 이외에도 필요한
							학습을 보완하고, <br> 더욱 성장할 수 있도록 도와드립니다.
						</p>
					</div>
					<div class="main-service-button">
						<button type="button" class="btn btn-outline-primary">
							대학생 신청하기
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<script type="text/javascript">
var regex = / /gi;

 $(document).ready(function(){
	 var show = "${loginMember}";
	if(show){
		showLoginModal();
	}
 });
 function selectSearchItem(value){
	 location.href='${path}/course/'+value;
 }
 
 $("#search-item").on("input",function(){
	$("#suggestItem").children().remove();
	let val = $(this).val().trim();
	if(val == null || val == ""){
		return;
	}
	$.ajax({
		url:'${path}/course/suggestAjax',
		type: 'post',
		dataType:'json',
		data: { 'item' : val},
		success:function(data){
			$.each(data,function(){
				var item = $(this)[0];
				$("#suggestItem").append($("<li><button class='btn' type='button' onclick='selectSearchItem("+ item.course_seq +")'>"+ item.course_NM+"</button></li>"));
			});
		}
	});
	
 });
</script>

<script src="/resources/js/swiper.js"></script>

<%@ include file="../common/footer.jsp"%>