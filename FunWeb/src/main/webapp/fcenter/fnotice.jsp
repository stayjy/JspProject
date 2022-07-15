<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../center/notice.jsp">Notice</a></li>
<li><a href="../fcenter/fnotice.jsp">File Download</a></li>
<li><a href="../gcenter/gnotice.jsp">Public News</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<%
// 패키지 board 파일이름 BoardDTO   멤버변수정의 set() get()
// 패키지 board 파일이름 BoardDAO   getBoardList()메서드 정의
// BoardDAO 객체생성
BoardDAO boardDAO=new BoardDAO();
//한페이지 보여줄(가져올) 글개수 설정
int pageSize=3;
//페이지 번호 가져오기
//http://localhost:8080/FunWeb/center/notice.jsp	페이지 넘버 없는 경우
//http://localhost:8080/FunWeb/center/notice.jsp?pageNum=2 있는 경우

String pageNum=request.getParameter("pageNum");
if(pageNum==null) {
	pageNum="1";
}
int currentPage=Integer.parseInt(pageNum);
// 시작하는 행부터 10개(Mysql limit 1,10), 시작하는 행~끝나는 행 (oracle 11~20)
//pageNum pageSize => 		startRow 	endRow
//	1		10	   => 0*10+1	1		 10
//	2		10	   => 1*10+1	11		 20
//	3		10	   => 2*10+1	21		 30
int startRow=(currentPage-1)*pageSize+1;
//끝나는 행
//startRow pageSize => endRow
//	1		10			10
//	11		10			20
//	21		10			30
int endRow=startRow+pageSize-1;
//String sql="select * from board order by num desc limit 1,10";

// List boardList = getBoardList()메서드 호출
List boardList=boardDAO.getBoardList(startRow, pageSize);
%>
<article>
<h1>File Notice</h1>
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
<tr onclick="location.href='fcontent.jsp?num=<%=boardDTO.getNum()%>'">
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
  onclick="location.href='fwrite.jsp'">
	<%
}
%>

</div>
<div class="clear"></div>
<%
//한페이지에 보여줄 페이지개수 설정
int pageBlock=3;
// 시작하는 페이지 번호 구하기
//currentPage pageBlock => startPage
//	1~10		10		=>	(0~9)/10*10+1=> 1
//	11~20		10		=>	(10~19)/10*10+1=> 11
//	21~30		10		=>	(20~29)/10*10+1=> 21
int startPage=(currentPage-1)/pageBlock*pageBlock+1;
// 끝나는 페이지 번호 구하기
//startPage pageBlock => endPage
//		1		10	  => 10
//		11		10	  => 20
//		21		10	  => 30
int endPage=startPage+pageBlock-1;
//전체 글개수 count => select count(*) from board
int count=boardDAO.getBoardCount();

//전체페이지 개수 구하기
//전체글개수 / 한화면에 보여줄 글개수 + 나머지글 없으면 0, 있으면+1
//50/10 => 5페이지 +0페이지
//55/10 => 5페이지 +1페이지
int pageCount=count / pageSize +(count%pageSize==0?0:1);
// 페이지 10페이지 안될경우
if(endPage > pageCount) {
	endPage=pageCount;	
}

%>

<div id="page_control">
<%
if(startPage > pageBlock) {
%>
	<a href="fnotice.jsp?pageNum=<%=startPage-pageBlock%>">Prev</a>
<%
	
}

for(int i=startPage; i<=endPage; i++) {
%>
	<a href="fnotice.jsp?pageNum=<%=i%>"><%=i%></a>	
	<% 
}

if(endPage < pageCount) {
	%>
	<a href="fnotice.jsp?pageNum=<%=startPage+pageBlock%>">Next</a>
	<%	
}
%>

</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>