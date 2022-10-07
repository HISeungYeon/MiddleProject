<%@page import="kr.or.ddit.ott.ntc.vo.NtcVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	List<NtcVO> ntcList = (List<NtcVO>) request.getAttribute("ntcList");
	

	String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
	session.removeAttribute("msg");
	NtcVO vo = new NtcVO();
	vo.setNtcTit(request.getParameter("ntcTit"));
	MemberVO mv = (MemberVO) session.getAttribute("vo");
	
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Disney++</title>
<link rel="shortcut icon" href="/OTTProject/view/img/logo.png"type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="../view/css/main.css">
<style>
	div{
		/* border: 2px solid red */
	}
	.top {
		display: flex;
		justify-content: space-around;
	}
</style>
</head>

<body>

	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- Header -->
		<%@include file="/header.jsp" %>

		<!-- Main -->
		<article id="main">
			<header>
				<div style="text-align: center; position: relative; ;top: 70px;">
					<h2>고객센터</h2>
					<p>무엇이든 물어보세요!</p>
				</div>
			</header>
			<section class="wrapper style5">
				<div class="inner" style="text-align: center;">
					<div class="btn-group" role="group" aria-label="Basic outlined example" style="padding: 60px;">
						<button type="button" class="btn btn-outline-primary"
							style="color: white; width: 700px; border-color: white; background-color: #0d6efd" onclick="location.href='../ntc/list.do'">
							공지사항</button>
						<button type="button" class="btn btn-outline-primary"
							style="color: white; width: 700px;border-color: white;" onclick="location.href='../oob/list.do'">
							1:1 문의</button>
					</div>


					<form action="search.do" method="GET">
						<div class="mx-quto input-group mt-5" style="justify-content: flex-end;">
							<button type="button" class="btn btn-info" ><a href="list.do" >전체목록</a></button>
							<mx-auto>
								<input name="ntcTit" type="text" class="form-control" placeholder="검색어 입력" aria-label="search" aria-describedby="button-addon2" value="">
							</mx-auto>
							
							<button class="btn btn-success" type="submit" id="button-addon2">검색</button>
						</div>
					</form>
					
					<div class="board_list">
						<div class="top">
							<div class="num">번호</div>
							<div class="title">제목</div>
							<div class="date">작성일</div>
							<%if(Integer.parseInt(mv.getMemNum()) == 0) { %>
							<div class="delete">삭제</div>
							<% } %>
						</div>

						<%
							int ntcSize = ntcList.size();
							if(ntcSize > 0 ){
							for (int i = 0; i < ntcSize; i++) {
						%>

						<div class="top">
							<div class="num">
								<%=ntcList.get(i).getNtcNum()%>
							</div>
							<div class="title">
								<a class="ntc"
									href="detail.do?ntcNum=<%=ntcList.get(i).getNtcNum()%>"> <%=ntcList.get(i).getNtcTit()%>
								</a>
							</div>
							<div class="con"></div>
							<div class="date">
								<%=ntcList.get(i).getNtcDate()%>
							</div>
							<%if(Integer.parseInt(mv.getMemNum()) == 0) { %>
							<div class="delete form-check">
								<input class="form-check-input" type="checkbox" name="check" style="float:none; margin-left:0em" value="<%=ntcList.get(i).getNtcNum()%>">
							</div>
							<% } %>
						</div>
						<%
									} 
								} else { }%>
					</div>

					<%if(Integer.parseInt(mv.getMemNum()) == 0) { %>
					<div style="margin: 30px;">
						<button type="button" class="btn btn-light" onclick="location.href='../ntc/regist.do'">새글 작성</button>
						<button type="button" class="btn btn-outline-light" id="del_btn" onclick="f_del()">선택 삭제</button>
					</div>
					<%} %>
				</div>
			</section>

		</article>

		<!-- Footer -->
		<%@include file="../../footer.jsp" %>

	</div>
	<%
		if (msg.equals("성공")) {
	%>
	<script>
		alert("정상적으로 처리되었습니다.");
		Swal.fire({
            icon: 'success',
            title: '정상적으로 처리되었습니다.',
            showConfirmButton: false,
            timer: 5500
          }).then((value) => {
            if (value) {
            }
          });
	</script>
			   	<% } %>

	<script>
		var btn = document.querySelector("#check");
		function f_del(){
		   let checkedVals = []; // 빈 배열
		   var queryString="";
		   $("input[name=check]:checked").val((p_index,p_value)=> {
		      queryString += "ntcNum="+p_value+"&";
		   });
		   alert(queryString);
	
		   $.ajax({
		      type:"get",
		      url:"<%=request.getContextPath()%>/ntc/delete.do",
		      data: queryString,
		      dataType:"text",
		      success:function(rslt){
		         if(rslt == "OK"){
		            location.href= "<%=request.getContextPath()%>/ntc/list.do";
		         }
		      },
		      error:function(request,status,error){        
		         console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       
		       }
		   })
		}
	</script>
	<!-- Scripts -->
	<script src="../view/js/jquery.min.js"></script>
	<script src="../view/js/jquery.scrollex.min.js"></script>
	<script src="../view/js/jquery.scrolly.min.js"></script>
	<script src="../view/js/browser.min.js"></script>
	<script src="../view/js/breakpoints.min.js"></script>
	<script src="../view/js/util.js"></script>
	<script src="../view/js/main.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
	<script>
		$("p.title").on('click', function () {
			$(this).next(".con").slideToggle(100);
		});
	</script>
</body>
</html>
