<%@page import="kr.or.ddit.ott.vdoty.vo.VdoTyVO"%>
<%@page import="kr.or.ddit.ott.mem.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="comm.vo.AtchFileVO"%>
<%@page import="kr.or.ddit.ott.vdodtl.vo.VdodtlVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
VdodtlVO vo = (VdodtlVO) request.getAttribute("vo");
List<AtchFileVO> atchFileList = (List<AtchFileVO>) request.getAttribute("atchFileList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Disney++</title>
<link rel="shortcut icon" href="/OTTProject/view/img/logo.png"type="image/x-icon">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
.fakeimg {
	height: 200px;
	background: #aaa;
}
a {
	color: #aaa;
	text-decoration: none;
}
.ima1 {
	width: 245px;
	height: 353px;
}

.box2 {
	background-color: #343a40;
	width: 100vw;
	height: 100vh;
}

h2 {
	color: white;
	text-align: center;
	width: 233px;
}

.fakeimg {
	color: white;
	background-color: #343a40;
	width: 730px;
	height: 200px;
	overflow: hidden;
	border: 1px solid violet;
    border-radius: 10px;
    padding-left: 18px;
    padding-top: 15px;
    position: relative;
    bottom: 20px;
}

.but2 {
	position: relative;
	margin-right: 1.333rem;
	padding: 1.5rem 5rem;
	/* background-color: #aaa; */
	font-size: 1.5rem;
	font-weight: 700;
	line-height: 1.89;
	color: rgb(0, 0, 0);
	border-radius: 30px;
	backdrop-filter: blur(30px);
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	white-space: nowrap;
	border: 3px groove antiquewhite;
	background-color: dodgerblue;
	transition: opacity 0.3s ease 0s, transform 0.3s
		cubic-bezier(0.175, 0.885, 0.32, 1.275) 0s;
}

.sp {
	color: black;
	text-decoration: none;
}

.sp2 {
	font-size: 1.5rem;
	color: white;
	margin-bottom: 50px;
}

.but1 {
	display: flex;
	border: none;
}

.but3 {
	background-color: #343a40;
	border: none;
	position: relative;
	width: 95%;
    height: 95%;
}

.but4 {
	background-color: #343a40;
	border: none;
	position: relative;
	width: 95%;
    height: 95%;
}
.info1 {
	position: relative;
	top: 50px;
}

.bg-primary2 {
    --bs-bg-opacity: 1;
    background: #1b1d29;
}
.but2:hover {
	transform: scale(1.1);
	background-color: bisque;
}
.but3:hover {
	transform: scale(1.3);
}
.but4:hover {
	transform: scale(1.3);
}
#foo {
	position: relative;
	top: 140px;
}

.bi-heart{
    font-size: 3.5rem;
    line-height: 30px;
    color:crimson;
}

.bi-heart-fill{
    font-size: 3.5rem;
    line-height: 30px;
    color:crimson;
}
.hs1 {
	font-weight: 600;
	color: yellow;
}
.hs2 {
	background-color: dodgerblue;
	background-size: 70%;
	
}
.vdnm{
	font-size: 1.5rem;
    position: relative;
    bottom: 30px;
}
</style>
<link rel="stylesheet" href="../view/css/main.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

	<!-- Header -->
		<%@include file="/header.jsp" %>
		
	<div class="box2">
		<div class="p-5 bg-primary2 text-white text-center">
			<h1 class="info1">D++ 영상 정보</h1>
			<p></p>
		</div>

		<div class="container mt-5 ">
			<div class="row">
				<div class="col-sm-4">
					<h2><%=vo.getVdodtlNm()%></h2>
					<%
						if (atchFileList != null) {
						for (AtchFileVO fileVO : atchFileList) {
					%>
					<div>
							<img class="ima1" src="/OTTProject/hsImages/<%= fileVO.getStreFileNm() %>" id="content-img">
					</div>
					<%
						}
					}
					%>
					<hr class="d-sm-none">
				</div>
				<div class="col-sm-8">
					<h2 class="hs1">상세정보</h2>
					<div class="sp2">영상의 제목  => <%=vo.getVdodtlNm()%> </div>
					<div class="vdnm">영상의  줄거리 </div>
					<div class="fakeimg"><%=vo.getVdodtlDtl()%></div>
					<div class="but1">
						<a href="/OTTProject/view/main/view<%=vo.getVdodtlNum() %>.jsp"><button type="button" class="but2">
								<span class="sp">시청하기</span>
							</button></a>
						<div style="margin-right: 100px;">
							<button type="button" name="heart" class="but3" >
						  		<i class="bi bi-heart"></i>
							</button>
						</div>
						<div>
							<button type="button" class="but4" name="like">
								<img class="ima2"
									src="https://img.icons8.com/external-icongeek26-outline-gradient-icongeek26/64/000000/external-like-donation-and-charity-icongeek26-outline-gradient-icongeek26.png" />
							</button>
						</div>
					</div>
					
				</div>
			</div>
		</div>

			<!-- Footer -->
		<%@include file="../../footer.jsp"%>
	</div>
	
	<script src="../view/js/jquery.min.js"></script>
	<script src="../view/js/jquery.scrollex.min.js"></script>
	<script src="../view/js/jquery.scrolly.min.js"></script>
	<script src="../view/js/browser.min.js"></script>
	<script src="../view/js/breakpoints.min.js"></script>
	<script src="../view/js/util.js"></script>
	<script src="../view/js/main.js"></script>
	
	<script>
	// 찜하기 기능
	    let isExist;
	    const hearti = $("i");

	    hearti.on('click',function(){
	    	console.log("this:",this);
	        if(!isExist){
				$.ajax({
					type : 'POST',
					url : "/OTTProject/wislist/add.do" ,
					data : "memNum=<%=mvo.getMemNum()%>&vdodtlNum=<%=vo.getVdodtlNum()%>",
					success : function(result) {
						console.log(result);
						hearti.removeClass('bi-heart');
						hearti.addClass('bi-heart-fill');
			            isExist=true;
			            Swal.fire({
			                icon: 'success',
			                title: '성공',
			                text:'찜목록에 추가되었습니다',
			                showConfirmButton: false,
			                timer: 5500
			              }).then((value) => {
			                if (value) {}
			              });
					},
					error : function(error) {
						alert("Error!");
					}
				});
	        }else{
				$.ajax({
					type : 'POST',
					url : "/OTTProject/wislist/del.do" ,
					data : "memNum=<%=mvo.getMemNum()%>&vdodtlNum=<%=vo.getVdodtlNum()%>",
					success : function(result) {
						console.log(result);
						hearti.removeClass('bi-heart-fill');
						hearti.addClass('bi-heart');
			            isExist=false;
			            Swal.fire({
			                icon: 'info',
			                title: '성공',
			                text: '찜목록에서 삭제되었습니다',
			                showConfirmButton: false,
			                timer: 5500
			              }).then((value) => {
			                if (value) {}
			              });
					},
					error : function(error) {
						alert("Error!");
					}
				});	            
	        }
	       
		});
	    	    
	    //무조건 페이지로딩후 체크
	    $(function(){
			$.ajax({
				type : 'POST',
				url : "/OTTProject/wislist/check.do" ,
				data : "memNum=<%=mvo.getMemNum()%>&vdodtlNum=<%=vo.getVdodtlNum()%>",
				success : function(result) {
					console.log(result);
					if(result=="성공"){
						isExist=true;
						hearti.removeClass('bi-heart');
						hearti.addClass('bi-heart-fill');												
					}else {
					    isExist=false;
						hearti.removeClass('bi-heart-fill');
						hearti.addClass('bi-heart');	
					}
				},
				error : function(error) {
				}
			});	            	    	
	    })
	    
	    
	    $("p.title").on('click', function () {
			$(this).next(".con").slideToggle(100);
		});
	    
// 	   시청기록 추가
	    //let isExisted;
	    const watch = $(".but2");

	    watch.on('click',function(){
	        if(!isExisted){
				$.ajax({
					type : 'POST',
					url : "/OTTProject/wachis/insert.do" ,
					data : "memNum=<%=mvo.getMemNum()%>&vdodtlNum=<%=vo.getVdodtlNum()%>",
					success : function(result) {
						console.log(result);
						if(result=="성공"){
// 							alert("투가 성공!");
			            	isExisted=true;
						}
					},
					error : function(error) {
						alert("Error!");
					}
				});
 	        }
		});

	    	    
// 	    //무조건 페이지로딩후 체크
// 	    $(function(){
// 			$.ajax({
// 				type : 'POST',
// 				url : "/OTTProject/wachis/check.do" ,
//<%--   				data : "memNum=<%=mvo.getMemNum()%>&vdodtlNum=<%=vo.getVdodtlNum()%>", --%>
// 				success : function(result) {
// 					console.log(result);
// 					if(result=="success"){
// 						alert("리스토에 돈재");
// 						isExisted=true;
// 					}else {
// 					    alert("리스토에 안돈재");
// 					    isExisted=false;
// 					}
// 				},
// 				error : function(error) {
// 				}
// 			});	            	    	
// 	    })
// // 	   좋아요 추가 

		let isExisted;
	    const like = $(".but4");

	    like.on('click',function(){
	    	console.log("this:",this);
	        if(!isExisted){
				$.ajax({
					type : 'POST',
					url : "/OTTProject/lkhis/add.do" ,
					data : "memNum=<%=mvo.getMemNum()%>&vdodtlNum=<%=vo.getVdodtlNum()%>",
					success : function(result) {
						like.addClass('hs2');
						console.log(result);
			            isExisted=true;
					},
					error : function(error) {
						alert("Error!");
					}
				});
 	        } else if(isExisted) {
				like.removeClass('hs2');
				isExisted=false;
			} else {}
		});
	    	    
	    //무조건 페이지로딩후 체크
	    $(function(){
			$.ajax({
				type : 'POST',
				url : "/OTTProject/lkhis/check.do" ,
				data : "memNum=<%=mvo.getMemNum()%>&vdodtlNum=<%=vo.getVdodtlNum()%>",
				success : function(result) {
					console.log(result);
					if(result=="success"){
// 						alert("리스토에 돈재");
						isExisted=true;
					}else {
// 					    alert("리스토에 안돈재");
					    isExisted=false;
					}
				},
				error : function(error) {
				}
			});	            	    	
	    })
	</script>
</body>
</html>
