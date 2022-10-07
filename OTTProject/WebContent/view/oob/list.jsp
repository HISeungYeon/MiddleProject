<%@page import="kr.or.ddit.ott.mem.vo.MemberVO"%>
<%@page import="kr.or.ddit.ott.oob.vo.OobVO" %>
<%@page import="kr.or.ddit.ott.rep.vo.RepVO" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% 
List<OobVO> oobList = (List<OobVO>) request.getAttribute("oobList");
List<String> sitList = (List<String>) request.getAttribute("sitList");
String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
session.removeAttribute("msg");
RepVO rv = (RepVO)request.getAttribute("rv");
MemberVO vo = (MemberVO)session.getAttribute("vo");%>
<% System.out.println(oobList); %>
<!DOCTYPE HTML>

<html>

<head>
	<title>Disney++</title>
	<link rel="shortcut icon" href="/OTTProject/view/img/logo.png" type="image/x-icon">
	<meta charset="utf-8" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="../view/css/main.css" />

	<style>
		div {
			/* border: 3px solid red; */
		}
		.top {
			display: flex;
			justify-content: space-around;
		}
	</style>
</head>

<body class="is-preload">

	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- Header -->
		<%@include file="/header.jsp" %>

		<!-- Main -->
		<article id="main">
			<header>
				<div style="text-align: center; position: relative; ;top: 70px;">
					<h2>고객센터</h2>
					<p>무엇이든 물어보세요!</p>
				</div>
			</header>
			<section class="wrapper style5">
				<div class="inner" style="text-align: center;">
					<div class="btn-group" role="group" aria-label="Basic outlined example" style="padding: 60px;">
						<button type="button" class="btn btn-outline-primary"
							style="color: white; width: 700px; border-color: white;" onclick="location.href='../ntc/list.do'">
							공지사항</button>
						<button type="button" class="btn btn-outline-primary"
							style="color: white; width: 700px;border-color: white; background-color:#0d6efd" onclick="location.href='../oob/list.do'">
							1:1 문의</button>
					</div>
					<div class="board_list">
						<div class="top">
							<div class="num">번호</div>
							<div class="title">제목</div>
							<div class="date">작성일</div>
							<div>답변상태</div>
						</div>

						
						<% int oobSize=oobList.size(); 
							if (oobSize> 0) {
								for (int i = 0; i < oobSize; i++) { %>
									<div  class="top">
										<div class="num">
											<%=oobList.get(i).getOobNum()%>
										</div>
										<div class="title">
											<a class="oob" href="detail.do?oobNum=<%=oobList.get(i).getOobNum()%>">
												<%=oobList.get(i).getOobTit()%>
											</a>
										</div>
										<div class="date">
											<%=oobList.get(i).getOobDate()%>
										</div>
										<div>
											<%=sitList.get(i)%>
										</div>
										
									</div>
								<% } 
							} else { } %>
					</div>
					 
					<div style="margin: 30px;">
						<button type="button" class="btn btn-light" onclick="location.href='../oob/insert.do'">새글 작성</button>
					</div>
					
				</div>
			</section>
		</article>

		<!-- Footer -->
		<%@include file="../../footer.jsp" %>

	</div>

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
	
</body>

</html>