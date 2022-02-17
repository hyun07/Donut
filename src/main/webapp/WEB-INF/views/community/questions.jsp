<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="/resources/css/community.css" />

<!-- summernote -->
<script src="/resources/js/summernote/summernote-lite.js"></script>
<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet"
	href="/resources/css/summernote/summernote-lite.css">


<main id="main" class="community_main">

	<section class="community_header">
		<div class="community_header_content">
			<h2 class="community_header_title">묻고 답해요</h2>
			<p class="community_header_sub-title">65만명의 커뮤니티!! 함께 토론해봐요.</p>
		</div>
	</section>
	<section class="community_body">
		<nav class="community_body_navigation">
			<ul class="navigation">
				<li class="navigation_group">
					<h6 class="navigation_group_name">함께 공부해요</h6>
					<ul class="navigation_menu_list">
						<li class="navigation_menu navigation_menu-selected"><a
							href="/community/questions"> <span>질문 & 답변</span>
						</a></li>
						<li class="navigation_menu"><a href="/community/chats"> <span>자유주제</span>
						</a></li>
						<li class="navigation_menu"><a href="/community/studies">
								<span>스터디</span>
						</a></li>
					</ul>
				</li>
			</ul>
		</nav>
		<div class="community_body_content">
			<div class="search-filter">
				<ul class="nav nav-tabs status">
					<li><a class="nav-link active" data-bs-toggle="tab" href="${path }/community/questions">전체</a></li>
					<!-- <li><a class="nav-link" data-bs-toggle="tab" href="javascript:unsolved();">미해결 </a></li> -->
					<li><a class="nav-link" data-bs-toggle="tab" href="${path}/community/category">미해결 </a></li>
					<li><a class="nav-link" data-bs-toggle="tab" href="javascript:solved();">해결됨 </a></li>
				</ul>
				<form class="search">
					<div class="search-item">
						<div class="ac-input-with-item">
							<i class="fa fa-search"></i> <input type="text"
								placeholder="궁금한 질문을 검색해보세요!">
						</div>
						<button class="ac-button search-btn" style="min-width: 96px">검색</button>
					</div>
					<!-- search-item end -->
					<div class="search-item refresh-item">
						<div class="ac-input-with-item">
							<i class="fa fa-hashtag"></i> <input type="text"
								placeholder="태그로 검색해보세요!">
						</div>
						<button class="ac-button reset-btn" style="min-width: 96px">
							<i class='fas fa-sync'></i> 초기화
						</button>
					</div>
				</form>
			</div>
			<!-- search-filter end -->
			<div class="question-list-container">
				<div class="d-flex justify-content-between post-containere-header">
					<ul class="order-pc">
						<li class="e-order active"><button class="ac-button" onclick="">최신순</button></li>
						<li class="e-order"><button class="ac-button" onclick="">최근답변순</button></li>
						<li class="e-order"><button class="ac-button" onclick="">답변많은순</button></li>
					</ul>
					<div></div>
					<div class="writebtn">
					<c:choose>
						<c:when test="${user != null }">
						<button class="ac-button" id="write-btn" style="min-width: 96px">
							<i class='fas fa-pen'></i> 글쓰기
						</button>
						</c:when>
						<c:otherwise>
						<button class="ac-button" onclick="showLoginModal()" style="min-width: 96px">
							<i class='fas fa-pen'></i> 글쓰기
						</button>
						</c:otherwise>
					</c:choose>
						
					</div>
				</div>
				<!-- 게시글 목록 -->
				<div class="main-list" id="js-load">
				<ul class="question-list" id="more-list">
					<c:forEach items="${cmnlist }" var="cmn">
						<li class="question-container js-load" ><a href="${path }/community/${cmn.community_seq}">
								<div class="question">
									<div class="question_info">
										<div class="question_title">
											<h3 class="title_text">
												<c:out value="${cmn.community_title }" />
											</h3>
										</div>
										<div class="question_body">
											${cmn.community_contents }
										</div>
										<div class="question_tags">
											<c:forEach items="${cmn.cmtg_list }" var="cmtag">
											<button class="ac-button tags-btn">
												<span class="ac-tag-hashtag">#&nbsp;</span>
												<span class="ac-tag-name"><c:out value="${cmtag.tag_NM }"></c:out></span>
											</button>
											</c:forEach>
										</div>
										<div class="question_info-footer">
											<fmt:formatDate value="${cmn.community_regDT }"
												pattern="yyyy/MM/dd" />
										</div>
									</div>
									<div class="question_additional_info">
										<div class="commnet_content">
											<span class="comment_count"></span> <span
												class="comment_description">답변</span>
										</div>
									</div>
								</div>
						</a></li>
					</c:forEach>
				</ul>
				</div>
			</div>
			<!-- 더보기 버튼 -->
			<div class="more-btn-div" id="js-btn-wrap" align="center">
			<hr>
			<a id="more-btn-a" href="javascript:moreList();" class="Mbtn">더보기(More)</a>
			<hr>
			</div>
		</div>
		<!-- community_body_content end -->
		<div class="posts-pop-tags"></div>
	</section>

</main>

<!-- 글쓰기 모달 -->
<div class="com-modal" id="write-modal" style="display: none">
	<div class="com-dimmed"></div>
	<section class="modal-card question-modal">
		<form class="question-modal-form" id="cmForm"
			enctype="multipart/form-data" method="post">
			<div class="modal-card-body">
				<div class="form-item form-item-type">
					<label class="form-label">커뮤니티</label>
					<div class="cm-radiobox">
						<div class="question-modal_type">
							<input type="radio" class="question-modal_type" id="question"
								name="community_roll" value="질문답변" checked> <label
								class="form-check-label" for="question">질문</label>
						</div>
						<div class="question-modal_type">
							<input type="radio" class="question-modal_type" id="chat"
								name="community_roll" value="자유주제"> <label
								class="form-check-label" for="chat">자유주제</label>
						</div>
						<div class="question-modal_type">
							<input type="radio" class="question-modal_type" id="study"
								name="community_roll" value="스터디"> <label
								class="form-check-label" for="study">스터디</label>
						</div>
					</div>
					<input hidden="hidden" id="member_id" name="member_id"
						value="${user.member_id }">
				</div>
				<div class="form-item">
					<label class="form-lable" for="community_title">제목</label>
					<div class="ac-input-with-item">
						<input type="text" id="cm_title" name="community_title"
							placeholder="제목을 입력해주세요.">
					</div>
				</div>
				<div class="form-item">
					<label class="form-lable" for="cmtg_list">태그</label>
					<div class="ac-input-with-item question-modal-tag">
						<i class="fa fa-hashtag"></i>
						<div id="tags_btn_list" style="display: flex;" ></div>
						<input type="text" id="tags" placeholder="태그 설정해주세요." onkeyup="tagchange(this)" name="cmtg_list">

					</div>
					<span class="input-tags-description">최대 3개의 태그를 달 수 있어요!</span>
				</div>
				<div class="form-item">
					<label class="form-lable" for="community_contents">내용</label>
					<textarea class="summernote" name="community_contents"
						id="summernote"></textarea>
				</div>
			</div>
			<footer class="modal-card-foot">
				<span id="alert"></span>
				<button class="ac-button question-modal-button-cancel"
					id="modal-cancel" type="button">취소</button>
				<button class="ac-button question-modal-button-submit"
					id="createSubmit" type="button">저장</button>
			</footer>
		</form>
	</section>
</div>

<script>
	//써머노트
	$('.summernote').summernote({
		placeholder : "학습 관련 질문을 남겨주세요. 상세히 작성하면 더 좋아요!",
		minHeight : 300,
		focus : true
	});
	
	//글쓰기 버튼 누를때(user가 붙어 있을 경우)
	$('#write-btn').click(function() {
		$('#write-modal').css('display', 'block');
	});
	
	//태그 포커스 나갈때
	$('#tags').blur(function () {
		var input = $('#tags').val();
		console.log(input);
		if(input == null || input == ''){
			$('#tags').val("");
		}else{
			$('.ac-tag').each(function () {
				if($(this).data('tgName') == input){
					var target = $(".ac-tag[data-tg-name='" + input + "']");
					target.remove();
				}
			});	
			$('#tags_btn_list').append(
					$('<button class="ac-button ac-tag" onClick="tagclose('
							+ "'"
							+ input
							+ "'"
							+ ')" data-tg-name="'
							+ input
							+ '"><span class="ac-tag-name">'
							+ input
							+ '</span><span style="width: 6; height: 6;">&times;</span></button>'));
			$('#tags').val("");
		}
		var tags = $('#tags_btn_list').children().length;
		if (tags >= 3) {
			$('.input-tags-description').css('color', 'red');
			$('#tags').prop("disabled", true);
		}
	});
	
	//태그 만들기
	 function tagchange(obj) {
		 var str_space = /\s/; // 공백 체크
			if (str_space.exec(obj.value)) { // 공백 체크
				/* alert("해당 항목에는 공백을 사용할 수 없습니다.\n\n공백 제거됩니다."); */
				obj.focus();
				obj.value = obj.value.replace(' ', ''); // 공백제거       
				return false;
			}
		 
		var str_tag = /,/g;
		if (str_tag.exec(obj.value)) {
			/* alert("버튼 만들기 시작"); */
			var tagList = obj.value.replace(',', '');
			
			 $('.ac-tag').each(function () {
				 /* alert($(this).data('tgName')); */
				if($(this).data('tgName') == tagList){
					/* alert("중복 있음"); */
					obj.focus();
					$('#tags').val("");
					var target = $(".ac-tag[data-tg-name='" + tagList + "']");
					target.remove();
				}
			});	
			 /* alert("중복없음"); */
				$('#tags_btn_list').append(
						$('<button class="ac-button ac-tag" onClick="tagclose('
								+ "'"
								+ tagList
								+ "'"
								+ ')" data-tg-name="'
								+ tagList
								+ '"><span class="ac-tag-name">'
								+ tagList
								+ '</span><span style="width: 6; height: 6;">&times;</span></button>'));
				obj.focus();
				$('#tags').val("");
			return false;
		}

		var tags = $('#tags_btn_list').children().length;
		if (tags >= 3) {
			$('.input-tags-description').css('color', 'red');
			$('#tags').prop("disabled", true);
		}

	}

	//생성된 태그버튼 삭제
	function tagclose(obj) {
		var target = $(".ac-tag[data-tg-name='" + obj + "']");
		target.remove();
		var limit_list = $('#tags_btn_list').children().length;
		if (limit_list < 3) {
			$('.input-tags-description').css('color', 'gray');
			$('#tags').prop("disabled", false);
		}
	}

	//모달 취소시 내용 비우기
	$('#modal-cancel').click(function() {
		$('#cmForm')[0].reset();
		$('#tags_btn_list').children().remove();
		$("#community_contents").css("background-color", "none");
		$("#cm_title").css("background-color", "none");
		$("#alert").text("");
		$('#summernote').summernote('code', '');
		$('#write-modal').css("display", "none");
	});

	//모달 버튼 누르기
	$("#createSubmit").click(
			function() {
				/* 제목 null 체크 */
				if ($("#cm_title").val().trim() == "") {
					$("#alert").text("제목을 입력해주세요.").css("color", "red");
					$("#cm_title").css("border-color", "var(--accent-color)");
					$("#cm_title").focus();
					return false;
				}
				/* 내용 null체크 */
				if ($('#summernote').summernote('isEmpty')) {
					$("#alert").text("내용을 입력해주세요.").css("color", "red");
					$('#summernote').summernote('focus')
					return false;
				}

				/* 태그 리스트 넣기 */
				var tags = new Array();

				$('#tags_btn_list').children().each(function() {
					tags.push($(this).data("tgName"));
				});

				console.log(tags);
				var param;
				if (tags.length == 0) {
					param = {
						"member_id" : $("#member_id").val(),
						"community_roll" : $("input[name=community_roll]")
								.val(),
						"community_title" : $("input[name=community_title]")
								.val(),
						"community_contents" : $(
								"textarea[name=community_contents]").val()
					};
				} else {
					param = {
						"member_id" : $("#member_id").val(),
						"community_roll" : $("input[name=community_roll]").val(),
						"community_title" : $("input[name=community_title]").val(),
						"community_contents" : $("textarea[name=community_contents]").val(),
						"tag_name_list" : tags
					};

					console.log(param);

					
				}
				$.ajax({
					type : "post",
					url : "${path }/community/createPost",
					contentType : "application/json; charset=UTF-8",
					data : JSON.stringify(param),
					dataType : "json",
					success : function(data) {
						var msg = data.msg;
						alert(msg);
						location.reload();
					},
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					   }
				});
				
			});

	/* 더보기  */
	$(window).on('load', function() {
		load('#js-load', '20');
		$("#js-btn-wrap .Mbtn").on("click", function() {
			load('#js-load', '20', '#js-btn-wrap');
		})
	});

	function load(id, cnt, btn) {
		var girls_list = id + " .js-load:not(.active)";
		var girls_length = $(girls_list).length;
		var girls_total_cnt;
		if (cnt < girls_length) {
			girls_total_cnt = cnt;
		} else {
			girls_total_cnt = girls_length;
			$('#js-btn-wrap').hide()
		}
		$(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
	};
	
	$(document).ready(function() {

		var msg = "${mssg}";

		if(msg != ""){
		alert(msg);	
		}

	});
	
	function unsolved() {
		$.ajax({
			type : "get",
			url : "${path}/community/questions?commumity_status=",
			data : {community_seq : community_seq},
			success : function (data) {
				$('#commumity_status').html(data);
			}
		});
	}
</script>


<%@ include file="../common/footer.jsp"%>