<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Video Game</title>
</head>
<body>
<jsp:include page="../bootstrapHead.jsp"/>
	<c:choose>
		<c:when test="${ not empty game }">
			<ul>
			
				<li>Game Name: ${game.name} </li>
				<li>Description: ${game.description} </li>
				<li>Release Year: ${game.releaseYear} </li>
				<li>Single Player: ${game.singlePlayer} </li>
				<li>Multi Player: ${game.multiPlayer}</li>
				<li>Platform: ${game.crossPlatform} </li>
				<li><img class="gameListImg" src="${game.imageUrl}" /></li>
				<li>Genre(s): ${game.genres} </li>
				<li><iframe src="${game.trailerUrl}"></iframe> </li> 
				<li>Developer Name: ${game.developer.name} </li>
				
			</ul>

		</c:when>
	</c:choose>


</body>
</html>