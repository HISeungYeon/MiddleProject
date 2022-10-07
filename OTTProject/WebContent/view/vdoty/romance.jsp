<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.ott.mem.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<% 
	
	
	MemberVO vo = (MemberVO)session.getAttribute("vo");
	
	
	%>
	
	
<!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Disney++</title>
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">
        <link rel="shortcut icon" href="/OTTProject/view/img/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="../view/css/member-list.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>

    <body>
        <form id="guanwu" action="memlist.do" method="post" onsubmit="return f_memShip()">
            <div class="section">
                <div class="container">
                    <div class="row full-height justify-content-center">
                        <div class="col-12 text-center align-self-center py-5" id="upup">
                            <div class="section pb-5 pt-5 pt-sm-2 text-center">
                                <h2 class="mb-0 pb-3" style="top: -150px; position: relative;">D++ 내 정보 확인</h2>
                                <div class="card-3d-wrap mx-auto">
                                    <div class="card-3d-wrapper">
                                        <div class="card-front">
                                            <div class="center-wrap">
                                                <div class="section text-center">
                                                    <div class="form-group">
                                                        <tr>
                                                            <td><label id="must">*</label> 이메일</td>
                                                            <td width="250px">
                                                                <div id="memEm"><%=vo.getMemEm()%></div>
                                                            </td>
                                                        </tr>
                                                    </div>
                                                    <div class="form-group mt-2">
                                                        <tr>
                                                            <td>이름</td>
                                                            <td width="250px">
                                                                <div id="memNm">
                                                                    <%=vo.getMemNm()%>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </div>
                                                    <div class="form-group mt-2">
                                                        <tr>
                                                            <td>비밀번호</td>
                                                            <td width="250px">
                                                                <div id="memPw">
                                                                    <%=vo.getMemPw()%>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </div>
                                                    <div class="form-group mt-2">
                                                        <tr>
                                                             <td><label id="must">*</label> 전화번호</td>
                                                            <td width="250px">
                                                                <div id="memTel">
                                                                    <%=vo.getMemTel()%>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </div>
                                                    <div class="form-group mt-2">
                                                        <tr>
                                                            <td>생년월일</td>
                                                            <td width="250px">
                                                                <div id="memBir">
                                                                    <%=vo.getMemBir()%>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </div>
                                                    <div class="form-group mt-2">
                                                        <tr>
                                                            <td>국적</td>
                                                            <td width="250px">
                                                                <div id="memNal">
                                                                    <%=vo.getMemNal()%>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </div>
                                                </div>
                                                <div class="memUp">
                                                <button type="button" id="update" class="btn btn-primary"
                                                    onclick="location.href='/OTTProject/member/memberupdate.do'">수정</button>
                                                <button type="button" id="delete" class="btn btn-primary">탈퇴</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
       
        <script type="text/javascript">

            $("#delete").click(function (e) {

                e.preventDefault();

                let memEm = $("#memEm").html();
                $.ajax({
                    url: "/OTTProject/member/memberdelete.do",
                    type: "post",
                    data: "memEm=" + memEm,
                    dataType: "text",
                    success: function (result) {
                        console.log(result);
                        if (result == "실패") {
                        	Swal.fire({
                                icon: 'error',
                                title: '회원탈퇴에 실패하였습니다.',
                                showConfirmButton: false,
                                timer: 5500
                              }).then((value) => {
                                if (value) {
                                  location.replace('/OTTProject/member/memlist.do');
                                }
                              });
                        } else {
                        	Swal.fire({
                                title: 'Delete',
                                text: '정말로 탈퇴하시겠습니까?',
                                icon: 'warning',

                                showCancelButton: true,
                                ConfirmButtonColor: '#3085d6',
                                cancelButtonColor: '#d33',
                                confirmButtonText: '탈퇴',
                                cancelButtonText: '취소',

                            }).then(result => {
                                if(result.isConfirmed){
                                    location.replace('/OTTProject/index.jsp');
                                }
                            });
                        	
                        	
                        }
                    },
                    error: function (request, status, error) {
                        console.log("code: " + request.status)
                        console.log("message: " + request.responseText)
                        console.log("error: " + error);
                    }
                })
            })

        </script>

    </body>

    </html>