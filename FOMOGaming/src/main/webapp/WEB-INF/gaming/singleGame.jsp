<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Video Game</title>
<jsp:include page="../bootstrapHead.jsp"/>
</head>
<body>
	<c:choose>
		<c:when test="${! empty game }">
			<ul>
				<li>Game Name: ${game.name} </li>
				<li>Game Name: ${game.description} </li>
				<li>Game Name: ${game.releaseYear} </li>
				<li>Game Name: ${game.mode} </li>
				<li>Game Name: ${game.crossPlatform} </li>
				<li>Game Name: ${game.imageUrl} </li>
				<li>Game Name: ${game.genre} </li>
				<li>Game Name: ${game.trailerUrl} </li>
				<li>Game Name: ${game.developer} </li>

			</ul>

		</c:when>
	</c:choose>


</body>
</html>