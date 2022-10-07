<%@page import="kr.or.ddit.ott.mem.vo.MemberVO"%>
<%@page import="comm.vo.AtchFileVO"%>
<%@page import="kr.or.ddit.ott.vdodtl.vo.VdodtlVO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<VdodtlVO> vdodtlList = (List<VdodtlVO>) request.getAttribute("vdodtlList");
String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
session.removeAttribute("msg"); // 꺼내온 메시지 속성값 삭제하기
System.out.println("+++------영상물 리스트" + vdodtlList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Disney++</title>
<link rel="shortcut icon" href="/OTTProject/view/img/logo.png"type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="../view/css/main.css" />
<style>
	div {
		/* border: 3px solid red; */
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
					<h2>영상물 목록</h2>
				</div>
			</header>
			<section class="wrapper style5">
				<div class="inner" style="text-align: center;">
					<table border="1" style="color: white;">
						<tr>
							<th>영상물 번호</th>
							<th>영상물 이름</th>
							<th>영상 요약 정보</th>
							<th>영상의 좋아요 수</th>
							<th>영상 등록일</th>
							<th>첨부파일</th>
							
							
						</tr>
		
						<%
							int vdodtlSize = vdodtlList.size();
						if (vdodtlSize > 0) {
							for (int i = 0; i < vdodtlSize; i++) {
						%>
		
						<tr>
							<td><%=vdodtlList.get(i).getVdodtlNum() %></td>
							<td><a href="detail.do?vdodtlNum=<%=vdodtlList.get(i).getVdodtlNum()%>"><%=vdodtlList.get(i).getVdodtlNm()%></a></td>
							<td><%=vdodtlList.get(i).getVdodtlSumy()%></td>
							<td><%=vdodtlList.get(i).getVdodtlLik()%></td>
							<td><%=vdodtlList.get(i).getVdodtlRedt()%></td>
							<td><%=vdodtlList.get(i).getAtchFileId()%></td>
						</tr>
		
						<%
							}
						} else {
						%>
						<tr>
							<td colspan="5">영상의 정보가 없습니다.</td>
						</tr>
						<%
							}
						%>
						<tr style="background-color:transparent; position:relative; left:190px;">
							<td colspan="4"><a href="insert.do">[영상물 등록]</a></td>
		
						</tr>
					</table>
				</div>
			</section>
		</article>

		<!-- Footer -->
		<%@include file="../../footer.jsp" %>

	</div>
	<%
		if (msg.equals("성공")) {
	%>
	<script>
		Swal.fire({
            icon: 'success',
            title: '정상적으로 처리되었습니다.',
            showConfirmButton: false,
            timer: 5500
          }).then((value) => {
            if (value) {}
          });
	</script>
	-->
	<%
		}
	%>
	<!-- Scripts -->
	<script src="../view/js/jquery.min.js"></script>
	<script src="../view/js/jquery.scrollex.min.js"></script>
	<script src="../view/js/jquery.scrolly.min.js"></script>
	<script src="../view/js/browser.min.js"></script>
	<script src="../view/js/breakpoints.min.js"></script>
	<script src="../view/js/util.js"></script>
	<script src="../view/js/main.js"></script>
	<script>
		$("p.title").on('click', function () {
			$(this).next(".con").slideToggle(100);
		});

	</script>
</body>
</html>