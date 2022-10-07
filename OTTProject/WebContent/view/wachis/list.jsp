<%@page import="kr.or.ddit.ott.wachis.vo.WacHisVO"%>
<%@page import="kr.or.ddit.ott.vdodtl.vo.VdodtlVO"%>
<%@page import="kr.or.ddit.ott.wislist.vo.WisListVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<WacHisVO> wachisList = (List<WacHisVO>) request.getAttribute("wachisList");
String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
session.removeAttribute("msg");
%>
<!DOCTYPE HTML>
<html>
<head>
<title>Disney++</title>
<link rel="shortcut icon" href="/OTTProject/view/img/logo.png"type="image/x-icon">
<meta charset="utf-8" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="../view/css/main.css" />
</head>

<body class="is-preload">

	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- Header -->
		<%@include file ="/header.jsp" %>


		<!-- Main -->
		<article id="main">
			<header>
				<div style="text-align: center; position: relative; top: 70px;">
					<h2>시청기록</h2>
				</div>
			</header>
			<section class="wrapper style5">
				<div class="inner" style="text-align: center;">
					<div class="wisimg">
							<%
								int wachisSize = wachisList.size();
							if (wachisSize > 0) {
								for (int i = 0; i < wachisSize; i++) {
							%>
							<div>
							
								<div  class="wischk">
								<input class="form-check-input chkbox" type="checkbox" name="check"
										style="float: none; margin-left: 0em"
										value="<%=wachisList.get(i).getWachisNum()%>">
									<a href="/OTTProject/main/detail.do?vdodtlNum=<%=wachisList.get(i).getVdodtlNum()%>"><img class="ima1" src="/OTTProject/hsImages/<%= wachisList.get(i).getStreFileNm() %>"></a>
								</div>
								
								<div class="title">
									<a class = "wistitle" href="/OTTProject/main/detail.do?vdodtlNum=<%=wachisList.get(i).getVdodtlNum()%>"><%= wachisList.get(i).getVdodtlNm()%></a><br>
									시청일: <%=wachisList.get(i).getWachisDtus()%>
								</div> 
								<div class="delete form-check">
								</div>
							</div>
							<%
								}
							} else {
							}
							%>
						</div>
						<div style="margin: 30px;">
							<button type="button" class="btn btn-light"
								onclick="location.href='../main/main.do'">메인페이지로 이동</button>
							<button type="button" class="btn btn-outline-light" id="del_btn"
								onclick="f_edit(this)">편집</button>
							<button type="button" id="delbtn" style="display:none";
								onclick="f_del()">선택삭제</button>
						</div>
					</div>
			</section>
		</article>

		<!-- Footer -->
		<%@include file="../../footer.jsp"%>

	</div>

	<!-- Scripts -->
	<script src="../view/js/jquery.min.js"></script>
	<script src="../view/js/jquery.scrollex.min.js"></script>
	<script src="../view/js/jquery.scrolly.min.js"></script>
	<script src="../view/js/browser.min.js"></script>
	<script src="../view/js/breakpoints.min.js"></script>
	<script src="../view/js/util.js"></script>
	<script src="../view/js/main.js"></script>

	<script>
		var btn = document.querySelector("#check");
		
		const f_edit = (p_this)=>{
			if(p_this.innerHTML=="편집"){
				$(".chkbox").css("display","inline-block");
				$("#delbtn").css("display","inline-block");
				p_this.innerHTML="취소";
				return;
			}

			if(p_this.innerHTML=="취소"){
				$(".chkbox").css("display","none");
				$("#delbtn").css("display","none");
				p_this.innerHTML="편집";
				return;
			}
		
		}
		
		
		function f_del(){
		   let checkedVals = []; // 빈 배열
		   var queryString="";
		   $("input[name=check]:checked").val((p_index,p_value)=> {
		      queryString += "wachisNum="+p_value+"&";
		   });
// 		   alert(queryString);
	
		   $.ajax({
		      type:"get",
		      url:"<%=request.getContextPath()%>/wachis/delete.do",
		      data: queryString,
		      dataType:"text",
		      success:function(rslt){
		         if(rslt == "성공"){
		            location.href= "<%=request.getContextPath()%>/wachis/list.do";
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