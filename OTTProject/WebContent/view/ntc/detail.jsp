<%@page import="kr.or.ddit.ott.oob.vo.OobVO"%>
<%@page import="kr.or.ddit.ott.mem.vo.MemberVO"%>
<%@page import="kr.or.ddit.ott.ntc.vo.NtcVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	NtcVO vo = (NtcVO) request.getAttribute("vo");
	OobVO ov = (OobVO) request.getAttribute("ov");
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

<form id="id_rform" action="update.do" method="post">
    <input type="hidden" name="nm_gnum" value="">

    <div id="page-wrapper">

        <!-- Header -->
        <%@include file="/header.jsp"%>

        <!-- Main -->
		<article id="main">
            <div class="board_wrap">
                <div class="board_title" style="padding: 10px;">
                    <h2>공지사항</h2>
                </div>
                <div class="board_view_wrap">
                    <div class="board_view">
                        <dt class="mt-3" style="font-weight: 800;">제목</dt>
                        <div class="title" style="padding-bottom: 20px;">
                            <input type="text" name="ntcTit" value="${vo.ntcTit}" disabled style="border: none;">
                        </div>
                        <div class="info">
                            <dl class="abc">
                                <dt>글 번호</dt>
                                <dd>${vo.ntcNum}</dd>
                            </dl>
                            <!-- <dl>
                                <dt>작성자</dt>
                                <dd><input type="text" name="" value="관리자" disabled style="border: none; background: white;"></dd>
                            </dl> -->
                            <dl>
                                <dt>작성일</dt>
                                <dd>${vo.ntcDate}</dd>
                            </dl>
                        </div>
                        <div class="cont" style="height: 300px;">
                            <textarea placeholder="내용 입력" name="ntcCon" placeholder="내용"  style="height: 290px;">${vo.ntcCon}</textarea>

                        </div>
                    </div>
                    
                    <%if(Integer.parseInt(mvo.getMemNum()) == 0) { %>
                    <div class="bt_wrap">
                        <button type="button" class="btn btn-outline-light" 
						onclick="location.href='update.do?ntcNum=${vo.ntcNum}'">수정하기</button>
                        <button type="button" class="btn btn-outline-light" 
						onclick="location.href='list.do'">뒤로가기</button>
                    </div>
                    <%} %>
                </div>
            </div>
        </article>
    </div> 
</form>


<!-- <h3>글 정보</h3>
<p>번호:${vo.ntcNum}</p>
<p>제목:${vo.ntcTit}</p>
<p>내용:${vo.ntcCon}</p>
<p>등록일자:${vo.ntcDate}</p>
<a href="update.do?ntcNum=${vo.ntcNum}"><button>수정</button></a>
<a href="delete.do?ntcNum=${vo.ntcNum}"><button>삭제</button></a> -->
</body>
</html>