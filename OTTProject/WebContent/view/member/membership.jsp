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
        <link rel="stylesheet" href="../view/css/login-register.css" />
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <style>
            div{
                /*border: 2px solid rgb(219, 68, 85);*/
            }
        </style>
    </head>

    <body>
        <form id="guanwu" action="membership.do" method="post" onsubmit="return f_memShip()">
            <div class="section">
                <div class="container">
                    <div class="row full-height justify-content-center">
                        <div class="col-12 text-center align-self-center py-5" id="upup">
                            <div class="section pb-5 pt-5 pt-sm-2 text-center">
                                <h2 class="mb-0 pb-3" >D++ SignUp</h2>
                                <div class="card-3d-wrap mx-auto">
                                    <div class="card-3d-wrapper">
                                        <div class="card-front">
                                            <div class="center-wrap">
                                                <div class="section text-center">
                                                    <div class="form-group">
                                                        <label for="memNm">이름</label>
                                                        <input type="text" class="form-style" id="memNm" name="memNm"
                                                            placeholder="Name" value="" required
                                                            pattern="^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$">
                                                        <i class="input-icon uil uil-at"></i>
                                                    </div>
                                                    <div class="form-group mt-2">
                                                        <label for="memTel">전화번호</label>
                                                        <input type="text" class="form-style" id="memTel" name="memTel"
                                                            placeholder="-빼고 입력하시오" value="" required
                                                            pattern="^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$">
                                                            <i class="input-icon uil uil-at"></i>
                                                    </div>
                                                    <div class="form-group mt-2">
                                                        <label for="memEm">이메일</label>
                                                        <input type="email" class="form-style" id="memEm" name="memEm"
                                                            placeholder="you@example.com" required
                                                            pattern="^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$">
                                                        <input type="button" value="인증번호발송" id="eNum"
                                                            class="btn btn-primary" style="margin:10px">
                                                        <font id="email_font" size="2"></font>
                                                        <i class="input-icon uil uil-at"></i>
                                                    </div>
                                                    <div class="form-group mt-2">
                                                        <label for="codeNum">인증번호</label>
                                                        <input type="text" class="form-style" id="codeNum"
                                                            name="codeNum" placeholder="인증번호를 입력하세요" required>
                                                        <input id="cerCfm" type="submit" class="btn btn-primary"
                                                            value="인증하기" style="margin:10px">
                                                        <i class="input-icon uil uil-lock-alt"></i>
                                                    </div>
                                                    <div class="form-group mt-2">
                                                        <label for="memBir">생년월일</label>
                                                        <input type="date" class="form-style" id="memBir"
                                                            name="memBir" required>
                                                    </div>
                                                    <div class="form-group mt-2">
                                                        <label for="memNal">국적</label>
                                                        <input type="text" class="form-style" id="memNal"
                                                            name="memNal" required>
                                                    </div>
                                                    <div class="form-group mt-2">
                                                    <label for="memPw">비밀번호</label>
                                                    <input type="password" class="form-style" id="memPw" name="memPw"
                                                        placeholder="Passwrod" required pattern="^[A-Za-z0-9]{4,12}$">
                                                        <i class="input-icon uil uil-lock-alt"></i>
                                                    </div>
                                                </div>
                                                <hr class="mb-4">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="aggrement"
                                                        required>
                                                    <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에
                                                        동의합니다.</label>
                                                </div>
                                                <button class="btn mt-4" type="submit">가입완료</button>
                                                <button type="submit" class="btn mt-4" onclick="location.href='/OTTProject/index.jsp'">가입취소</button>
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
            $("#memEm").change(function () {
                let memEm = $("#memEm").val();

                $.ajax({
                    url: "duplicateEmail.do",
                    type: "post",
                    data: { memEm: memEm },
                    dataType: "json",
                    success: function (result) {
                        if (result >= 1) {
                            $("#email_font").html("사용 할 수 없는 이메일입니다.");
                            $("#email_font").attr("color", "#ff6347");
                        } else {
                            $("#email_font").html("사용 할 수 있는 이메일입니다.");
                            $("#email_font").attr("color", "#bfff00");

                            let arr = new Uint32Array(1);
                            let crypto = window.crypto || window.webkitCrypto || window.mozCrypto || window.oCrypto || window.msCrypto;
                            window.crypto.getRandomValues(arr);
                            let sRanNum = arr[0];


                            $("#eNum").click(function cerCfm() {
                                eMailCheck(sRanNum);
                            });
                        }
                    },
                    error: function (request, status, error) {
                        console.log("code: " + request.status)
                        console.log("message: " + request.responseText)
                        console.log("error: " + error);
                    }
                });
            });

            function eMailCheck(sRanNum) {
                console.log("뜨냐?")
                console.log(sRanNum);
                $.ajax({
                    type: "post",
                    url: "eMailCheck.do",
                    data: {
                        "emailNum": sRanNum,
                        "memEm": $("#memEm").val()
                    },
                    dataType: "text",
                    success: function (eqNum) {
                        if (eqNum == "OK") {
                            Swal.fire({
                                icon: 'success',
                                title: '인증번호 전송이 완료되었습니다.',
                                showConfirmButton: false,
                                timer: 5500
                            }).then((value) => {
                                if (value) {
                                }
                            });
                            let cerCfm = $("#cerCfm");
                            cerCfm.click(function cerLast() {
                                if (sRanNum == $("#codeNum").val()) {
                                    Swal.fire({
                                        icon: 'success',
                                        title: '인증번호가 일치합니다 성공^^',
                                        showConfirmButton: false,
                                        timer: 5500
                                    }).then((value) => {
                                        if (value) {
                                        }
                                    });
                                } else {
                                    console.log($("#codeNum").val());
                                    Swal.fire({
                                        icon: 'error',
                                        title: '인증번호를 다시 확인해주세요^^',
                                        showConfirmButton: false,
                                        timer: 5500
                                    }).then((value) => {
                                        if (value) {
                                        }
                                    });
                                }
                            })
                        } else {
                            alert("이메일 전송에 오류가 생겼습니다. 관리자에게 문의해주세요.");
                        }
                        //cerConfirm(eqNum);
                    },
                    error: function (request, status, error) {
                        console.log("code: " + request.status)
                        console.log("message: " + request.responseText)
                        console.log("error: " + error);
                    }
                })
            }

            function f_memShip() {
                event.preventDefault();
                $.ajax({
                    type: "post",
                    url: $("#guanwu")[0].action,
                    data: $("#guanwu").serialize(),
                    dataType: "text",
                    success: function (rslt) {
                        console.log(rslt);
                        if (rslt == "성공") {
                            Swal.fire({
                                icon: 'success',
                                title: 'D++ 가족이 되신걸 환영합니다! -대표자 이승연-',
                                showConfirmButton: false,
                                timer: 5500
                            }).then((value) => {
                                if (value) {
                                    location.replace('/OTTProject/index.jsp');
                                }
                            });
                            // 						location.href="/OTTProject/index.jsp";		 		 		
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: '정보를 양식에 맞게 정확히 입력해 주세요',
                                showConfirmButton: false,
                                timer: 5500
                            }).then((value) => {
                                if (value) {
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

            }

        </script>

    </body>

    </html>