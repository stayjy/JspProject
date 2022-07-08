<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/fwritePro.jsp</title>
</head>
<body>
<%
//파일 업로드 
//프로그램 설치 cos.jar
//http://www.servlets.com
//cos file upload library
//cos zip 파일 다운로드 압축해제
//lib -cos.jar
//web-ink -lib-cos.jar 넣기

//파일업로드 MultipartRequest.class 객체생성
/* MultipartRequest multi=new MultipartRequest(request,upload폴더물리적경로,업로드파일크기,한글처리,파일이름동일할경우 이름변경); */
//upload 폴더 만들기
String uploadPath=request.getRealPath("/upload");
out.println(uploadPath);
//파일 업로드 크기
int maxSize=10*1024*1024;
MultipartRequest multi=new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
%>
</body>
</html>