<%@page import="kr.or.ddit.ott.oob.vo.OobVO"%>
<%@page import="kr.or.ddit.ott.mem.vo.MemberVO"%>
<%@page import="kr.or.ddit.ott.ntc.vo.NtcVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	List<NtcVO> ntcList = (List<NtcVO>) request.getAttribute("ntcList");
	String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
	session.removeAttribute("msg");
	OobVO ov = (OobVO) request.getAttribute("ov");
	
	int cnt = ntcList.size();
	
	// 한 페이지에  출력될 글 수
	int pageSize = 10;
	
	// 현 페이지 설정 정보
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);   
	int startRow = (currentPage-1)*pageSize + 1;
    int endRow = startRow + (pageSize -1);

%>
<%if(cnt != 0){ 
      ////////////////////////////////////////////////////////////////
      // 페이징 처리
      // 전체 페이지수 계산
      int pageCount = cnt / pageSize + (cnt%pageSize==0?0:1);
      
      // 한 페이지에 보여줄 페이지 블럭
      int pageBlock = 10;
      
      // 한 페이지에 보여줄 페이지 블럭 시작번호 계산
      int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
      
      // 한 페이지에 보여줄 페이지 블럭 끝 번호 계산
      int endPage = startPage + pageBlock-1;
      if(endPage > pageCount){
         endPage = pageCount;
      }   
      if(endRow > (cnt-1)){
         endRow = cnt-1;
      }
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Disney++</title>
<link rel="shortcut icon" href="/OTTProject/view/img/logo.png"type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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

					<form action="search.do" class="mt-5 container" method="GET">
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
							<%if(Integer.parseInt(mvo.getMemNum()) == 0) { %>
							<div class="delete">삭제</div>
							<% } %>
						</div>
						

						<%
							for (int i = startRow; i <= endRow; i++) {
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
							<div class="date">
								<%=ntcList.get(i).getNtcDate()%>
							</div>
							<%if(Integer.parseInt(mvo.getMemNum()) == 0) { %>
							<div class="delete form-check">
								<input class="form-check-input" type="checkbox" name="check" style="float:none; margin-left:0em" value="<%=ntcList.get(i).getNtcNum()%>">
							</div>
							<% } %>
						</div>
						<%
						};
						%>

					</div>
					<div class="board_page" style="color: white; padding-top: 20px;">
						<% if(startPage>pageBlock){ %>
						<a class="bt first" href="list.do?pageNum=<%=startPage-pageBlock%>">&nbsp;Prev</a>
						<%} %>
						
						<% for(int i=startPage;i<=endPage;i++){ %>
							<% if(i == currentPage){ %>
								<a class="num on" href="list.do?pageNum=<%=i%>"><%=i %>&nbsp;</a>
							<% } else { %>
								<a class="num" href="list.do?pageNum=<%=i%>"><%=i %>&nbsp;</a>
							<% } %>
						<%} %>
					
						<% if(endPage<pageCount){ %>
						<a class="bt last" href="list.do?pageNum=<%=startPage+pageBlock%>">&nbsp;Next</a>
						<%} %>

					</div>
					
					<%if(Integer.parseInt(mvo.getMemNum()) == 0) { %>
					<div style="margin: 30px;">
						<button type="button" class="btn btn-light" onclick="location.href='../ntc/regist.do'">새글 작성</button>
						<button type="button" class="btn btn-outline-light" id="del_btn" onclick="f_del()">선택 삭제</button>
					</div>
					<%} %>
				</div>
		</article>

		<!-- Footer -->
		<%@include file="../../footer.jsp" %>

	</div>

	<%
		if (msg.equals("성공")) {
	%>
	<script>
		alert("정상적으로 작성완료되었습니다.");
	</script>
	<% }} %>

	<script>
		var btn = document.querySelector("#check");
		function f_del(){
		   let checkedVals = []; // 빈 배열
		   var queryString="";
		   $("input[name=check]:checked").val((p_index,p_value)=> {
		      queryString += "ntcNum="+p_value+"&";
		   });
// 		   alert(queryString);
	
		   $.ajax({
		      type:"get",
		      url:"<%=request.getContextPath()%>/ntc/delete.do",
		      data: queryString,
		      dataType:"text",
		      success:function(rslt){
		         if(rslt == "성공"){
		            location.href= "<%= request.getContextPath()%>/ntc/list.do";
		         }
		      },
		      error:function(request,status,error){        
		         console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       
		       }
		   })
		}

	
	
		$("p.title").on('click', function () {
			$(this).next(".con").slideToggle(100);
		});

	</script>
	
	</body>
	</html>
