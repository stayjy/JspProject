<%@page import="board.BoardDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/style2.css">
<meta charset="UTF-8">

</head>
<body>
<jsp:include page="../inc/Top.jsp"></jsp:include>
<!-- <nav id="sub_menu">
<ul>
<li><a href="#">Notice</a></li>
<li><a href="#">Public News</a></li>
<li><a href="#">Driver Download</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav> -->
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
	//한페이지 보여줄(가져올) 글개수 설정
	int pageSize = 10;

	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) {
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);

	int startRow = (currentPage - 1) * pageSize + 1;

	int endRow = startRow + pageSize - 1;
	List boardList = boardDAO.getBoardList(startRow, pageSize);
	%>
	<article>
		<h1>자료실</h1>
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
			<tr onclick="location.href='fContent.jsp?num=<%=boardDTO.getNum()%>'">
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

		<div id="table_search">
			<input type="text" name="search" class="input_box"> 
			<input type="button" value="검색" class="btn btn-outline-primary">
			<%
			//세션값 가져오기
			String id = (String) session.getAttribute("id");
			//세션값이 있으면 글쓰기 버튼 보이기
			if (id != null) {
			%>
			<input type="button" value="글쓰기" class="btn btn-outline-primary"
				onclick="location.href='fMovieAcwrite.jsp'">
			<%
			}
			%>

		</div>
		<div class="clear"></div>
		<%
		//한페이지에 보여줄 페이지개수 설정
		int pageBlock = 3;

		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;

		int endPage = startPage + pageBlock - 1;

		int count = boardDAO.getBoardCount();

		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		// 페이지 10페이지 안될경우
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		%>
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">

				<%
				if (startPage > pageBlock) {
				%>
				<li class="page-item"><a class="page-link"
					href="fMovieAc.jsp?pageNum=<%=startPage - pageBlock%>">Prev</a></li>
				<%
				}

				for (int i = startPage; i <= endPage; i++) {
				%>
				<li class="page-item"><a class="page-link"
					href="fMovieAc.jsp?pageNum=<%=i%>"><%=i%></a></li>
				<%
				}
				if (endPage < pageCount) {
				%>
				<li class="page-item"><a class="page-link"
					href="fMovieAc.jsp?pageNum=<%=startPage + pageBlock%>">Next</a></li>
				<%
				}
				%>
				</li>
			</ul>
		</nav>
		</div>
	</article>
	<!-- 게시판 -->
	<!-- 본문들어가는 곳 -->
	<div class="clear"></div>
</body>
</html>