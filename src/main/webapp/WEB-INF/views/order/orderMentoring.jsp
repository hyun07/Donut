<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
#mentoring-order {
	display: flex;
	text-align: center;
}

#mentoring-order .pay_list {
	line-height: 4em;
	width: 45%;
}

#mentoring-order .product_price {
	font-size: 20px;
}

#mentoring-order #mentoring {
	width: 50%;
	height: 80%;
	margin: auto;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
}

#mentoring-order #mentoring>div {
	text-align: center;
}

#mentoring-order #purchase {
	width: 34.9%;
}

#mentoring-order .price {
	border: 1px solid var(- -gray-color);
	border-radius: 2em;
	padding: 0.5em;
}

#mentoring-order #purchase>div {
	width: 80%;
	min-width: max-content;
	margin: 0.5em auto;
}

#mentoring-order .input p, input {
	text-align: center;
}

#mentoring-order .validiate {
	color: var(- -main-color);
	font-weight: bold;
	display: none;
}
</style>

<div class="container p-3 my-2 white-bg"
	style="border-radius: 1em; border: none;">
	<h3 style="text-align: center;">멘토링 결제</h3>
</div>

<section id="mentoring-order" class="container">

	<div class="pay_list">
		<div class="flex-item">
			<!-- content 시작 -->
			<div class="mento_list_content_container">
				<div>
				<c:choose>
				<c:when test="${menteeList.mentoring.kinds.kinds_name == null }">
				<strong class="mentoring_kinds">${menteeList.mentoring.kinds.kinds_name}</strong>
				</c:when>
				<c:otherwise>
				<strong class="mentoring_kinds"> 선택
						분야:${menteeList.mentoring.kinds.kinds_name } </strong>
				</c:otherwise>
				</c:choose>
					
				</div>
				<!-- 제목 -->
				<strong class="mentoring_title"> 제목:
					${menteeList.mentoring.mentoring_title } </strong>
				<!-- 가격 -->
				<div class="mentoring_price">
					<div class="product_price" id="product_price">
						<c:choose>
							<c:when test="${menteeList.mentoring.mentoring_price == 0}">
								<span> <!-- 가격표시 --> <strong>무료: 0원 </strong>
								</span>
								<input type="number" id="price" value="0" hidden="hidden">
							</c:when>
							<c:otherwise>
								<strong>유료: ${menteeList.mentoring.mentoring_price }원</strong>
								<input type="number" id="price"
									value="${menteeList.mentoring.mentoring_price }" hidden="hidden">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="mentoring_regth">
						<!-- 등록한 날짜 -->
						<strong> 생성 날짜: ${menteeList.mentoring.mentoring_regDT } </strong>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="margin-left: 50px;">
		<div class="member-id input mb-2">
			<p>
				<strong>이름</strong>
			</p>
			<p id="name-check-null" class="validiate">구매인 성명을 입력하세요.</p>
			<input id="buyer-name" type="text" class="form-control"
				value="${menteeList.member.member_nickNM }" name="member_id" placeholder="구매인 성명"
				maxlength="6" size="6">
		</div>
		<div class="member-phone input mb-2">
			<p>
				<strong>휴대폰 번호</strong>
			</p>
			<p id="phone-check-null" class="validiate">구매인 연락처를 입력하세요.</p>
			<p id="phone-check-exp" class="validiate">전화번호 형식이 일치하지 않습니다.</p>
			<div class="input-group">
				<input id="buyer-phone" type="text" class="form-control"
					value="${menteeList.member_phoneNO }" name="member_phoneNO"
					readonly maxlength="11">
			</div>
		</div>
		<div class="member-email input">
			<p>
				<strong>이메일 주소</strong>
			</p>
			<input id="buyer-email" type="text" class="form-control"
				value="${menteeList.member_email }" name="member_email"
				readonly="readonly">
		</div>

		<c:choose>
			<c:when test="${menteeList.mentoring.mentoring_price == 0 }">
				<div class="btn-wrapper mt-3">
					<button type="button" class="btn btn-success" style="width: 100%;"
						onclick="purchaseFree(${menteeList.mentoring.mentoring_price})">
						바로 구매하기</button>
				</div>
			</c:when>
			<c:otherwise>
				<div class="method input">
					<p>
						<strong>결제 수단</strong>
					</p>
					<button type="button" class="btn btn-outline-light text-dark"
						onclick="pay('이니시스')">
						<i class="far fa-credit-card"></i> 신용카드 결제
					</button>
					<button type="button" class="btn btn-outline-light text-dark"
						onclick="pay('kakaopay')">
						<img src="/resources/images/icons/kakao_pay_icon.png"
							style="height: 1.2em;"> 카카오페이 결제
					</button>
				</div>
			</c:otherwise>
		</c:choose>

	</div>

</section>

<script type="text/javascript">
function pay(pg){
   var ninput = $("#buyer-name");
   var pinput = $("#buyer-phone");
   var nError = $("#name-check-null");
   var pError = $("#phone-check-null");
   
   
   if(isNull(ninput,nError) || isNull(pinput,pError)){
      return false;
   }
   var name = $("#buyer-name").val().trim();
   var tel = $("#buyer-phone").val().trim();
   var email = $("#buyer-email").val().trim();
   var price = $("#price").val().trim();
   console.log(pg+","+name+","+tel+","+email +","+ price);
   //가맹점 식별코드
   IMP.init('imp49078716');
   IMP.request_pay({
       pg : pg,
       pay_method : 'card',
       merchant_uid : 'merchant_' + new Date().getTime(),
       name : "${menteeList.mentoring.mentoring_title}" , //결제창에서 보여질 이름
       amount : price, // 실제 결제되는 가격
       buyer_email : email,
       buyer_name : name,
       buyer_tel : tel,
   }, function(rsp) {
      console.log(rsp);
       if ( rsp.success ) {
          var msg = "멘토링 : ${menteeList.mentoring.mentoring_title} <br>결제 금액 : " + rsp.paid_amount +"<br>카드 승인 번호 : " + rsp.apply_num;
          Swal.fire({
              icon: 'success',
              title: '결제 완료',
              html: msg,
              showConfirmButton: false,
         })   
          $.ajax({
             url: "${path}/order/purchaseMentoring",
             type: "post",
             dataType: "json",
             data:{
                "member_id":"${user.member_id}",
                "mentoring_seq":"${menteeList.mentoring.mentoring_seq}",
                "buyer_name" : name,
                "buyer_phone" : tel,
                "buyer_email" : email,
                "amounted_pay" : price
             },
             success: function(data){
                var ajaxResult = data.result;
                var error = data.error;
                var msg = data.msg;
                if(ajaxResult == 'true'){
                   Confirm(msg,"success","${path}/mypage/myMentoring");
                }else{
                   if(error == 'duplicated'){
                      Confirm(msg,'warning',"${path}/mypage/myMentoring");
                   }else{
                      Swal.fire({
                            icon: 'error',
                            title: '구매 실패',
                            html: msg,
                            showConfirmButton: false,
                            timer: 1500
                          })
                   }
                }
             }
             })
       } else {
          Swal.fire({
              icon: 'error',
              title: '결제 실패',
              text: rsp.error_msg,
              showConfirmButton: false,
              timer: 1500
            })
       }
   });
}


/* 바로구매하기 무료!! */
function purchaseFree(seq){
   var ninput = $("#buyer-name");
   var pinput = $("#buyer-phone");
   var nError = $("#name-check-null");
   var pError = $("#phone-check-null");
   
   if(isNull(ninput,nError) || isNull(pinput,pError)){
      return false;
   }
   
   var name = $("#buyer-name").val().trim();
   var tel = $("#buyer-phone").val().trim();
   var email = $("#buyer-email").val().trim();
   Swal.fire({
        title: '${menteeList.mentoring.mentoring_title}',
        text: '구매하시겠습니까?', 
        icon: "question",
        showCancelButton: true,
        confirmButtonText: '구매',
        cancelButtonText: '취소',
      }).then((result) => {
        if (result.isConfirmed) {
          $.ajax({
             url: "${path}/order/purchaseMentoring",
             type: "post",
             dataType: "json",
             data:{
            	 "member_id" : "${user.member_id}",
                "mentoring_seq":"${menteeList.mentoring.mentoring_seq}",
                "buyer_name" : name,
                "buyer_phoneNO" : tel,
                "buyer_email" : email,
                "amounted_pay" : 0
             },
             success: function(data){
                var result = data.result;
                var msg = data.msg;
                var link = data.link;
                var icon = data.icon;
                console.log(msg ,"+", result)
                if(result){
					Swal.fire({
						icon: icon,
						html: msg,
						showConfirmButton: false,
						timer : 1200
			            }).then((result) => {
			            	location.href = "${path}" + link;
			            });
				}       
             }
          });
       }
   });
}

$("#buyer-name").on("change input",function(){
   var error = $("#name-check-null");
   
   if(isNull($(this),error)){
      return false;
   }
});
$("#buyer-phone").on("change input",function(){
   var value = $(this).val().trim();
   var btn = $("#btn-phone");
   
   if(value == "${user.member_phoneNO}"){
      btn.prop("disabled",true);
   }else{
      btn.prop("disabled",false);
   }
   
   if(value == null || value == ""){
      $("#phone-check-null").css("display","block");
      $(this).css("background","var(--accent-color)").focus();
      return false;
   }else{
      $("#phone-check-null").css("display","none");
      $(this).css("background","");
   }
   
   var phoneExp = /^010-?([0-9]{4})-?([0-9]{4})$/;
   
   if(phoneExp.test(value)){
      $("#phone-check-exp").css("display","none");
      $(this).css("background","");
   }else{
      $("#phone-check-exp").css("display","block");
      $(this).css("background","var(--accent-color)").focus();
      return false;
   }
});

function Confirm(msg,type,link){
   Swal.fire({
        html: msg,
        icon: type,
        showCancelButton: true,
        confirmButtonText: '이동',
        cancelButtonText: '취소',
      }).then((result) => {
        if (result.isConfirmed) {
          location.href = link;
        }
      })
}
/* null check */
function isNull(id, error) {
   var val = id.val().trim();
   if (val == null || val == "") {
      error.css("display", "block");
      id.css("background","var(--accent-color)").focus();
      return true;
   } else {
      error.css("display", "none");
      id.css("background","");
      return false;
   }
}
</script>

<%@ include file="../common/footer.jsp"%>