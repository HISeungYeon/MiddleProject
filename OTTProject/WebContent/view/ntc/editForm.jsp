                                                    <%@page import="kr.or.ddit.ott.ntc.vo.NtcVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
	NtcVO vo = (NtcVO) request.getAttribute("vo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Disney++</title>
<link rel="shortcut icon" href="/OTTProject/view/img/logo.png"type="image/x-icon">/title>
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
		<%@include file ="/header.jsp" %>
        <!-- Main -->
        <div class="board_wrap">
            <div class="board_title">
                <h2>공지사항</h2>
            </div>
            <div class="board_write_wrap">
                <div class="board_write">
                    <div class="title">
                        <input type="hidden" name="ntcNum" value="${vo.ntcNum}">
                        <dl>
                            <dt class="mt-3" style="font-weight: 800;">제목</dt>
                            <dd><input type="text" name="ntcTit" placeholder="제목 입력" value="${vo.ntcTit}" required></dd>
                        </dl>
                    </div>
                    <div class="info">
                        <dl>
                            <dt>작성자</dt>
                            <dd><input type="text" value="관리자" disabled></dd>
                        </dl>
                    </div>
                    <div class="cont"  style="height: 300px;">
                    <textarea placeholder="내용 입력" name="ntcCon" placeholder="내용" style="height: 290px;">${vo.ntcCon}</textarea>
                    </div>
                </div>
                <div class="bt_wrap" style="padding: 20px;">
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

<!-- <h3>수정하기</h3>
<form action="update.do" method="post">
	<input type="hidden" name="ntcNum" value="${vo.ntcNum}">
	<input type="text" name="ntcTit" value="${vo.ntcTit}" required><br>
	<textarea rows="4" cols="25" name="ntcCon" placeholder="내용">${vo.ntcCon}</textarea><br>
	<input type="submit" value="수정"> 
</form> -->
</body>
</html>