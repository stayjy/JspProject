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
</head>
<body>
<%

BoardDAO boardDAO = new BoardDAO();
ArrayList<BoardDTO> boardList = boardDAO.getSearch(request.getParameter("searchType"), 
		request.getParameter("search"));

if(boardList.size()==0) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('검색결과가 없습니다.')");
	script.println("history.back()");
	script.println("</script>");

}
SimpleDateFormat dateFormat = new SimpleDateFormat("yy.MM.dd");
for (int i = 0; i < boardList.size(); i++) {
	BoardDTO boardDTO = (BoardDTO) boardList.get(i);
%>
<tr onclick="location.href='MovieAc.jsp?num=<%=boardDTO.getNum()%>'">
	<td><%=boardDTO.getNum()%></td>
	<td class="left"><%=boardDTO.getSubject()%></td>
	<td><%=boardDTO.getName()%></td>
	<td><%=dateFormat.format(boardDTO.getDate())%></td>
	<td><%=boardDTO.getReadcount()%></td>
</tr>
<%
}
%>
</body>
</html>