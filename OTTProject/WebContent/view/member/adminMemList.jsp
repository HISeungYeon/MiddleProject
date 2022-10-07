<%@page import="kr.or.ddit.ott.mem.vo.MemberVO"%>
<%@page import="comm.vo.AtchFileVO"%>
<%@page import="kr.or.ddit.ott.vdodtl.vo.VdodtlVO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<MemberVO> memList = (List<MemberVO>) request.getAttribute("memList");
System.out.println("멤버리스트:::" + memList);
String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
session.removeAttribute("msg"); // 꺼내온 메시지 속성값 삭제하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Disney++</title>
<link rel="shortcut icon" href="/OTTProject/view/img/logo.png"type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../view/css/main.css" />
<style>
	div {
		/* border: 3px solid red; */
	}
</style>
</head>
<body class="is-preload">

	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- Header -->
		<%@include file="/header.jsp" %>

		<!-- Main -->
		<article id="main">
			<header>
				<div style="text-align: center; position: relative; ;top: 70px;">
					<h2>회원 목록</h2>
				</div>
			</header>
			<section class="wrapper style5">
				<div class="inner" style="text-align: center;">
					<table border="1" style="color: white;">
						<tr>
							<th>회원 번호</th>
							<th>이름</th>
							<th>이메일</th>
							<th>비밀번호</th>
							<th>생년월일</th>
							<th>전화번호</th>
							<th>국적</th>
							<th>삭제</th>
						</tr>
		
						<%
							int memSize = memList.size();
						if (memSize > 0 ) {
							for (int i = 0; i < memSize; i++) {
						%>
		
						<tr>
							<td><%=memList.get(i).getMemNum()%></td>
							<td><%=memList.get(i).getMemNm()%></td>
							<td><%=memList.get(i).getMemEm()%></td>
							<td><%=memList.get(i).getMemPw()%></td>
							<td><%=memList.get(i).getMemBir()%></td>
							<td><%=memList.get(i).getMemTel()%></td>
							<td><%=memList.get(i).getMemNal()%></td>
							<td><input type="checkbox" name=chkdel value="<%=memList.get(i).getMemEm()%>"></td>
						</tr>
		
						<%
							}
						} else {
						%>
						<tr>
							<td colspan="5">회원의 정보가 없습니다.</td>
						</tr>
						<%
							}
						%>
		
						</tr>
					</table>
				</div>
				<div class = admindel>
						<button type="button" class="btn btn-outline-light" id="del_btn" onclick="f_del()">선택 삭제</button>
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
	</script>
	-->
	<%
		}
	%>
	<!-- Scripts -->
	<script src="../view/js/jquery.min.js"></script>
	<script src="../view/js/jquery.scrollex.min.js"></script>
	<script src="../view/js/jquery.scrolly.min.js"></script>
	<script src="../view/js/browser.min.js"></script>
	<script src="../view/js/breakpoints.min.js"></script>
	<script src="../view/js/util.js"></script>
	<script src="../view/js/main.js"></script>
	<script>
		$("p.title").on('click', function () {
			$(this).next(".con").slideToggle(100);
		});
		
		//var chkboxs = document.querySelector("input[name=chkdel]");
		function f_del(){
		   let checkedVals = []; // 빈 배열
		   var queryString="";
		   $("input[name=chkdel]:checked").val((p_index,p_value)=> {
		      queryString += "memEm="+p_value+"&";
		   });
// 		   alert(queryString);
	
		   $.ajax({
		      type:"get",
		      url:"<%=request.getContextPath()%>/member/adminMemDel.do",
		      data: queryString,
		      dataType:"text",
		      success:function(rslt){
		    	  console.log(rslt);
		         if(rslt == "성공"){
		            location.href= "<%= request.getContextPath()%>/member/adminMemList.do";
		         }
		      },
		      error:function(request,status,error){        
		         console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       
		       }
		   })
		}
	</script>
</body>
</html>