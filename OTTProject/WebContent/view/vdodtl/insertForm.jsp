<%@page import="comm.vo.AtchFileVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../view/css/main.css">
<title>Disney++</title>
<link rel="shortcut icon" href="/OTTProject/view/img/logo.png"type="image/x-icon">
<style>
	.list-group1 {
		display: flex;
		justify-content: space-around;
		padding-left: 0;
		margin-bottom: 0;
		border-radius: 0.25rem;
	}
	div{
		/* border: 2px solid red; */
	}
	.list-group-item{
		/* border: 2px solid green; */
		width: 190px;
		background-color: transparent;
		border: none;
	}
	.form-check-input{
		display: none;
	}
</style>
</head>
<body>
   <form action="insert.do" method="post" enctype="multipart/form-data">
		<div id="page-wrapper">

			<!-- Header -->
            <%@include file="/header.jsp" %>
            <!-- Main -->
			<article id="main">
				<div class="board_wrap" style="width: 1000px;">
                    <div class="board_title" style="text-align: center;">
                        <h2>영상물 등록</h2>
                    </div>
					<table style="text-align: center;">
						<tr> 
							<td>영상물 번호</td>
							<td><input type="text" name= "vdodtlNum" value="" disabled></td>
						</tr>
						<tr> 
							<td>영상물 장르 선택</td>
							<td style="text-align: left;">
								<ul class="list-group1 mt-5">
									<li class="list-group-item">
										<input class="form-check-input me-1" type="checkbox" value="1" id="firstCheckboxStretched" name="vdotyNum"> 
										<label class="form-check-label stretched-link" for="firstCheckboxStretched">
											로맨스
										</label>
									</li>
									<li class="list-group-item">
										<input class="form-check-input me-1" type="checkbox" value="2" id="secondCheckboxStretched" name="vdotyNum"> 
										<label class="form-check-label stretched-link" for="secondCheckboxStretched"> 
											코미디
										</label>
									</li>
									<li class="list-group-item" style="border-top-width: 1;">
										<input class="form-check-input me-1" type="checkbox" value="3" id="thirdCheckboxStretched" name="vdotyNum"> 
										<label class="form-check-label stretched-link" for="thirdCheckboxStretched">
											스릴러
										</label>
									</li>
								</ul>
							
								<ul class="list-group1">
									<li class="list-group-item">
										<input class="form-check-input me-1"type="checkbox" value="4" id="fourthCheckboxStretched" name="vdotyNum"> 
										<label class="form-check-label stretched-link" for="fourthCheckboxStretched">
											미스터리
										</label>
									</li>
									<li class="list-group-item">
										<input class="form-check-input me-1"type="checkbox" value="5" id="fifthCheckboxStretched" name="vdotyNum"> 
										<label class="form-check-label stretched-link" for="fifthCheckboxStretched">
											액  션
										</label>
									</li>
									<li class="list-group-item">
										<input class="form-check-input me-1" type="checkbox" value="6" id="sixthCheckboxStretched" name="vdotyNum"> 
										<label class="form-check-label stretched-link" for="sixthCheckboxStretched">
											판타지
										</label>
									</li>
								</ul>

								<ul class="list-group1">
									<li class="list-group-item">
										<input class="form-check-input me-1" type="checkbox" value="7" id="seventhCheckboxStretched" name="vdotyNum"> 
										<label class="form-check-label stretched-link" for="seventhCheckboxStretched">
											공 포
										</label>
									</li>
									<li class="list-group-item">
										<input class="form-check-input me-1" type="checkbox" value="8" id="eighthCheckboxStretched" name="vdotyNum"> 
										<label class="form-check-label stretched-link" for="eighthCheckboxStretched">
											키 즈
										</label>
									</li>
									<li class="list-group-item">
										<input class="form-check-input me-1" type="checkbox" value="9" id="ninethCheckboxStretched" name="vdotyNum"> 
										<label class="form-check-label stretched-link" for="ninethCheckboxStretched">
											애 니
										</label>
									</li>
								</ul>
							
							</td>
							
						</tr>
						
						<tr> 
							<td>영상물 관람 등급 번호</td>
							<td><input type="text" name= "vdolevNum" value="" placeholder="(1=> 키즈   2=> 성인) 숫자로 적어주세요"></td>
						</tr>
						<tr> 
							<td>영상물 이름</td>
							<td><input type="text" name= "vdodtlNm" value=""></td>
						</tr>
						<tr> 
							<td>영상 요약 정보</td>
							<td><textarea rows="3" cols="20" name= "vdodtlSumy"></textarea></td>
						</tr>
						<tr> 
							<td>영상 상세 정보</td>
							<td><textarea rows="3" cols="20" name= "vdodtlDtl"></textarea></td>
						</tr>
			
						<tr> 
							<td>첨부파일 이미지 :</td>
							<td style="text-align: left;"><input type="file" name="atchFile"></td>
						</tr>
							
					</table>
					<div style="text-align: center;">
						<button type="submit" class="btn btn-outline-light">영상물 등록</button>
					</div>
				</div>
			</article>
			<!-- Footer -->
			<%@include file="../../footer.jsp" %>
		</div>
   </form>
   
   <script type="text/javascript">
		var frm = document.frm;
		var vdm_chk = document.querySelectorAll('.form-check-input:checked');
		console.log(vdm_chk);
   </script>
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