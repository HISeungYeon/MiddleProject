<%@page import="kr.or.ddit.ott.mem.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.ott.oob.vo.OobVO"%>
<%@page import="kr.or.ddit.ott.rep.vo.RepVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
List<RepVO> repList = (List<RepVO>) request.getAttribute("repList");
String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
session.removeAttribute("msg");
%>
<%
RepVO rv = (RepVO)request.getAttribute("rv");
OobVO ov = (OobVO) request.getAttribute("ov");
MemberVO vo = (MemberVO) session.getAttribute("vo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Disney++</title>
<link rel="shortcut icon" href="/OTTProject/view/img/logo.png"type="image/x-icon">
<link rel="shortcut icon" href="https://image.ytn.co.kr/general/jpg/2022/0915/202209150855404027_d.jpg" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../view/css/main.css">
<style>
div {
	/* border: 3px solid red; */
}


.hi{
	margin-top: 20px; 
	margin-left:30px;
	border: none;
	display:inline-block;
}

.btn{
    margin: 10px;
}

.bt_wrap{
	text-align: center;
}

</style>

</head>

<body>
	<form id="id_rform" action="update.do" method="post">
		<input type="hidden" name="nm_gnum" value="">

		<div id="page-wrapper">

			<!-- Header -->
			<%@include file ="/header.jsp" %>
			<!-- Main -->
			<div class="board_wrap" style="padding: 10px;">
				<div class="board_title">
					<h2>1:1 문의</h2>
					<p>무엇이든 문의하세요</p>
				</div>
				<div class="board_view_wrap">
					<div class="board_view">
						<dt class="mt-3"">제목</dt>
						<div class="title">
							<input type="text" name="" value="${ov.oobTit}" disabled style="border: none;">
						</div>
						<br>
						<div class="info">
							<dl>
								<dt>작성자</dt>
								 <dd><input type="text" name="memNm" value="<%=vo.getMemNm()%>" disabled></dd>
                                    <input type="hidden" name="memNum" value="${ov.memNum}">
								<!-- <dd>${ov.memNum}</dd> -->
							</dl>
							<dl>
								<dt style="display: inline;">작성일 : ${ov.oobDate} </dt>
								<!-- <dd>
									${ov.oobDate}
								</dd> -->
							</dl>
						</div>
						<div class="cont">
							<input type="text" name="" value="${ov.oobCon}" disabled style="border: none; height:200px">
						</div>
					</div>
					<div class="bt_wrap" style="padding: 20px;">
						<button type="button" class="btn btn-outline-light" 
						onclick="location.href='update.do?oobNum=${ov.oobNum}'">수정하기</button>
						<button type="button" class="btn btn-outline-light" 
						onclick="location.href='delete.do?oobNum=${ov.oobNum}'">삭제하기</button>
						 <button type="button" class="btn btn-outline-light" 
						onclick="location.href='list.do'">뒤로가기</button>
					</div>
				</div>
			</div>
		</div>	
	</form>
	
	<div class="board_wrap" style="width: 900px; margin: 100px auto;">
		<div class="board_list">
			<div class="top">
				<div style="position: relative; left: 30px;">관리자 답변</div>
				<div style="position: relative; left: 600px;">작성일</div>
			</div>
			<%
			int repSize = repList.size();
			if (repSize > 0) {
				for (int i = 0; i < repSize; i++) { %>

			<div class="title hi mt-3 mb-5" style="border:none; width: 70%;"><%=repList.get(i).getRepCon()%></div>
			<div class="date hi" ><%=repList.get(i).getRepDate()%></div>
			<input type="hidden" id="repNum" name="repNum" value="<%=repList.get(i).getRepNum()%>">
			
			<%if(Integer.parseInt(vo.getMemNum()) == 0) { %>
			<button type="button" class="btn-close btn-close-white hi" aria-label="Close" style="box-shadow:none;"
			onclick="location.href='/OTTProject/rep/delete.do?repNum=<%=repList.get(i).getRepNum()%>&oobNum=<%=repList.get(i).getOobNum()%>'"></button>
 			<%}else{System.out.println("회원임둥");}%>
			
			<%
				}
			} else {
			%>
				아직 답글이 안달렸습니다.
			<%
				}
			%>
		</div>
	</div>
		
	<% System.out.println("회원번호 : " + vo.getMemNum());
	if(Integer.parseInt(vo.getMemNum()) == 0) { %>
	<form id="id_wform" action="../oob/detail.do" method="get">
		<input type="hidden" name="oobNum" value="<%=ov.getOobNum()%>">
		<!-- 꼭 있어야 하는가? 어찌하면 없앨 수 있는가? 천재 승연이가 간당 -->
		<input type="hidden" name="repSit" value="답변완료">
		<div class="board_wrap" style="text-align: center;">
			<div class="cont">
				<textarea name="repCon" placeholder="내용 입력" required></textarea>
			</div>
			<div class="bt_wrap" style="padding: 20px;">
				<button type="submit" class="btn btn-outline-light">등록</button>
			</div>
		</div>
	</form>
	<%}%>

	<!-- Footer -->
	<%@include file="../../footer.jsp"%>


	<!-- Scripts -->
	<script src="/OTTProject/view/js/jquery.min.js"></script>
	<script src="/OTTProject/view/js/jquery.scrollex.min.js"></script>
	<script src="/OTTProject/view/js/jquery.scrolly.min.js"></script>
	<script src="/OTTProject/view/js/browser.min.js"></script>
	<script src="/OTTProject/view/js/breakpoints.min.js"></script>
	<script src="/OTTProject/view/js/util.js"></script>
	<script src="/OTTProject/view/js/main.js"></script>
	
	<script>
	$("#id_wform").on("submit",function(){
		event.preventDefault();  // submit 안되게 막깅
		//alert($("#id_wform").serialize()); 디버깅용
		//AJAX로 떤송
		$.ajax({
			type:"post",
			url:"/OTTProject/oob/detail.do",
			data: $("#id_wform").serialize(),
			dataType:"text",
			success:function(rslt){
				console.log("성공",rslt); // 디벅깅용
				if(rslt=="success"){
					//location.href=location.href; 요걸써도 되지만 캐쉬된 페이지가 올 수 도 있음
					location.replace(location.href);
				}else {
					alert("잘 안된 것 같아요 괜히 미안하네요ㅠㅠ")
				}
				
			},
			error:function(req,status,error){  // 이건 앞으로 복사해서 붙여넣기 사용
				  console.log("code:",req.status,"msg:",req.responseText,"error:",error);       
			}
		});
	});
	
	$("p.title").on('click', function () {
		$(this).next(".con").slideToggle(100);
	});

	</script>
</body>

</html>