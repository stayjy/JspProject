<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/logout.jsp</title>
</head>
<body>
<%
//세션초기화
session.invalidate();
//main.jsp 이동
response.sendRedirect("../main/main.jsp");

%>
</body>
</html>