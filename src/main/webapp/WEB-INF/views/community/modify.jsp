<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="/resources/css/communityDetail.css" />

<!-- summernote -->
<script src="/resources/js/summernote/summernote-lite.js"></script>
<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet"
	href="/resources/css/summernote/summernote-lite.css">



<main class="comm-detail">
<form action="/community/modify" method="post" id="modifyForm">
<input type="hidden" id="community_seq" value="${community.community_seq }" />
	<section class="post-detail_section post-detail_post">
		<div class="community-post-info">
			<!--  제목,작성자이름,작성시각,에디터 -->
			<div class="community-post-info-header">
				<div class="header-title">
					<span class="title-icon">Q</span>
					<h1>
						<input id="community_title"
							value="${community.community_title }">
					</h1>
				</div>
			</div>
			<div class="community-post-info-content">
				<!-- 작성내용 -->
				<div class="content_body">
					<textarea class="summernote" id="community_contents"></textarea>
				</div>
				<div class="content_sub-info">
					<!-- 태그들 -->
					<div class="sub-info_item sub-info_tags">
						<label class="sub-info-label">연관 태그</label>
						<div class="sub-info-content" >
							<div id="modify_tag">
								<c:forEach items="${community.cmtg_list }" var="cmtag" varStatus="status">
									<button class="ac-button ac-tag"
										onClick='tagclose("${cmtag.tag_NM }")'
										data-tg-name="${cmtag.tag_NM }">
										<span class="ac-tag-name"><c:out
												value='${cmtag.tag_NM }' /></span> <span
											style="width: 6; height: 6;">&times;</span>
									</button>
								</c:forEach>
								</div>
							<input type="text" id="tags" class="tags" placeholder="태그를 설정해주세요."
								onkeyup="tagchange(this)" name="cmtg_list">
							<span class="input-tags-description">최대 3개의 태그를 달 수 있어요!</span>
						</div>
					</div>
				</div>
			</div>
			<div class="post_features">
				<div class="flex-row">
					<a href="${path }/community/questions">목록 페이지</a>
				</div>
				<div class="flex-row">
					<a id="modify_btn">수정 완료</a>
				</div>
				<div class="flex-row">
					<a href="${path }/community/${community.community_seq}">수정 취소</a>
				</div>
			</div>
		</div>
	</section>
	</form>
</main>



<script type="text/javascript">

	//모달 속 태그 생성
	$('#tags').focusout(function () {
		var input = $('#tags').val();
		if(input != null){
			$('.ac-tag').each(function () {
				if($(this).data('tgName') == input){
					var target = $(".ac-tag[data-tg-name='" + input + "']");
					target.remove();
				}
			});	
			$('#modify_tag').append(
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
		var tags = $('#modify_tag').children().length;
		if (tags >= 3) {
			$('.input-tags-description').css('color', 'red');
			$('#tags').prop("disabled", true);
		}
	});
	
	function tagchange(obj) {
		 var str_space = /\s/; // 공백 체크
			if (str_space.exec(obj.value)) { // 공백 체크
				/* alert("해당 항목에는 공백을 사용할 수 없습니다.\n\n공백 제거됩니다."); */
				obj.focus();
				obj.value = obj.value.replace(' ', ''); // 공백제거       
				return false;
			}
		 
		 var str_tag = /,/g;
		 
		 if(str_tag.exec(obj.value)){
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

			 $('#modify_tag').append(
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
		 
		 var tags = $('#modify_tag').children().length;
		 if(tags >= 3){
			$('.input-tags-description').css('color', 'red');
			$('#tags').prop("disabled", true);
		 }
		 
	}

	
	//생성된 태그버튼 삭제
	function tagclose(obj) {
		var target = $(".ac-tag[data-tg-name='" + obj + "']");
		target.remove();
		var limit_list = $('#modify_tag').children().length;
		if (limit_list < 4) {
			$('.input-tags-description').css('color', 'gray');
			$('#tags').prop("disabled", false);
			return false;
		}
	}
	
	
	$(document).ready(function() {
		  $('.summernote').summernote({
	 	    	placeholder: '학습 관련 질문을 남겨주세요. 상세히 작성하면 더 좋아요!',
		        minHeight: 370,
		        focus: true, 
		        lang : 'ko-KR'
		  });
		  // Summernote에 글 내용 추가하는 코드
		  $(".summernote").summernote('code',  '${community.community_contents}');
		});
	
    // 수정 하기 버튼
     $("#modify_btn").on("click", function(){
    	 var tags = new Array();

			$('#modify_tag').children().each(function() {
				tags.push($(this).data("tgName"));
			});
			/* alert(tags); */
			var param;
			if(tags.length == 0){
				param = {
						"community_seq" : $("#community_seq").val(),
						"community_title" : $("#community_title").val(),
						"community_contents" : $("#community_contents").val()
					};
			}else{
				param = {
						"community_seq" : $("#community_seq").val(),
						"community_title" : $("#community_title").val(),
						"community_contents" : $("#community_contents").val(),
						"tag_name_list" : tags
					};
			}
			
				/* alert(param); */

				$.ajax({
					type : "post",
					url : "${path }/community/modify",
					contentType : "application/json; charset=UTF-8",
					data : JSON.stringify(param),
					dataType : "json",
					success : function(data) {
						var msg = data.msg;
						var seq = data.seq;
						alert(msg);
						var url = "/community/"+seq;
						location.replace(url);
					}
				});	
		
			
    });
	
</script>





<%@ include file="../common/footer.jsp"%>