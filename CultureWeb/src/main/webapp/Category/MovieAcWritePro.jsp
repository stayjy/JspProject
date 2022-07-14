<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
//request 파라미터 가져오기 pass name subject content
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
int readcount=0;

//upload 폴더 만들기
String uploadPath=request.getRealPath("/upload");
out.println(uploadPath);
int maxSize=10*1024*1024;
MultipartRequest multi=new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
BoardDTO boardDTO=new BoardDTO();
boardDTO.setName(name);
boardDTO.setPass(pass);
boardDTO.setSubject(subject);
boardDTO.setContent(content);
boardDTO.setReadcount(readcount);

//BoardDAO 객체생성
BoardDAO boardDAO=new BoardDAO();
//리턴값없음 insertBoard(BoardDTO boardDTO) 메서드 정의 
//insertBoard(boardDTO) 메서드호출
boardDAO.insertBoard(boardDTO);
// notice.jsp 이동
response.sendRedirect("MovieAc.jsp");
%>
</body>
</html>