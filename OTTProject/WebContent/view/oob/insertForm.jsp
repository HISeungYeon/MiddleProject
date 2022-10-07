<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="kr.or.ddit.ott.mem.vo.MemberVO"%>
<%
MemberVO vo = (MemberVO)session.getAttribute("vo");
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
    </style>

</head>

<body>
    <form id="id_wform" action="insert.do" method="post">
        <div id="page-wrapper">

            <!-- Header -->
            <%@include file ="/header.jsp" %>
            <!-- Main -->
            <article id="main">
                <div class="board_wrap">
                    <div class="board_title">
                        <h2>1:1 문의</h2>
                        <p>무엇이든 문의하세요</p>
                    </div>
                    <div class="board_write_wrap">
                        <div class="board_write">
                            <div class="title">
                                <dl>
                                    <dt class="mt-3">제목</dt>
                                    <dd><input type="text" name="oobTit" value="" placeholder="제목 입력" required oninvalid="f_check1(this)">
                                    </dd>
                                </dl>
                            </div>
                            <div class="info">
                                <dl>
                                    <dt>작성자</dt>
                                    <dd><input type="text" name="memNm" value="<%=vo.getMemNm()%>"></dd>
                                    <input type="hidden" name="memNum" value="<%=vo.getMemNum()%>">
                                </dl>
                            </div>
                            <div class="cont">
                                <textarea name="oobCon" cols="50" rows="10" placeholder="내용 입력"
                                    required></textarea>
                            </div>
                        </div>
                        <div class="bt_wrap" style="padding: 20px; text-align: center;">
                            <button type="submit" class="btn btn-outline-light">등록</button>
                            <button type="button" class="btn btn-outline-light" onclick="location.href='/OTTProject/oob/list.do'">취소</button>
                        </div>
                    </div>
                </div>
            </article>

            <!-- Footer -->
            <%@include file="../../footer.jsp" %>

        </div>

    </form>
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

	    	function f_check1(p_this){
	    		p_this.setCustomValidity('제목을 입력해주세요!');
	    		p_this.focus();
	    	}
        </script>
</body>

</html>