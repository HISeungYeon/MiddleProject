<%@page import="kr.or.ddit.ott.mem.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<% MemberVO vo = (MemberVO)session.getAttribute("vo");%>
	<% session.removeAttribute("vo"); %>
	<% session.removeAttribute("memNum"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Disney++</title>
<link rel="shortcut icon" href="/OTTProject/view/img/logo.png"type="image/x-icon">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script type="text/javascript">
	
					Swal.fire({
				        icon: 'info',
				        title: '로그아웃 되었습니다. 다음에 또 봐요',
				        showConfirmButton: false,
				        timer: 5500
				    }).then((value) => {
				        if(value){
				            location.replace('/OTTProject/index.jsp');
				        }
				    });
// 	location.href="/OTTProject/index.jsp"
	
	</script>
	
</body>
</html>