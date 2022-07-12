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

<style type="text/css">
#sub_menu{width: 238px; float: left;margin: 20px;
font-family:Verdana,Geneva,sans-serif;font-size:1em  }

ul{float: left; margin: 20px 0 0 10px; list-style: none;
}/*밖여백 20 0 0 10 리스트스타일none*/
#sub_menu a{text-decoration: none;color: #666;
display:block;height: 15px;width: 150px;padding: 7px;
border-bottom-width: 1px;border-bottom-style: dotted;
border-bottom-color: #999;
background-image: url("../images/bullet.gif");
background-repeat: no-repeat;
background-position: right center;}
/*밑줄 none 글자색 #666
높이 15px 너비150px 안여백7px
테두리 아래너비 1px 테두리아래스타일 dotted 
테두리아래색 #999 배경이미지 images/bullet.gif
반복no 위치right center*/

article{float: right;width: 670px;
padding-right: 30px;
font-family: Verdana,Geneva,sans-serif;
font-size: 1em;line-height: 1.5em}

#notice {
border: 1px solid;
}
article table#notice{width: 670px;
border-collapse: collapse;}

</style>
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

<ul class="nav flex-column">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#">Active</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Link</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Link</a>
  </li>
  <li class="nav-item">
    <a class="nav-link disabled">Disabled</a>
  </li>
</ul>
	<%
	BoardDAO boardDAO = new BoardDAO();
	//한페이지 보여줄(가져올) 글개수 설정
	int pageSize = 3;

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
		<h1>게시판</h1>
		<table id="notice">
			<tr>
				<th class="tno">No.</th>
				<th class="ttitle">Title</th>
				<th class="twrite">Writer</th>
				<th class="tdate">Date</th>
				<th class="tread">Read</th>
			</tr>
			<%
			//날짜 => 문자열 모양변경
			SimpleDateFormat dateFormat = new SimpleDateFormat("yy.MM.dd");
			for (int i = 0; i < boardList.size(); i++) {
				BoardDTO boardDTO = (BoardDTO) boardList.get(i);
			%>
			<tr onclick="location.href='content.jsp?num=<%=boardDTO.getNum()%>'">
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
			<input type="text" name="search" class="input_box"> <input
				type="button" value="search" class="btn btn-outline-primary">
		</div>
		<div id="table_search">
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
					href="MovieAc.jsp?pageNum=<%=startPage - pageBlock%>">Prev</a></li>
				<%
				}

				for (int i = startPage; i <= endPage; i++) {
				%>
				<li class="page-item"><a class="page-link"
					href="MovieAc.jsp?pageNum=<%=i%>"><%=i%></a></li>
				<%
				}
				if (endPage < pageCount) {
				%>
				<li class="page-item"><a class="page-link"
					href="MovieAc.jsp?pageNum=<%=startPage + pageBlock%>">Next</a></li>
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