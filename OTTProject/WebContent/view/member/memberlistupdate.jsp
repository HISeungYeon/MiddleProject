<%@page import="kr.or.ddit.ott.mem.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<% MemberVO vo = (MemberVO)session.getAttribute("vo");%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Disney++</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">
    <link rel="shortcut icon" href="/OTTProject/view/img/logo.png" type="image/x-icon">
    <link rel="stylesheet" href="../view/css/member-list.css" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>
    <form action="memberupdate.do" method="post">
        <div class="section">
            <div class="container">
                <div class="row full-height justify-content-center">
                    <div class="col-12 text-center align-self-center py-5" id="upup">
                        <div class="section pb-5 pt-5 pt-sm-2 text-center">
                            <h2 class="mb-0 pb-3" style="top: -150px; position: relative;">D++ 내 정보 수정</h2>
                            <div class="card-3d-wrap mx-auto">
                                <div class="card-3d-wrapper">
                                    <div class="card-front aa">
                                        <div class="center-wrap">
                                            <div class="section text-center">
                                                <div class="form-group">
                                                    <tr>
                                                        <td width="200px"><label id="must">*</label> 이메일</td>
                                                        <td width="250px"><br><input type="text" class="form-style ema2" disabled="disabled"
                                                                id="memEm" name="memEm" value="<%=vo.getMemEm()%>"></td>
                                                    </tr>
                                                </div>
                                                <div class="form-group mt-2">
                                                    <tr>
                                                        <td>이름</td>
                                                        <td width="250px"><br><input type="text" class="form-style" id="memNm" name="memNm"
                                                                value="<%=vo.getMemNm()%>"></td>
                                                    </tr>
                                                </div>
                                                <div class="form-group mt-2">
                                                    <tr>
                                                        <td>비밀번호</td>
                                                        <td width="250px"><br><input type="text" class="form-style" id="memPw" name="memPw"
                                                                value="<%=vo.getMemPw()%>"></td>
                                                    </tr>
                                                </div>
                                                <div class="form-group mt-2">
                                                    <tr>
                                                        <td>전화번호</td>
                                                        <td width="250px"><br><input type="text" class="form-style" id="memTel" name="memTel"
                                                                value="<%=vo.getMemTel()%>"></td>
                                                    </tr>
                                                </div>
                                                <div class="form-group mt-2">
                                                    <tr>
                                                        <td><label id="must">*</label> 생년월일</td>
                                                        <td width="250px"><br><input type="text" class="form-style  ema2" disabled="disabled"
                                                                id="memBir" name="memBir" value="<%=vo.getMemBir()%>">
                                                        </td>
                                                    </tr>
                                                </div>
                                                <div class="form-group mt-2">
                                                    <tr>
                                                        <td>국적</td>
                                                        <td width="250px"><br><input type="text" class="form-style" id="memNal" name="memNal"
                                                                value="<%=vo.getMemNal()%>"></td>
                                                    </tr>
                                                </div>
                                            </div>
                                            <div class="memUp">
                                                <button type="button" id="update" class="btn btn-primary">수정하기</button>
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script type="text/javascript">

$("#update").click(function(e) {
		
		e.preventDefault();
		
		let memEm = $("#memEm").val();
		let memNm = $("#memNm").val();
		let memPw = $("#memPw").val();
		let memTel = $("#memTel").val();
		let memBir = $("#memBir").val();
		let memNal = $("#memNal").val();

		$.ajax({
			url : "memberupdate.do",
			type : "post",
			data : {"memEm": memEm, "memNm": memNm, "memPw": memPw, "memTel": memTel, "memBir": memBir, "memNal": memNal},
			dataType : "text",
			success : function(result) {
				
				if (result == '실패') {
					Swal.fire({
                        icon: 'error',
                        title: '회원수정에 실패하였습니다.',
                        showConfirmButton: false,
                        timer: 5500
                      }).then((value) => {
                        if (value) {
                          location.replace('/OTTProject/member/memberupdate.do');
                        }
                      });
				} else {
					$("#memEm").attr("disabled", false);
					$("#memBir").attr("disabled", false);
					Swal.fire({
                        icon: 'success',
                        title: '회원정보 수정완료!',
                        showConfirmButton: false,
                        timer: 5500
                      }).then((value) => {
                        if (value) {
                          location.replace('/OTTProject/member/memlist.do');
                        }
                      });
					
				}
			},
			error : function(request, status, error) {
				console.log("code: " + request.status)
				console.log("message: " + request.responseText)
				console.log("error: " + error);
			}
		})
	})

    </script>

</body>

</html>