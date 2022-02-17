<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="/resources/css/communityDetail.css" />

<script src="/resources/js/summernote/summernote-lite.js"></script>
<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet"
	href="/resources/css/summernote/summernote-lite.css">




<main class="comm-detail">
	<section class="post-detail_section post-detail_post">
		<div class="community-post-info">
			<!--  제목,작성자이름,작성시각,에디터 -->
			<div class="community-post-info-header">
				<div class="header-title">
					<span class="title-icon">Q</span>
					<h1>
						<c:out value="${community.community_title }" />
					</h1>
				</div>
				<div class="header-sub_title">
					<h6>
						<c:out value="${community.member_nickNM }" />
					</h6>
					<span>&nbsp;·<fmt:formatDate
							value="${community.community_regDT }" pattern="yyyy/MM/dd" /></span>
				</div>
			</div>
			<div class="community-post-info-content">
				<!-- 작성내용 -->
				<div class="content_body">${community.community_contents}</div>
				<div class="content_sub-info">
					<!-- 연관 강의 및 수업 -->
					<div class="sub-info_item sub-info_course-unit">
						<label class="sub-info-label">연관 강의</label>
						<div class="sub-info-content">
							<c:choose>
								<c:when test="${community.course_seq eq 0 }">
									<a href="#"></a>
								</c:when>
								<c:otherwise>
									<div class="course-no-course">없음</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<!-- 태그들 -->
					<div class="sub-info_item sub-info_tags">
						<label class="sub-info-label">연관 태그</label>
						<div class="sub-info-content">
							<c:choose>
								<c:when test="${empty  community.cmtg_list }">
									<div class="tags-no-tags">없음</div>
								</c:when>
								<c:otherwise>
									<c:forEach items="${community.cmtg_list }" var="cmtag">
										<button class="ac-button tags-btn">
											<span class="ac-tag-hashtag">#&nbsp;</span> <span
												class="ac-tag-name"><c:out value="${cmtag.tag_NM }"></c:out></span>
										</button>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<!-- 여부변경 및 게시글 수정 -->
				<div class="post_features">
					<c:choose>
						<c:when test="${user.member_id eq community.member_id }">
							<div class="flex-row" id="statusBar">
								<button class="ac-button" id="commumity_status"
									data-bs-toggle="tooltip" data-bs-placement="bottom"
									title="상태를 바꾸려면 클릭" onclick="ChangeStatus()">
									${community.commumity_status}</button>
							</div>
							<div class="flex-row">
								<a
									href="${path }/community/modify?community_seq=${community.community_seq}"
									class="ac-button">수정</a>
							</div>
							<div class="flex-row">
								<button class="ac-button"
									onclick="deleteConfirm(${community.community_seq});">삭제</button>
							</div>
						</c:when>
						<c:when test="${user.member_id ne community.member_id }">
							<div class="flex-row">
								<button class="ac-button">${community.commumity_status}</button>
							</div>
							<div class="flex-row">
								<button class="ac-button">
									<i class='fas fa-share-alt'></i>
								</button>
							</div>
						</c:when>
					</c:choose>
				</div>
			</div>
		</div>
	</section>
	<!-- 답변 -->
	<section class="post-detail_answer">
		<div class="answer-info">
			<div class="answer-info-header">
				<div class="header-title">
					<span class="title-icon">A</span> 총 ${fn:length(answerList) }개의 답글이
					달렸습니다.
				</div>
			</div>
			<div class="community-post-info-content">
				<div class="content_body">
					<!-- TO DO 로그인 가능여부에 따라 -->
					<div class="answer-comment">
						<c:choose>
							<c:when test="${user != null }">
								<div class="comment_card">
									<div class="comment-header">
										<img class="comment_user-profile" alt="profile"
											src="${path }/profile?member_id=${user.member_id}&img_nm=${user.member_profile_img_nm}">
										<div class="flex-column">
											<h5 class="comment_user-name">${user.member_nickNM }님,
												답변을 남겨보세요!</h5>
											<span class="comment_update">모두에게 도움이 되는 답변의 주인공이
												되어주세요!</span>
										</div>
									</div>

									<div class="comment-body">
										<textarea class="summernote" id="community_contents"></textarea>
									</div>
									<div class="comment-footer">
										<input id="member_id" value="${user.member_id }"
											hidden="hidden"> <input id="community_roll"
											value="답변" hidden="hidden">
										<button class="ac-button" onclick="registerAnswer()">답변
											등록</button>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="comment_card">
									<p class="comment_no-user" onclick="showLoginModal()">로그인
										후, 질문 답변 작성이 가능합니다.</p>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="answer-comment-reload">
						<c:forEach items="${answerList }" var="answer"
							varStatus="varstatus">
							<div class="answer-comment"
								data-answer-no="${answer.community_seq }">
								<div class="comment_index">${varstatus.count }</div>
								<div class="comment_card">
									<div class="comment-header">
										<img class="comment_user-profile" alt="profile"
											src="${path }/profile?member_id=${answer.member_id}&img_nm=${answer.member_profile_img_nm}">
										<div class="flex-column">
											<h5 class="comment_user-name">${answer.member_nickNM }</h5>
											<span class="comment_update">${answer.community_regDT }</span>
										</div>
										<c:if test="${answer.member_id eq user.member_id }">
											<div class="comment-edit">
												<a href="javascript:modifyReply(${answer.community_seq })"
													class="reply_modify"
													data-answer-no="${answer.community_seq }">수정</a> <a
													href="javascript:deleteConfirm(${answer.community_seq })"
													class="reply_delete"
													data-answer-no="${answer.community_seq }">삭제</a>
											</div>
										</c:if>
									</div>
									<div class="comment-body" id="comment-body-noedit"
										data-answer-no="${answer.community_seq }">${answer.community_contents}</div>
									<div class="comment-body comment-body-edit"
										data-answer-no="${answer.community_seq }"
										style="display: none">
										<textarea class="summernote" id="community_contents-edit"
											data-answer-no="${answer.community_seq }">${answer.community_contents}</textarea>
									</div>
								</div>
								<div class="comment_re-comment">
									<div class="re-comment_header">
										<h4 class="re-comment_title">댓글</h4>
										<button class="ac-button showReply"
											data-btn-no="${varstatus.count }"
											onclick="showReplyBody(${varstatus.count })"
											value="${answer.community_seq }">
											접기 <i class='fas fa-angle-up'></i>
										</button>
									</div>
									<div class="re-comment_body"
										data-reply-NO="${varstatus.count }">
										<div id="re-comment_body_reload">
											<c:forEach items="${replyList }" var="map">
												<c:if test="${map.key eq answer.community_seq}">
													<c:forEach items="${map.value}" var="reply"
														varStatus="replyStatus">

														<div class="re-comment">
															<c:choose>
																<c:when test="${reply.reply_contents eq '0' }">
																	<div class="no_reply">(삭제된 댓글입니다)</div>
																</c:when>
																<c:otherwise>
																	<img class="re-comment_profile" alt="profile"
																		src="${path }/profile?member_id=${reply.member_id}&img_nm=${reply.member_profile_img_nm}">
																	<div class="re-comment_content">
																		<div class="re-comment_info">

																			<c:if test="${answer.member_id eq reply.member_id }">
																				<button class="ac-button">
																					<span class="ac-tag_name">답변자</span>
																				</button>
																			</c:if>
																			<c:if
																				test="${community.member_id eq reply.member_id }">
																				<button class="ac-button">
																					<span class="ac-tag_name">질문자</span>
																				</button>
																			</c:if>

																			<h6 class="re-comment_user-name">${reply.member_nickNM }</h6>
																			<span class="re-comment_update">&nbsp;·<fmt:formatDate
																					value="${reply.reply_regDT }" pattern="yyyy/MM/dd" />
																			</span>
																			<c:if test="${reply.member_id eq user.member_id }">
																				<div class="re-comment-edits">
																					<a href="javascript:modifyRe(${reply.reply_seq })"
																						data-seq="${reply.reply_seq }"
																						class="reply_modify">수정</a> <a
																						href="javascript:deleteRe(${reply.reply_seq })"
																						data-seq="${reply.reply_seq }"
																						class="reply_delete">삭제</a>
																				</div>
																			</c:if>
																		</div>
																		<div class="re-comment__body markdown-body" data-seq="${reply.reply_seq }"
																			data-seq="${reply.reply_seq }">${reply.reply_contents}</div>
																		<div class="re-comment__body markdown-body-ed" data-seq="${reply.reply_seq }" 
																		style="display: none">
																			<textarea class="reply_summernote" data-seq="${reply.reply_seq }"
																				id="reply_contents-edit">${reply.reply_contents}</textarea>
																		</div>
																	</div>
																</c:otherwise>
															</c:choose>
														</div>

													</c:forEach>
												</c:if>
											</c:forEach>
										</div>
										<div class="re-comment_open-editor">
											<c:choose>
												<c:when test="${user != null }">
													<button class="ac-button re-comment_open-editor-btn"
														data-write-form="${answer.community_seq}"
														onclick="writeReply(${answer.community_seq})">댓글
														달기</button>
												</c:when>
												<c:otherwise>
													<button class="ac-button re-comment_open-editor-btn"
														onclick="showLoginModal()">댓글 달기</button>
												</c:otherwise>
											</c:choose>
										</div>
										<div class="re-comment_form"
											data-write-no="${answer.community_seq}" style="display: none">
											<textarea class="reply_summernote" id="reply_contents"
												name="reply_contents"></textarea>
											<input type="hidden" id="member_id" value="${user.member_id}">
											<button class="ac-button"
												onclick="registerReply(${answer.community_seq})">답변
												등록</button>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>

</main>


<script type="text/javascript">
//써머노트
$('.summernote').summernote({
	minHeight : 400,
	focus : true
});

$('.reply_summernote').summernote({
	 height: 150, 
	 focus: true
});

/* 상태변경 */
function ChangeStatus() {
	var community_seq = ${community.community_seq};
	$.ajax({
		type : "get",
		url : "${path}/community/changeStatus",
		data : {community_seq : community_seq},
		success : function (data) {
			$('#commumity_status').html(data);
		}
	});
}

/* 게시글 삭제 */
function deleteConfirm(no){
	if(!confirm("삭제 하시겠습니까?")){
		return false;
	}else{
		location.href="${path }/community/delete?community_seq="+no;
	}
}

/* 답변 등록 */
function registerAnswer() {
	var community_seq = ${community.community_seq};
	var param = {
			"member_id" : $('#member_id').val(),
			"community_contents" : $("#community_contents").val(),
			"community_roll" : $("#community_roll").val(),
			"answer_seq" : community_seq
	};
	$.ajax({
		type : "post",
		url : "${path }/community/registerAnswer",
		contentType : "application/json; charset=UTF-8",
		data : JSON.stringify(param),
		dataType : "json",
		success : function(data) {
			var msg = data.msg;
			alert(msg);
			location.reload();
		}
	});
}

/* 댓글등록 */
function registerReply(obj) {
	var param = {
			"member_id" : $("#member_id").val(),
			"reply_contents" : $("#reply_contents").val(),
			"community_seq" : obj
	};
	console.log(param);
	$.ajax({
		type : "post",
		url : "${path }/community/registerReply",
		contentType : "application/json; charset=UTF-8",
		data : JSON.stringify(param),
		dataType : "json",
		success : function(data) {
			if (data.result == "ok") {
				$('#re-comment_body_reload').load(location.href + ' #re-comment_body_reload');
				$('.reply_summernote').summernote('code', '');
			}	
		},
		error : function () {
			alert("통신실패");
		}
	});
}
/* 댓글 body 열고닫기 */
function showReplyBody(obj) {
	 var status = $(".re-comment_body[data-reply-NO=" + obj + "]").css('display');
     if (status == 'block') {
    	 $(".re-comment_body[data-reply-NO=" + obj + "]").hide();
         $(".showReply[data-btn-no=" + obj + "]").html("더보기 <i class='fas fa-angle-down'></i>");
     } else {
    	 $(".re-comment_body[data-reply-NO=" + obj + "]").show();
    	 $(".showReply[data-btn-no=" + obj + "]").html("접기 <i class='fas fa-angle-up'></i>");
     }
}

/* 답변 수정 */
function modifyReply(no) {
	$('.reply_delete[data-answer-no="'+no+'"]').replaceWith('<a href="javascript:reloadReply('+no+')" class="reply_delete" data-answer-no="'+no+'">취소</a>');
	$('.reply_modify[data-answer-no="'+no+'"]').replaceWith('<a href="javascript:sendReply('+no+')" class="reply_modify" data-answer-no="'+no+'">수정</a>');
	$('#comment-body-noedit[data-answer-no="'+no+'"]').hide();
	$('.comment-body-edit[data-answer-no="'+no+'"]').show();
}

function reloadReply(no) {
	$('.reply_delete[data-answer-no="'+no+'"]').replaceWith('<a href="javascript:deleteConfirm('+no+')" class="reply_delete" data-answer-no="'+no+'">삭제</a>');
	$('.reply_modify[data-answer-no="'+no+'"]').replaceWith('<a href="javascript:modifyReply('+no+')" class="reply_modify" data-answer-no="'+no+'">수정</a>');
	$('#comment-body-noedit[data-answer-no="'+no+'"]').show();
	$('.comment-body-edit[data-answer-no="'+no+'"]').hide();
}

function sendReply(no) {
	var param = {
			"community_contents" : $('#community_contents-edit[data-answer-no="'+no+'"]').val(),
			"community_seq" : no
	};
	$.ajax({
		type : "post",
		url : "${path }/community/modifyAnswer",
		contentType : "application/json; charset=UTF-8",
		data : JSON.stringify(param),
		dataType : "json",
		success : function(data) {
			if (data.result == "ok") {
				location.reload();
				alert("수정 완료");
			}	
		},
		error : function () {
			alert("다음에 다시 시도해주세요");
		}
	});
}

/* 댓글 form 열고 닫기 */
function writeReply(obj) {
	$(".re-comment_open-editor-btn[data-write-form=" + obj + "]").hide();
	$(".re-comment_form[data-write-no="+ obj + "]").show();
}

/* 대댓글수정 */
function modifyRe(no) {
	$('.reply_modify[data-seq="'+no+'"]').replaceWith('<a href="javascript:sendRe('+no+')" class="reply_modify" data-seq="'+no+'">수정</a>');
	$('.reply_modify[data-seq="'+no+'"]').next().replaceWith('<a href="javascript:cancelRe('+no+')" class="reply_modify" data-seq="'+no+'">취소</a>');
	$('.markdown-body[data-seq="'+no+'"]').hide();
	$('.markdown-body-ed[data-seq="'+no+'"]').show();
	
}

function sendRe(no) {
	var param = {
			"reply_contents" : $('#reply_contents-edit[data-seq="'+no+'"]').val(),
			"reply_seq" : no
	};
	$.ajax({
		type : "post",
		url : "${path }/community/modifyReply",
		contentType : "application/json; charset=UTF-8",
		data : JSON.stringify(param),
		dataType : "json",
		success : function(data) {
			if (data.result == "ok") {
				$('#re-comment_body_reload').load(location.href + ' #re-comment_body_reload');
				alert("수정 완료");
			}	
		},
		error : function () {
			alert("다음에 다시 시도해주세요");
		}
	});
}

function deleteRe(no) {
	var param = {
			"reply_contents" : '0',
			"reply_seq" : no
	};
	$.ajax({
		type : "post",
		url : "${path }/community/modifyReply",
		contentType : "application/json; charset=UTF-8",
		data : JSON.stringify(param),
		dataType : "json",
		success : function(data) {
			if (data.result == "ok") {
				//location.reload();
				$('#re-comment_body_reload').load(location.href + ' #re-comment_body_reload');
				alert("삭제 완료");
			}	
		},
		error : function () {
			alert("다음에 다시 시도해주세요");
		}
	});
}

function cancelRe(no) {
	$('.reply_modify[data-seq="'+no+'"]').replaceWith('<a href="javascript:modifyRe('+no+')" data-seq="'+no+'" class="reply_modify">수정</a>');
	$('.reply_modify[data-seq="'+no+'"]').next().replaceWith('<a href="javascript:deleteRe('+no+')" data-seq="'+no+'" class="reply_delete">삭제</a>');
	$('.markdown-body[data-seq="'+no+'"]').show();
	$('.markdown-body-ed[data-seq="'+no+'"]').hide();
}


</script>



<%@ include file="../common/footer.jsp"%>