 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Disney++</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">
    <link rel="shortcut icon" href="/OTTProject/view/img/logo.png" type="image/x-icon">
    <link rel="stylesheet" href="../view/css/login-main.css" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>
    <form action="passwordfind.do" method="post">
        <div class="section">
            <div class="container">
                <div class="row full-height justify-content-center">
                    <div class="col-12 text-center align-self-center py-5" id="upup">
                        <div class="section pb-5 pt-5 pt-sm-2 text-center">
                            <h2 class="mb-0 pb-3">D++ Find Password</h2>
                            <div class="card-3d-wrap mx-auto">
                                <div class="card-3d-wrapper">
                                    <div class="card-front">
                                        <div class="center-wrap">
                                            <div class="section text-center">
                                                <div class="form-group">
                                                    <label for="memEm">이메일</label>
                                                    <input type="email" class="form-style" id="memEm" name="memEm"
                                                        placeholder="you@example.com" required
                                                        pattern="^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$">
                                                </div>
                                            </div>
                                            <button id="pwfind" type="button" class="btn mt-4">임시 비밀번호 발송</button>
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

        $("#pwfind").click(function (e) {

            e.preventDefault();

            let memEm = $("#memEm").val();
            let arr = new Uint32Array(1);
            let crypto = window.crypto || window.webkitCrypto || window.mozCrypto || window.oCrypto || window.msCrypto;
            window.crypto.getRandomValues(arr);
            let sRanNum = arr[0];

            $.ajax({
                url: "passwordfind.do",
                type: "post",
                data: { "memEm": memEm, "emailNum": sRanNum },
                dataType: "text",
                success: function (result) {

                    if (result != 'OK') {
                    	Swal.fire({
                            icon: 'error',
                            title: '이메일 전송에 오류가 생겼습니다. 관리자에게 문의해주세요',
                            showConfirmButton: false,
                            timer: 5500
                          }).then((value) => {
                            if (value) {
                              location.replace('/OTTProject/member/passwordfind.do');
                            }
                          });
                    } else {
                    	Swal.fire({
                            icon: 'success',
                            title: '임시번호 전송이 완료되었습니다.',
                            showConfirmButton: false,
                            timer: 5500
                          }).then((value) => {
                            if (value) {
                              location.replace('/OTTProject/member/login.do');
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