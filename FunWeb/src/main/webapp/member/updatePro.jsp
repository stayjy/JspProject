<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/updatePro.jsp</title>
</head>
<body>
<%
//한글처리
request.setCharacterEncoding("utf-8");
// request id pass name email address phone mobile 파라미터 값 가져오기 => 변수 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String email=request.getParameter("email");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String mobile=request.getParameter("mobile");
// MemberDAO 객체생성
MemberDAO memberDAO=new MemberDAO();
// MemberDTO memberDTO  = userCheck(id,pass) 메서드 호출
MemberDTO memberDTO=memberDAO.userCheck(id, pass);

// memberDTO !=null  아이디 비밀번호 일치  
//      수정할 정보 저장 
// 		MemberDTO updateDTO 객체생성
//      set메서드 호출 id pass name email address phone mobile  저장
//      수정작업 updateMember(updateDTO) 메서드호출  
//       이동 ../main/main.jsp
// memberDTO == null 아이디 비밀번호 틀림  메시지 , 뒤로이동
if(memberDTO !=null){
	MemberDTO updateDTO=new MemberDTO();
	updateDTO.setId(id);
	updateDTO.setPass(pass);
	updateDTO.setName(name);
	updateDTO.setEmail(email);
	updateDTO.setAddress(address);
	updateDTO.setPhone(phone);
	updateDTO.setMobile(mobile);
	
	memberDAO.updateMember(updateDTO);
	response.sendRedirect("../main/main.jsp");
}else{
	%>
	<script type="text/javascript">
		alert("아이디 비밀번호 틀림");
		history.back();
	</script>
	<%
}



%>
</body>
</html>