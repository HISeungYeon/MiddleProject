<%@page import="kr.or.ddit.ott.oob.vo.OobVO"%>
<%@page import="kr.or.ddit.ott.mem.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
	OobVO ov = (OobVO) request.getAttribute("ov");
	MemberVO vo = (MemberVO) session.getAttribute("vo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Disney++</title>
<link rel="shortcut icon" href="/OTTProject/view/img/logo.png"type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../view/css/main.css">
<style>
div {
	/* border: 3px solid red; */
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
<form action="update.do" method="post">
    <input type="hidden" name="nm_gnum" value="">
	<div id="page-wrapper">
        <!-- Header -->
		<%@include file="/header.jsp"%>
        <!-- Main -->
        <div class="board_wrap">
            <div class="board_title">
                <h2>1:1 문의</h2>
                <p>무엇이든 문의하세요</p>
            </div>
            <div class="board_write_wrap">
                <div class="board_write">
                    <div class="title">
                        <input type="hidden" name="oobNum" value="${ov.oobNum}">
                        <dl>
                            <dt class="mt-3" style="font-weight: 800;">제목</dt>
                            <dd><input type="text" name="oobTit" placeholder="제목 입력" value="${ov.oobTit}" required></dd>
                        </dl>
                    </div>
                    <div class="info">
                        <dl>
                            <dt>작성자</dt>
                            <dd><input type="text" name="memNm" value="<%=vo.getMemNm()%>" readonly></dd>
                                    <input type="hidden" name="memNum" value="${ov.memNum}">
                            <!-- <dd>${ov.memNum}</dd> -->
                        </dl>
                    </div>
                    <div class="cont">
                    <textarea placeholder="내용 입력" name="oobCon" placeholder="내용">${ov.oobCon}</textarea>
                    </div>
                </div>
                <div class="bt_wrap" style="padding: 20px; text-align: center;">
                    <button type="submit" class="btn btn-outline-light">수정</button>
                    <button type="button" class="btn btn-outline-light" onclick="location.href='list.do'">취소</button>
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
</body>
</html>