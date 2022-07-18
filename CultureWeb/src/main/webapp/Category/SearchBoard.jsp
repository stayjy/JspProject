<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style2.css">
</head>
<body>
<jsp:include page="../inc/Top.jsp"></jsp:include>
<div id="sub_menu">
<ul class="nav flex-column" >
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="../Category/MovieAc.jsp">게시판</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="../fCategory/fMovieAc.jsp">자료실</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="../gCategory/gMovieAc.jsp">갤러리</a>
  </li>
</ul>
</div>
	<%

BoardDAO boardDAO = new BoardDAO();
ArrayList<BoardDTO> boardList = boardDAO.getSearch(request.getParameter("searchField"), 
		request.getParameter("search"));

if(boardList.size()==0) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('검색결과가 없습니다.')");
	script.println("history.back()");
	script.println("</script>");

}
%>
	<article>
		<h1>게시판</h1>
		<table class="table">
			<thead class="table_bar">
				<tr>
					<th scope="col" class="tno">No.</th>
					<th scope="col" class="ttitle">Title</th>
					<th scope="col" class="twrite">Writer</th>
					<th scope="col" class="tdate">Date</th>
					<th scope="col" class="tread">Read</th>
				</tr>
			</thead>
			<tbody>
			<%
			//날짜 => 문자열 모양변경
			SimpleDateFormat dateFormat = new SimpleDateFormat("yy.MM.dd");
			for (int i = 0; i < boardList.size(); i++) {
				BoardDTO boardDTO = (BoardDTO) boardList.get(i);
			%>
			<tr onclick="location.href='Content.jsp?num=<%=boardDTO.getNum()%>'">
				<td><%=boardDTO.getNum()%></td>
				<td class="left"><%=boardDTO.getSubject()%></td>
				<td><%=boardDTO.getName()%></td>
				<td><%=dateFormat.format(boardDTO.getDate())%></td>
				<td><%=boardDTO.getReadcount()%></td>
			</tr>
			<%
			}
			%>
		</table>
		<div class="container">
		 
		 <form action="SearchBoard.jsp" method="get" name="search">
		 <select name="searchField">
		  	<option value="name">작성자</option>
		  	<option value="subject">제목</option>
		  </select>
			<input type="text" name="search" class="input_box"> 
			<input type="submit" value="검색" class="btn btn-outline-primary">
		</form>
			<%
			//세션값 가져오기
			String id = (String) session.getAttribute("id");
			//세션값이 있으면 글쓰기 버튼 보이기
			if (id != null) {
			%>
			<input type="button" value="글쓰기" class="btn btn-outline-primary"
				onclick="location.href='MovieAcWrite.jsp'">
			<%
			}
			%>

		</div>

</body>
</html>