<%@page import="kr.or.ddit.ott.vdodtl.vo.VdodtlVO"%>
<%@page import="comm.vo.AtchFileVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 	pageEncoding="UTF-8"%> 
<% 
	VdodtlVO vo = (VdodtlVO) request.getAttribute("vo");

 	List<AtchFileVO> atchFileList = (List<AtchFileVO>) request.getAttribute("atchFileList");
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
	/* div{
		border: 2px solid red;
	} */
	.cardd {
		display: flex;
		justify-content: center;
		align-items: center;
		padding: 20px;
	}
	input {
		background-color: #191919;
		color: white;
	}
	.vdoImg{
		width: 500px;
		margin: 100px auto;
		display: inline-block;
		padding: 20px;
	}
	button{
		margin: 5px;
		border-bottom: none;
	}
</style>
</head>
<body>
	<form action="update.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="vdodtlNum" value="<%=vo.getVdodtlNum()%>">

		<div id="page-wrapper">

			<!-- Header -->
			<%@include file ="/header.jsp" %>
			<!-- Main -->
			<div style="text-align: center;">
				<div class="vdoImg">
					<div class="board_title">
						<h2>영상물 상세정보</h2>
					</div>
					<div>
						<%
							if (atchFileList != null) {
							for (AtchFileVO fileVO : atchFileList) {
						%>
						<img src="<%=request.getContextPath() %>/filedown.do?fileId=<%=fileVO.getAtchFileId() %>&fileSn=<%=fileVO.getFileSn() %>" style="width:500px; height:700px;">
						<%
								}
							}
						%>
					</div>
				</div>
				<div class="board_wrap" style="padding: 30px; display: inline-block;">
					<div>
						<div>
							<div>
								<p>영상물 번호 : <span><%=vo.getVdodtlNum()%></span></p>
								<p>영상물 제목  <input type="text" name="vdodtlNm" value="<%=vo.getVdodtlNm()%>"></p><br>
								<p>영상물 장르번호 <input type="text" name="vdotyNum" value="<%=vo.getVdotyNum()%>"></p><br>
								<p>영상물 등급번호 (1: 키즈   2: 성인)<input type="text" name="vdolevNum" value="<%=vo.getVdolevNum()%>"></p><br>
								<p>영상물 상세 줄거리<textarea rows="5" cols="6" name="vdodtlDtl" ><%=vo.getVdodtlDtl()%></textarea></p><br>
								<p>영상물 요약 내용<input type="text" name="vdodtlSumy" value="<%=vo.getVdodtlSumy()%>"></p><br>
								<p>영상물  등록일 <input type="date" name="vdodtlRedt" value="<%=vo.getVdodtlRedt()%>"></p><br>
								<p>영상물  좋아요 수 <input type="text" name="vdodtlLik" value="<%=vo.getVdodtlLik()%>"></p>
							</div>
						</div>
						<div class="cardd">
							<div><button type="button" class="btn btn-primary"><a href="list.do">목록</a></button></div>
							<div><button type="button" class="btn btn-success"><a href="update.do?vdodtlNum=<%=vo.getVdodtlNum()%>">영상물 수정</a></button></div>
							<div><button type="button" class="btn btn-danger"><a href="delete.do?vdodtlNum=<%=vo.getVdodtlNum()%>">영상물 삭제</a></button></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

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
	$("p.title").on('click', function () {
		$(this).next(".con").slideToggle(100);
	});

	</script>

	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
</html>