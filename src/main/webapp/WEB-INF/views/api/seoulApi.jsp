<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../common/header.jsp"%>
<style>

#info-comment{
font-size:14px;
}
#work-info {
	margin: 30px;
	background-color: #F8F8FF;
}

#work-info h2 {
	position: relative;
	padding: 0.5rem;
	border: 2px dashed #fff;
	background: #e1f5fe;
	box-shadow: 0px 0px 0px 5px #e1f5fe;
	margin-bottom: 8px;
}

#work-info h2::after {
	position: absolute;
	top: -7px;
	left: -7px;
	content: '';
	border-width: 0 0 15px 15px;
	border-style: solid;
	border-color: #fff #fff #81d4fa;
	box-shadow: 1px 1px 1px #e0e0e0;
}

.work .workInSeoul, th, tr, td {
	border-collapse: collapse;
	border: 1px solid black;
	padding: 10px;
	text-align: center;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.work th {
	width: 147px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #153d73;
}

.work .workInSeoul td:hover {
	background-color: #333;
	color: white;
}
.work{
width: 90%;
text-align: center;
margin-top : 20px;
margin-left : auto;
margin-right : auto;
}

</style>

<form id="work-info">
	<h2>서울특별시 일자리플러스센터 채용 정보&nbsp;&nbsp;<span id="info-comment">&#8251;서울시의 업로드에 따라 정보가 달라집니다.</span></h2>
	<table id="wrap" class="work"></table>
</form>
<script>
	$
			.ajax({
				"url" : "workInSeoul",
				"type" : "get",
				"dataType" : "xml",
				"success" : function(data) {
					console.log(data);
					var info = "<tr><th>채용 회사</th><th>업무</th><th>고용형태</th><th>채용 방법</th>"
							+ "<th>제출서류</th><th>급여</th><th>직장 주소</th><th>담당자 이름</th><th>전화번호</th></tr>";
					$(data).find("row").each(
							function() {
								info += "<tr><td>"
										+ $(this).find("CMPNY_NM").text()
										+ "</td><td>"
										+ $(this).find("BSNS_SUMRY_CN").text()
										+ "</td><td>"
										+ $(this).find("EMPLYM_STLE_CMMN_MM")
												.text()
										+ "</td><td>"
										+ $(this).find("MODEL_MTH_NM").text()
										+ "</td><td>"
										+ $(this).find("PRESENTN_PAPERS_NM")
												.text() + "</td><td>"
										+ $(this).find("HOPE_WAGE").text()
										+ "</td><td>"
										+ $(this).find("BASS_ADRES_CN").text()
										+ "</td><td>"
										+ $(this).find("MNGR_NM").text()
										+ "</td><td>"
										+ $(this).find("MNGR_PHON_NO").text()
										+ "</td></tr>";
							});

					$("#wrap").html(info);

				}
			});
</script>
<%@ include file="../common/footer.jsp"%>