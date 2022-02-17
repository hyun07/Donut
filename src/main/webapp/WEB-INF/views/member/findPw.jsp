<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<style>
	#find-password .form-wrapper{
		width:70%;
		min-width:320px;
	}
	#find-password .input-group{
		width:70%;
		min-width:320px;
		margin: auto;
	}
	#find-password h1,h2,h3,h4,h5,h6,p{
	text-align: center;
	}
	#find-password .validate{
		font-weight: bold;
		color:red;
		display:none;
	}
</style>

<section id="find-password">
	<div class="container mt-3">
   <h3 class="my-3" >비밀번호 찾기</h3>
   	<div class="info">
   		<p >회원가입시 입력하신 이메일로 인증번호가 전송됩니다.</p>
   	</div>
	<div class="form-wrapper mx-auto my-3">
		<p class="validate id-null">아이디를 입력하세요.</p>
		<div class="input-group mb-3">
			<span class="input-group-text">아이디</span>
		  <input id="cp-id" type="text" class="form-control" placeholder="ID..." oninput="isNull($(this),$('.id-null'))">
		</div>
		<p class="validate email-null">이메일을 입력하세요.</p>
		<p class="validate email-not-matched">이메일이 일치하지 않습니다.</p>
		<div class="input-group mb-3">
		<span class="input-group-text">이메일</span>
		  <input id="cp-email" type="text" class="form-control" placeholder="Email..." oninput="isNull($(this),$('.email-null'))">
		</div>
		<div class="input-group mb-3">
			<button type="button" class="btn btn-primary mx-auto" onclick="sendEmail()">이메일 전송</button>
		</div>
	</div>
</div>
</section>

<script>

	function sendEmail(){
		let id = $("#cp-id");
		let email = $("#cp-email");
		if(isNull(id,$(".id-null")) || isNull(email,$(".email-null"))){
			return;
		}
		
		var iVal = id.val();
		var eVal = email.val();
		
		$.ajax({
			url:"${path}/member/checkEmail",
			type:"post",
			dataType:"json",
			data:{"member_id" : iVal , "member_email" : eVal},
			success:function(data){
				if(!data){
					alert("입력하신 정보가 일치하지 않습니다.");
				}
			}
		});
		
	}

   function isNull(input,error){
	   let val = input.val().trim();
	   if(val == null || val == ""){
		   input.css("backgroung","var(--accent-color)");
		   error.css("display","block");
		   input.focus();
	   }else{
		   input.css("backgroung","");
		   error.css("display","none");
	   }
   }
</script>

<%@ include file="../common/footer.jsp"%>