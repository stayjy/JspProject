<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/joinPro.jsp</title>
</head>
<body>
<%
//post request 한글처리
request.setCharacterEncoding("utf-8");
// request id pass name email address phone mobile 파라미터 값 가져오기 => 변수 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String email=request.getParameter("email");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String mobile=request.getParameter("mobile");

//자바파일 : 데이터를 담아서 전달
// 패키지 member 파일이름 MemberDTO
MemberDTO memberDTO=new MemberDTO();
// 멤버변수 정의, 멤버변수 접근 메서드 정의
// id pass name email address phone mobile
// 객체생성 => 기억장소 할당
memberDTO.setId(id);
memberDTO.setPass(pass);
memberDTO.setName(name);
memberDTO.setEmail(email);
memberDTO.setAddress(address);
memberDTO.setPhone(phone);
memberDTO.setMobile(mobile);

MemberDAO memberDAO=new MemberDAO();
// 멤버변수에 값을 저장하는 메서드 호출

//자바파일 메서드정의(디비) 메서드 호출
// 패키지 member 파일이름 MemberDAO
// insertMember() 메서드 정의 
//객체생성 => 클래스 기억장소 할당
// 메서드 호출
// memberDAO.insertMember(id,pass,name);
memberDAO.insertMember(memberDTO);
%>
<script type="text/javascript">
	alert("회원가입 성공");
	location.href="login.jsp";
</script>
</body>
</html>