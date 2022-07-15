<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
//jQuery1/dupCheck2.jsp

//id 파라미터값 가져오기
String id = request.getParameter("id");

MemberDAO memberDAO=new MemberDAO();

MemberDTO memberDTO=memberDAO.getMember(id);

if(memberDTO==null) {	//db에 중복되는 아이디 없음
	%>아이디 사용가능<%
} else{					//db에 중복 아이디 있음
	%>아이디 중복<%
}

%>
