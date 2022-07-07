<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Example single danger button -->

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="../main/Main.jsp">Cultur Life</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							영화 </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="../Category/MovieAc.jsp">액션</a></li>
							<li><a class="dropdown-item" href="#">로맨스/코미디</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							드라마 </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="../Category/DramaRo.jsp">로맨스</a></li>
							<li><a class="dropdown-item" href="#">범죄/스릴러</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							운동 </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item"
								href="../Category/ExerciseWo.jsp">헬스</a></li>
							<li><a class="dropdown-item" href="#">필라테스</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
				</ul>
				<%
				//세션값 가져오기
				String id = (String) session.getAttribute("id");
				//세션값 있다 => 로그인 성공 => ..님 logout update
				//세션값 없다 => 로그인 안함 => login  join
				if (id != null) {
					// 세션값 있다 => 로그인 성공 => ..님 logout update
				%>
				<div id="login"><%=id%>님 &nbsp;
					<button type="button" class="btn btn-outline-dark">
						<a href="../member/Logout.jsp" style="text-decoration: none;">Logout</a>
						<!-- 부트스트랩 우선순위 style 인라인 태그 적용  -->
					</button>
					&nbsp;
					<button type="button" class="btn btn-outline-dark">
						<a href="../member/Update.jsp" style="text-decoration: none;">Update</a>
						<!-- 부트스트랩 우선순위 style 인라인 태그 적용  -->
					</button>
				</div>
				<%
				} else {
				%>
				<div id="login">
					<button type="button" class="btn btn-outline-dark">
						<a href="../member/Login.jsp" style="text-decoration: none;">Login</a>
						<!-- 부트스트랩 우선순위 style 인라인 태그 적용  -->
					</button>
					&nbsp;
					<button type="button" class="btn btn-outline-dark">
						<a href="../member/Join.jsp" style="text-decoration: none;">Join</a>
						<!-- 부트스트랩 우선순위 style 인라인 태그 적용  -->
					</button>

				</div>
				<% 
		}
		
			%>
			
	</nav>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>