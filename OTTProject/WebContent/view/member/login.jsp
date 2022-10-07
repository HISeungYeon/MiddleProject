<%@page import="kr.or.ddit.ott.mem.vo.MemberVO" %>
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <title>Disney++</title>
      <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">
      <link rel="shortcut icon" href="/OTTProject/view/img/logo.png" type="image/x-icon">
      <link rel="stylesheet" href="../view/css/login-main.css" />
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
      <!-- <link rel="stylesheet" href="/OTTProject/view/css/main.css" /> -->
    </head>

    <body style="background-color: #1f2029;">
      <!-- <header id="header">
		<h1 style="top:12px;"><a href="/OTTProject/main/main.do"><img id="logo" src="/OTTProject/view/img/logo.png"></a></h1>
	</header> -->
      <form class="form-register" action="login.do" method="post">
        <div class="section">
          <div class="container">
            <div class="row full-height justify-content-center">
              <div class="col-12 text-center align-self-center py-5">
                <div class="section pb-5 pt-5 pt-sm-2 text-center">
                  <h2 class="mb-0 pb-3">D++ Login</h2>
                  <div class="card-3d-wrap mx-auto">
                    <div class="card-3d-wrapper">
                      <div class="card-front">
                        <div class="center-wrap">
                          <div class="section text-center">
                            <h4 class="mb-4 pb-3">Log In</h4>
                            <div class="form-group">
                              <input type="email" id="memEm" name="memEm" class="form-style" placeholder="enter E-mail"
                                required>
                              <i class="input-icon uil uil-at"></i>
                            </div>
                            <div class="form-group mt-2">
                              <input type="password" class="form-style" id="memPw" name="memPw"
                                placeholder="enter password" required>
                              <i class="input-icon uil uil-lock-alt"></i>
                            </div>
                            <button type="button" id="login" class="btn mt-4">로그인</button>
                            <p class="mb-0 mt-4 text-center"><a href="/OTTProject/member/passwordfind.do"
                                class="link">Forgot your password?</a></p>
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

        $("#login").click(function (e) {

          e.preventDefault();

          let memEm = $("#memEm").val();
          let memPw = $("#memPw").val();

          $.ajax({
            url: "login.do",
            type: "post",
            data: "memEm=" + memEm + "&memPw=" + memPw,
            dataType: "json",
            success: function (resp) {

              if (resp.result != 'ok') {
                Swal.fire({
                  icon: 'error',
                  title: '아이디나 비밀번호를 다시 입력해주세요.',
                  showConfirmButton: false,
                  timer: 5500
                }).then((value) => {
                  if (value) {
                    location.replace('/OTTProject/member/login.do');
                  }
                });
              } else if (memEm == "test123@naver.com") {
                Swal.fire({
                  icon: 'success',
                  title: '관리자로 로그인하셨습니다.',
                  showConfirmButton: false,
                  timer: 5500
                }).then((value) => {
                  if (value) {
                    location.replace('/OTTProject/main/main.do');
                  }
                });
              } else if (memEm == "gw9955@naver.com") {
                Swal.fire({
                  icon: 'success',
                  title: '환영합니다!! 로그인에 성공하였습니다.',
                  showConfirmButton: false,
                  timer: 5500
                }).then((value) => {
                  if (value) {
                    location.replace('/OTTProject/main/main.do');
                  }
                });
              } else {
                Swal.fire({
                  icon: 'success',
                  title: '환영합니다!! 로그인에 성공하였습니다.',
                  showConfirmButton: false,
                  timer: 5500
                }).then((value) => {
                  if (value) {
                    location.replace('/OTTProject/subpay.jsp');
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