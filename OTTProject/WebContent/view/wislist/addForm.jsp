<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Disney++</title>
<link rel="shortcut icon" href="/OTTProject/view/img/logo.png"type="image/x-icon">
<link rel="stylesheet" href="../view/css/main.css">

</head>

<body>
    <form id="id_wform" action="add.do" method="post">
        <div id="page-wrapper">

            <!-- Header -->
            <%@include file="/header.jsp" %>
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
                                    <dt>제목</dt>
                                    <dd><input type="text" name="oobTit" value="" placeholder="제목 입력" required oninvalid="f_check1(this)">
                                    </dd>
                                </dl>
                            </div>
                            <div class="info">
                                <dl>
                                    <dt>작성자</dt>
                                    <dd><input type="text" name="memNum" value="" placeholder=""></dd>
                                </dl>
                            </div>
                            <div class="cont">
                                <textarea name="oobCon" cols="50" rows="10" placeholder="내용 입력"
                                    required></textarea>
                            </div>
                        </div>
                        <div class="bt_wrap" style="padding: 20px;">
                            <input type="submit" value="등록">
                            <input type="button" onclick="location.href='../oob/list.do'" value="취소">
                        </div>
                    </div>
                </div>
            </article>

                <!-- Footer -->
                <%@include file="../../footer.jsp" %>

        </div>

    </form>
        <!-- Scripts -->
        <script src="../view/js/jquery.min.js"></script>
        <script src="../view/js/jquery.scrollex.min.js"></script>
        <script src="../view/js/jquery.scrolly.min.js"></script>
        <script src="../view/js/browser.min.js"></script>
        <script src="../view/js/breakpoints.min.js"></script>
        <script src="../view/js/util.js"></script>
</body>

</html>