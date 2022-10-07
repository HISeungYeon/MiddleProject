<%@page import="kr.or.ddit.ott.vdodtl.vo.VdodtlVO"%>
<%@page import="java.util.List"%>
<%@page import="comm.vo.AtchFileVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%> 
 <% 
    VdodtlVO vo = (VdodtlVO) request.getAttribute("vo");
    List<AtchFileVO> atchFileList = (List<AtchFileVO>) request.getAttribute("atchFileList");
    System.out.println("+++++++" + vo);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Disney++</title>
<link rel="shortcut icon" href="/OTTProject/view/img/logo.png" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../view/css/main.css">
<style type="text/css">
.day {
   appearance: none;
    background-color: #4E4852;
    border-radius: 3px;
    border: none;
    color: inherit;
    display: block;
    outline: 0;
    padding: 0 1em;
    text-decoration: none;
    width: 100%;
    color: white;
    margin-bottom: 20px;
    position: relative;
    height: 300px;
}
</style>
</head>
<body>
   <form action="update.do" method="post" enctype="multipart/form-data">
      <input type="hidden" name="vdodtlNum" value="<%=vo.getVdodtlNum()%>">
      <div id="page-wrapper">
        <!-- Header -->
      <%@include file="/header.jsp"%>
        <!-- Main -->
        <div class="board_wrap">
            <div class="board_title">
                <h2>영상물 수정</h2>
            </div>
            <div class="board_write_wrap">
                <div class="board_write">
                    <div class="title">
                        <dl>
                            <dt class="mt-3" style="font-weight: 800;">영상물 장르 번호:</dt>
                            <dd><input type="text" name="vdotyNum" value="<%= vo.getVdotyNum() %>" ></dd>
                        </dl>
                    </div>
                    <div class="info">
                        <dl>
                            <dt>영상물 관람 등급 (1: 키즈  2: 성인)</dt>
                            <dd><input type="text" name="vdolevNum" value="<%=vo.getVdolevNum()%>" ></dd>
                        </dl>
                        <dl>
                            <dt>영상물 이름: </dt>
                            <dd><input type="text" name="vdodtlNm" value="<%=vo.getVdodtlNm()%>"></dd>
                        </dl>
                        <dl>
                            <dt>영상물 상세정보: </dt>
                            <dd><div class="day"><textarea rows="7" cols="7" name="vdodtlDtl"><%=vo.getVdodtlDtl()%></textarea></div></dd>
                        </dl>
                        <dl>
                            <dt>기존 첨부파일: </dt>
                           <dd>
                        <%
                           if(atchFileList != null){
                              for(AtchFileVO fileVO : atchFileList){
                                 %>
                                 <div><a href="<%=request.getContextPath() %>/filedown.do?fileId=<%=fileVO.getAtchFileId() %>&fileSn=<%=fileVO.getFileSn() %>"><%=fileVO.getOrignlFileNm() %></a></div>
                                 <%          
                              }
                           }
                        %>
                           </dd>
                        </dl>
                        <dl>
                            <dt>수정할 첨부파일: </dt>
                            <dd><input type="file" name="fileId"></dd>
                        </dl>
                        
                        
                    </div>
                </div>
                <div class="bt_wrap" style="padding: 20px; text-align: center;">
                    <button type="submit" class="btn btn-outline-light">영상물 정보 수정</button>
                    <button type="button" class="btn btn-outline-light" onclick="location.href='list.do'">목록으로</button>
                </div>
            </div>
        </div>
    </div>
   </form>
</body>
</html>