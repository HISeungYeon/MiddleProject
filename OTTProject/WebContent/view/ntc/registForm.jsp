<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Disney++</title>
<link rel="shortcut icon" href="/OTTProject/view/img/logo.png"type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../view/css/main.css">
</head>
<body>
<form id="id_wform" action="regist.do" method="post">
    <div id="page-wrapper">

        <!-- Header -->
        <%@include file="/header.jsp" %>
        <!-- Main -->
        <article id="main">
            <div class="board_wrap">
                <div class="board_title">
                    <h2>공지사항</h2>
                </div>
                <div class="board_write_wrap">
                    <div class="board_write">
                        <div class="title">
                            <dl>
                                <dt class="mt-3">제목</dt>
                                <dd><input type="text" name="ntcTit" value="" placeholder="제목 입력" required oninvalid="f_check1(this)"></dd>
                            </dl>
                        </div>
                        <div class="info">
                            <dl>
                                <dt>작성자</dt>
                                <dd><input type="text" name="" value="관리자" placeholder="" disabled></dd>
                            </dl>
                        </div>
                        <div class="cont">
                            <textarea name="ntcCon" cols="50" rows="10" placeholder="내용 입력" required></textarea>
                        </div>
                    </div>
                    <div class="bt_wrap" style="padding: 20px; text-align: center;">
                        <input type="submit" value="등록">
                        <input type="button" onclick="location.href='/OTTProject/ntc/list.do'" value="취소">
                    </div>
                </div>
            </div>
        </article>
    </div>

</form>
<script>
	function f_check1(p_this){
		p_this.setCustomValidity('제목을 입력해주세요!');
		p_this.focus();
	}
</script>
</body>
</html>