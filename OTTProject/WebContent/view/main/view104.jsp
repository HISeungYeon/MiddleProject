<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Disney++</title>
    <link rel="shortcut icon" href="/OTTProject/view/img/logo.png"type="image/x-icon">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <style>
    	#my_mv {
    		position: relative;
    		left: 8%;
    		
    	}
    	body {
    		background: #343a40;
    	}
    	.vdo {
    		display: flex;
    		justify-content: space-around;
    	}
    	img {
    		width: 100px;
    		
    	}

     	.material-symbols-outlined {
		     font-variation-settings:
		     'FILL' 0,
		     'wght' 400,
		     'GRAD' 0,
		     'opsz' 48
		}
		
		button{
		color: white; 
		background-color: transparent; 
		border:none;
		
		}
    </style>
</head>
<body>

<video id="my_mv" src="../img/싱크홀.mp4" width="1600" autoplay muted controls  controlslist="nodownload">
    <track src="./sample-en.vtt" kind="subtitles" srclang="en" label="English"></track>
    <track src="./02.sample-ko.vtt" kind="subtitles" srclang="ko" label="한국어" default></track>
</video>
    <div class="vdo">
		<button onclick="f_pause()" onclick = "location.href='#'">
			<span class="material-symbols-outlined" style="font-size: 80px;">
				pause_circle
			</span>
		</button>
		
        <button onclick="f_play()" onclick = "location.href='#'">
        	<span class="material-symbols-outlined" style="font-size: 80px;">
				play_circle
			</span>
        </button>
        
        <button onclick="f_quick()" onclick = "location.href='#'">
			<span class="material-symbols-outlined" style="font-size: 80px;">
				fast_forward
			</span>
		</button>
		
        <button onclick="f_next()" onclick = "location.href='#'">
			<span class="material-symbols-outlined" style="font-size: 80px;">
				skip_next
			</span>
		</button>
		
		<!-- <button type="button" class="btn btn-light" onclick="location='/OTTProject/main/main.do'">메인화면</button> -->
    </div>
<!-- <input type="button" value="눌러야해" onclick="f_click()"> -->
<script>
     var date = new Date();

     // 영상의 처음 시작시점 설정
     var vd = document.querySelector('#my_mv');
     vd.currentTime = 0;
     console.log(vd.startDate);
     //------------------------------------------------------------



   var v_video = document.querySelector("#my_mv");
   var v_index =1;
   function f_next(){
        v_index++;
        v_video.src = "../../video/낄낄상회2"+ v_index + ".mp4"
   }
   function f_pause(){
        v_video.pause();
   }

   function f_play(){
        v_video.play();
        v_video.controls = true;
        v_video.volume = 10;
   }

   function f_quick(){
        //누를때 마다 2배
        alert(v_video.playbackRate); //기본값 확인
        v_video.playbackRate = v_video.playbackRate *2; 
   }


   v_video.onended = function(){
        //alert("끝났어용?");
        v_video.src = "./videos/movie3.mp4";

   }
   function f_click(){
        v_video.src = "./videos/movie2.mp4";
        v_video.muted = true;
        v_video.autoplay = true;
        v_video.controls = true;
        v_video.style.transform ="rotate(15deg)";
   }


</script>
</body>
</html>