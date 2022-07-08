<%@page import="board.BoardDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="../inc/Top.jsp"></jsp:include>
<body>
<%
BoardDAO boardDAO=new BoardDAO();

int pageSize=3;

String pageNum=request.getParameter("pageNum");
if(pageNum==null) {
	pageNum="1";
}

int currentPage=Integer.parseInt(pageNum);

int startRow=(currentPage-1)*pageSize+1;
int endRow=startRow+pageSize-1;

List boardList=boardDAO.getBoardList(startRow, pageSize);
%>
<article>
<h1>Notice</h1>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
   <%
   //날짜 => 문자열 모양변경
   SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
   
   for(int i=0;i<boardList.size();i++){
	   BoardDTO boardDTO=(BoardDTO)boardList.get(i);
	   %>
<tr onclick="location.href='content.jsp?num=<%=boardDTO.getNum()%>'">
   <td><%=boardDTO.getNum() %></td>
    <td class="left"><%=boardDTO.getSubject() %></td>
    <td><%=boardDTO.getName() %></td>
    <td><%=dateFormat.format(boardDTO.getDate()) %></td>
    <td><%=boardDTO.getReadcount() %></td></tr>	   
	   <%
   }
   %> 
</table>
 <div id="table_search">
<input type="text" name="search" class="input_box">
<input type="button" value="search" class="btn">
</div>
<div id="table_search">
<%
//세션값 가져오기
String id=(String)session.getAttribute("id");
//세션값이 있으면 글쓰기 버튼 보이기
if(id!=null) {
	%>
<input type="button" value="글쓰기" class="btn" 
  onclick="location.href='write.jsp'">
	<%
}
%>

</div>
<div class="clear"></div>

 
 
 
 
 
 
 
 
 
 
 
 
 
 
</body>
</html>