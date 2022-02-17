<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<style>
#api-japi *{
	text-align: center;
}
</style>

<div class="container p-3 my-2 white-bg"
	style="border-radius: 1em; border: none;">
	<h3 style="text-align: center;">서울시 채용 정보</h3>
</div>

<section id="api-japi" class="container">
		<!-- api -->
		<div class="api">
			
			<div class="btn-wrapper mx-auto my-2">
			<button type="button" class="btn btn-primary">그래프 보기</button>
			</div>
			
			<div class="api-wrapper">
			
			</div>
		</div>
</section>

<script type="text/javascript">
$(document).ready(function(){
	var div= $(".api-wrapper");
	if(div.children().length == 0){
		$.ajax({
			url:"${path}/api/jAjax",
			dataType:"json",
			type:"post",
			success:function(data){
				console.log(data);
			},
			error:function(){
				alert("error");
			}
		});
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
		  }else{
			  location.reload();  
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