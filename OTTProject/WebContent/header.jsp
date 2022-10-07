<%@page import="java.util.List" %>
	<%@page import="kr.or.ddit.ott.mem.vo.MemberVO" %>
		<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
			<% MemberVO mvo=(MemberVO) session.getAttribute("vo");%>

				<meta charset="UTF-8">
				<header id="header">
					<h1 style="top:12px;"><a href="/OTTProject/main/main.do"><img id="logo"
								src="/OTTProject/view/img/logo.png"></a></h1>
					<div><button class="toggle" type="button" style="border: 1px solid white;" onclick="kidsChange()">kids</button></div>
					<nav id="nav">
						<ul>
							<li class="special">
								<a href="#menu" class="menuToggle"><span>Menu</span></a>
								<div id="menu">

									<ul>
										<div class="accordion-box">

											<ul class="list">
												<li>
													<p class="title"><a class="title" href="#">
															<%=mvo.getMemNm() %>님, 환영합니다!
														</a></p>
												</li>

												<li>
													<p class="title"><a class="title"
															href="/OTTProject/main/main.do">Home</a></p>
												</li>
												<li>
													<p class="title"><a href="#">장르별 조회</a></p>
													<div class="con">
														<a href="/OTTProject/view/main/genre.jsp"
															style="text-decoration:none">로맨스</a><br>
														<a href="/OTTProject/view/main/genre.jsp">코미디</a><br>
														<a href="/OTTProject/view/main/genre.jsp">스릴러</a><br>
														<a href="/OTTProject/view/main/genre.jsp">미스터리</a><br>
														<a href="/OTTProject//vdoty/action.do">액션</a><br>
														<a href="/OTTProject/view/main/genre.jsp">판타지</a><br>
														<a href="/OTTProject/view/main/genre.jsp">공포</a><br>
														<a href="/OTTProject/view/main/genre.jsp">키즈</a><br>
														<a href="/OTTProject/view/main/genre.jsp">애니메이션</a><br>
													</div>
												</li>
												<li>
													<p class="title"><a href="#">마이페이지</a></p>

													<div class="con"><a href="/OTTProject/member/memlist.do"
															style="text-decoration:none">본인정보</a><br>
														<a href="/OTTProject/wachis/list.do">시청기록</a><br>
														<a href="/OTTProject/lkhis/list.do">좋아요기록</a><br>
														<a href="/OTTProject/wislist/list.do">찜목록</a><br>
														<a href="/OTTProject/ntc/list.do">고객센터</a><br>
													</div>



												</li>
												<li>
													<p class="title"><a href="/OTTProject/view/member/logout.jsp">log
															out</a></p>
												</li>

											</ul>
										</div>
									</ul>
								</div>
							</li>
						</ul>
					</nav>
				</header>
				<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
				<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
				<script>
					function kidsChange() {
						// 	genre.jsp, main.do
						let curLocation = location.href
						if (curLocation.indexOf("genre.jsp") != -1) {
							Swal.fire({
								icon: 'success',
								title: '키즈모드 해제!!',
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
								title: '키즈모드!!',
								showConfirmButton: false,
								timer: 5500
							}).then((value) => {
								if (value) {
									location.replace('/OTTProject/view/main/genre.jsp');
								}
							});
						}

					}

					$(function () {
						// 	genre.jsp, main.do
						let curLocation = location.href
						if (curLocation.indexOf("genre.jsp") != -1) {
							$(".toggle").css("backgroundColor", "#00f0ff")
						} else {
							$(".toggle").css("backgroundColor", "#1b1d29")
						}
					})

				</script>