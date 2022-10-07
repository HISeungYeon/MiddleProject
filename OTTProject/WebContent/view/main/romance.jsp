<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Disney++</title>
		<link rel="shortcut icon" href="/OTTProject/view/img/logo.png"type="image/x-icon">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../css/main.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	

		<style>
			div{
				/* border: 3px solid red; */
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
				<div class="slider" id="slider">
					<img class="mySlides" id="main-img" src="/OTTProject/view/img/contents/키즈17.jpg">
					<img class="mySlides" id="main-img" src="/OTTProject/view/img/contents/키즈14.jpg">
					<img class="mySlides" id="main-img" src="/OTTProject/view/img/contents/키즈15.jpg">
					<img class="mySlides" id="main-img" src="/OTTProject/view/img/contents/키즈16.jpg">

					<a class="w3-btn-floating" style="left:0" onclick="plusDivs(-1)" href="#">❮</a>
					<a class="w3-btn-floating" style="right:0" onclick="plusDivs(1)" href="#">❯</a>						

				</div>
			</div>
			
			<div id="category"><h1 style="font-size: 2em;">키즈전용</h1></div>

			<section class="wrapper style5">
				<div class="inner">
					<div>
						<div class="swiper-content" id="swiperContent">
							<img src="../img/contents/키즈1.jpg" id="content-img">
							<img src="../img/contents/키즈2.jpg" id="content-img">
							<img src="../img/contents/키즈3.jpg" id="content-img">
							<img src="../img/contents/키즈4.jpg" id="content-img">
							<img src="../img/contents/키즈5.jpg" id="content-img">
						</div>
					</div>
					<div>
						<div class="swiper-content" id="swiperContent">
							<img src="../img/contents/키즈10.jpg" id="content-img">
							<img src="../img/contents/키즈11.jpg" id="content-img">
							<img src="../img/contents/키즈8.jpg" id="content-img">
							<img src="../img/contents/키즈6.jpg" id="content-img">
							<img src="../img/contents/키즈7.jpg" id="content-img">
						</div>
					</div>
					<div>
						<div class="swiper-content" id="swiperContent">
							<img src="../img/contents/키즈4.jpg" id="content-img">
							<img src="../img/contents/키즈5.jpg" id="content-img">
							<img src="../img/contents/키즈1.jpg" id="content-img">
							<img src="../img/contents/키즈2.jpg" id="content-img">
							<img src="../img/contents/키즈3.jpg" id="content-img">
						</div>
					</div>
					<div>
						<div class="swiper-content" id="swiperContent">
							<img src="../img/contents/키즈8.jpg" id="content-img">
							<img src="../img/contents/키즈9.jpg" id="content-img">
							<img src="../img/contents/키즈12.jpg" id="content-img">
							<img src="../img/contents/키즈11.jpg" id="content-img">
							<img src="../img/contents/키즈6.jpg" id="content-img">
						</div>
					</div>
				</div>
			</section>
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

		<!-- Footer -->
		<%@include file ="../../footer.jsp" %>

		</div>
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