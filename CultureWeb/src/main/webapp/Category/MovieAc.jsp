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
<title>MovieAc.jsp</title>
<style type="text/css">

article table#notice{width: 800px;
border-collapse: collapse;}


</style>
</head>
<body>
<jsp:include page="../inc/Top.jsp"></jsp:include>




<%
BoardDAO boardDAO=new BoardDAO();
//한페이지 보여줄(가져올) 글개수 설정
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
<h1>게시판</h1>
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
  onclick="location.href='MovieAcWrite.jsp'">
	<%
}
%>

</div>
<div class="clear"></div>
<%
//한페이지에 보여줄 페이지개수 설정
int pageBlock=3;

int startPage=(currentPage-1)/pageBlock*pageBlock+1;

int endPage=startPage+pageBlock-1;

int count=boardDAO.getBoardCount();


int pageCount=count / pageSize +(count%pageSize==0?0:1);
// 페이지 10페이지 안될경우
if(endPage > pageCount) {
	endPage=pageCount;	
}

%>

<%
if(startPage > pageBlock) {
%>
	<a href="MovieAc.jsp?pageNum=<%=startPage-pageBlock%>">Prev</a>
<%
	
}

for(int i=startPage; i<=endPage; i++) {
%>
	<a href="MovieAc.jsp?pageNum=<%=i%>"><%=i%></a>	
	<% 
}

if(endPage < pageCount) {
	%>
	<a href="MovieAc.jsp?pageNum=<%=startPage+pageBlock%>">Next</a>
	<%	
}
%>

</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
</body>
</html>