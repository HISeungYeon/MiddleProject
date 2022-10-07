<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!doctype html>
    <html lang="en">
      <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
       <title>Disney++</title>
		<link rel="shortcut icon" href="/OTTProject/view/img/logo.png"type="image/x-icon">
      </head>
      <style>
      .list-group1 {
		    display: flex;
		    justify-content: space-around;
		    padding-left: 0;
		    margin-bottom: 0;
		    border-radius: 0.25rem;
		}
		.list-group-item {
	    	width: 120px;
		}
		.list-group-item2 {
		    position: relative;
		    display: block;
		    padding: 0.75rem 1.25rem;
		    background-color: #fff;
		    border: 1px solid rgba(0,0,0,.125);
		    border-top-width: 1;
		    width: 120px;
		}
	  </style>
      <body>
        <h1>미디어 영상물 업로드</h1>

        <select class="form-select" aria-label="Default select example">
            <option selected>장르를 선택해주세요</option>
            <option value="1">로맨스</option>
            <option value="2">코미디</option>
            <option value="3">스릴러</option>
            <option value="4">미스터리</option>
            <option value="5">액션</option>
            <option value="6">판타지</option>
            <option value="7">공포</option>
            <option value="8">키즈</option>
            <option value="9">애니메이션</option>
          </select>
          
          
	<ul class="list-group1 mt-5">
		<li class="list-group-item"><input class="form-check-input me-1"
			type="checkbox" value="" id="firstCheckboxStretched"> <label
			class="form-check-label stretched-link" for="firstCheckboxStretched"> 로맨스
				</label></li>
		<li class="list-group-item2"><input class="form-check-input me-1"
			type="checkbox" value="" id="secondCheckboxStretched"> <label
			class="form-check-label stretched-link" for="secondCheckboxStretched"> 코미디
				</label></li>
		<li class="list-group-item2" style="border-top-width: 1;"><input class="form-check-input me-1"
			type="checkbox" value="" id="thirdCheckboxStretched"> <label
			class="form-check-label stretched-link" for="thirdCheckboxStretched">스릴러
				</label></li>
	</ul>
	
	<ul class="list-group1">
		<li class="list-group-item"><input class="form-check-input me-1"
			type="checkbox" value="" id="fourthCheckboxStretched"> <label
			class="form-check-label stretched-link" for="fourthCheckboxStretched">미스터리
				</label></li>
		<li class="list-group-item"><input class="form-check-input me-1"
			type="checkbox" value="" id="fifthCheckboxStretched"> <label
			class="form-check-label stretched-link" for="fifthCheckboxStretched">액  션
				</label></li>
		<li class="list-group-item"><input class="form-check-input me-1"
			type="checkbox" value="" id="sixthCheckboxStretched"> <label
			class="form-check-label stretched-link" for="sixthCheckboxStretched">판타지
				</label></li>
	</ul>
	<ul class="list-group1">
		<li class="list-group-item"><input class="form-check-input me-1"
			type="checkbox" value="" id="seventhCheckboxStretched"> <label
			class="form-check-label stretched-link" for="seventhCheckboxStretched">공포
				</label></li>
		<li class="list-group-item"><input class="form-check-input me-1"
			type="checkbox" value="" id="eighthCheckboxStretched"> <label
			class="form-check-label stretched-link" for="eighthCheckboxStretched">키즈
				</label></li>
		<li class="list-group-item"><input class="form-check-input me-1"
			type="checkbox" value="" id="ninethCheckboxStretched"> <label
			class="form-check-label stretched-link" for="ninethCheckboxStretched">애니
				</label></li>
	</ul>

	


	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
      </body>
    </html>