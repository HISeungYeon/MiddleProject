<%@page import="kr.or.ddit.ott.mem.vo.MemberVO"%>
<%@page import="comm.vo.AtchFileVO"%>
<%@page import="comm.service.IAtchFileService"%>
<%@page import="comm.service.AtchFileServiceImpl"%>
<%@page import="kr.or.ddit.ott.vdodtl.vo.VdodtlVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
VdodtlVO vo = (VdodtlVO) request.getAttribute("vo");
AtchFileVO fv = (AtchFileVO) request.getAttribute("fv");
List<AtchFileVO> atchFileList = (List<AtchFileVO>) request.getAttribute("atchFileList");
List<VdodtlVO> vdodtlList = (List<VdodtlVO>) request.getAttribute("vdodtlList");
List<VdodtlVO> rankList = (List<VdodtlVO>) request.getAttribute("rankList");
System.out.println("-=-=-=-=-=-=-=메인페이지" + vdodtlList);
System.out.println("-=-=-=-=-=-=-=랭크페이지" + rankList);
%>
<!DOCTYPE HTML>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Disney++</title>
		<link rel="shortcut icon" href="/OTTProject/view/img/logo.png"type="image/x-icon">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	
		<link rel="stylesheet" href="../view/css/main.css" />

		<style>
			.movie1{
				display: inline-block;
			}
			.mySlides {
				display:none;
			}
			.w3-btn-floating{
				position:absolute;
				top:45%;
				padding: 40px;
				font-size: 50px;
			}
			.adm {
				margin-top: 20px;
			}
			.right {
				display: flex;
				justify-content: flex-end;
			}
			.hh1 {
				background-color: #198754;
			}
			.po1:hover {
				transform: scale(1.2);
				background-color: bisque;
			}
			.po1 {
				margin-right: 100px
			}

		</style>
	</head>

	
	<body class="is-preload">

		<!-- Page Wrapper -->
		<div id="page-wrapper">

			<!-- Header -->
			<%@include file ="/header.jsp" %>

			<!-- Main -->
			<div id="main-banner">
				<div id="slideShow">
					<div class="slider" id="slider" style="w">
						<img class="mySlides" id="main-img" src="/OTTProject/view/img/contents/빅히어로2.jpg">
						<img class="mySlides" id="main-img" src="/OTTProject/view/img/contents/연애빠진로맨스가로.jpg">
						<img class="mySlides" id="main-img" src="/OTTProject/view/img/contents/마녀가로2.jpg">
						<img class="mySlides" id="main-img" src="/OTTProject/view/img/contents/정직한후보가로.jpg">

						<a class="w3-btn-floating" style="left:0" onclick="plusDivs(-1)" href="#">❮</a>
						<a class="w3-btn-floating" style="right:0" onclick="plusDivs(1)" href="#">❯</a>						

					</div>
				</div>
				
				<section class="wrapper style5">
					<div class="inner" style="width: 65em;">
						<div class="movie1">
							<form action="search.do" class="mt-5 container" method="GET">
								<select name="part">
									<option value="vdodtl_nm">제목</option>
									<option value="vdoty_nm">장르</option>
								</select>
								<div class="mx-quto input-group mt-5 right">
							        <mx-auto>
							            <input name="searchData" type="text" class="form-control" placeholder="장르,제목 검색" aria-label="search" aria-describedby="button-addon2" value="">
							        </mx-auto>
										<input name="streFileNm" type="hidden">				        
							        <button class="btn btn-success hh1" type="submit" id="button-addon2">검색</button>
							    </div>
							</form>
							<%
								if(mvo.getMemNum().equals("0") ) { %>
									<button class="po1" type="button" class="btn btn-outline-light " onclick="location.href='/OTTProject/vdodtl/list.do'" style="background: darkcyan;">영상물 관리</button>
									<button class="po1" type="button" class="btn btn-outline-light " onclick="location.href='/OTTProject/ntc/list.do'" style="background: darkcyan;">게시판 관리</button>
									<button class="po1" type="button" class="btn btn-outline-light " onclick="location.href='/OTTProject/member/adminMemList.do'" style="background: darkcyan;">회원정보 관리</button>
									<h1 class="adm">실시간 업로드 영화</h1>
							<%  } else { %>
									<h1>실시간 업로드 영화</h1>
							<% } %>	
						</div>
						<div>
							<input type="button" value="&lang;" id="content1-btnLeft" class="btncommL">
							<input type="button" value="&rang;" id="content1-btnRight" class="btncommR">
							<div class="swiper-content" id="swiperContent1">
								<%
									int vdodtlSize = vdodtlList.size();
										if(vdodtlSize > 0){
											for(int i=0; i< vdodtlSize; i++){
										
								%>
								<a href="detail.do?vdodtlNum=<%=vdodtlList.get(i).getVdodtlNum()%>"><img src="/OTTProject/hsImages/<%= vdodtlList.get(i).getStreFileNm() %>" id="content-img" class="vdd"></a>
								<%
										}
										}
								%>
							</div>
						</div>
						<div>
							<h1>오늘의 TOP 10</h1>
						</div>
						<div>
							<input type="button" value="&lang;" id="content2-btnLeft" class="btncommL">
							<input type="button" value="&rang;" id="content2-btnRight" class="btncommR">
							<div class="swiper-content" id="swiperContent1">
								<%
									 int rankListSize = rankList.size();
										if(rankListSize > 0){
											for(int i=0; i< rankListSize; i++){
										
								%>
								<a href="detail.do?vdodtlNum=<%=rankList.get(i).getVdodtlNum()%>"><img src="/OTTProject/hsImages/<%= rankList.get(i).getStreFileNm() %>" id="content-img" class="vdd2"></a>
								<%
										}
										}
								%>
								
							</div>
						</div>
						<div>
							<h1>온 가족이 함께 보면 좋을 영화</h1>
						</div>
						<div>
							<input type="button" value="&lang;" id="content3-btnLeft" class="btncommL">
							<input type="button" value="&rang;" id="content3-btnRight" class="btncommR">
							<div class="swiper-content" id="swiperContent3">
								<img src="/OTTProject/view/img/contents/리틀포레.jpg" id="content-img">
								<img src="/OTTProject/view/img/contents/미션임파서블.jpg" id="content-img">
								<img src="/OTTProject/view/img/contents/겨울왕국.jpg" id="content-img">
								<img src="/OTTProject/view/img/contents/하이큐.jpg" id="content-img">
								<img src="/OTTProject/view/img/contents/형.jpg" id="content-img">
								<img src="/OTTProject/view/img/contents/정직한후보.jpg" id="content-img">
							</div>
						</div>
						<div>
							<h1>두근두근 Coming Soon</h1>
						</div>
						<div>
							<input type="button" value="&lang;" id="content4-btnLeft" class="btncommL">
							<input type="button" value="&rang;" id="content4-btnRight" class="btncommR">
							<div class="swiper-content" id="swiperContent4">
								<img src="/OTTProject/view/img/contents/공조.jpg" id="content-img">
								<img src="/OTTProject/view/img/contents/늑대사냥.jpg" id="content-img">
								<img src="/OTTProject/view/img/contents/헌트.jpg" id="content-img">
								<img src="/OTTProject/view/img/contents/정직한후보.jpg" id="content-img">
								<img src="/OTTProject/view/img/contents/아바타.jpg" id="content-img">
								<img src="/OTTProject/view/img/contents/한산.jpg" id="content-img">
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>

		<script>
			var myIndex = 0;
			carousel();

			function carousel() {
				var i;
				var x = document.getElementsByClassName("mySlides");
				for (i = 0; i < x.length; i++) {
					x[i].style.display = "none";
				}
				myIndex++;
				if (myIndex > x.length) { myIndex = 1 }
				x[myIndex - 1].style.display = "block";
				setTimeout(carousel, 2000); // Change image every 2 seconds
			}

			var slideIndex = 1;
			showDivs(slideIndex);

			function plusDivs(n) {
				showDivs(slideIndex += n);
			}

			function showDivs(n) {
				var i;
				var x = document.getElementsByClassName("mySlides");
				if (n > x.length) { slideIndex = 1 }
				if (n < 1) { slideIndex = x.length };
				for (i = 0; i < x.length; i++) {
					x[i].style.display = "none";
				}
				x[slideIndex - 1].style.display = "block";
			}

		</script>

		<script>
			var v_vdo = document.querySelectorAll(".vdd");
			console.log(v_vdo.length-1);
			var v_vdo2 = document.querySelectorAll(".vdd2");
			var $swiperContent1 = $("#swiperContent1");						
				$("#content1-btnLeft").on("click", function () {
					var $childs = $swiperContent1.children();
					$swiperContent1.append(
						$childs.eq(0));
				})

				$("#content1-btnRight").on("click", function () {
					var $childs = $swiperContent1.children();
					$swiperContent1.prepend(
						$childs.eq(v_vdo.length-1));
				})

			var $swiperContent2 = $("#swiperContent2");
				$("#content2-btnLeft").on("click", function () {
					var $childs = $swiperContent2.children();
					$swiperContent2.append(
						$childs.eq(0));
				})

				$("#content2-btnRight").on("click", function () {
					var $childs = $swiperContent2.children();
					$swiperContent2.prepend(
						$childs.eq(v_vdo2.length-1));
				})

			var $swiperContent3 = $("#swiperContent3");
				$("#content3-btnLeft").on("click", function () {
					var $childs = $swiperContent3.children();
					$swiperContent3.append(
						$childs.eq(0));
				})

				$("#content3-btnRight").on("click", function () {
					var $childs = $swiperContent3.children();
					$swiperContent3.prepend(
						$childs.eq(5));
				})

			var $swiperContent4 = $("#swiperContent4");
				$("#content4-btnLeft").on("click", function () {
					var $childs = $swiperContent4.children();
					$swiperContent4.append(
						$childs.eq(0));
				})

				$("#content4-btnRight").on("click", function () {
					var $childs = $swiperContent4.children();
					$swiperContent4.prepend(
						$childs.eq(5));
				})
		</script>
				
		<!-- Footer -->
		<%@include file ="../../footer.jsp" %>

		
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

		</script>

	</body>
</html>