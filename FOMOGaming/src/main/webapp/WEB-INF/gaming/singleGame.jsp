<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Video Game</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
	<c:choose>
		<c:when test="${! not empty game }">
			<h4>${game.name}!</h4>
			<ul>
				<li>Game Name: ${game.name}</li>
				<li>Description: ${game.description}</li>
				<li>Release Year: ${game.releaseYear}</li>
				<li>Mode(s): ${game.mode}</li>
				<li>Cross-Platform Capability: ${game.crossPlatform}</li>
				<li>Image: ${game.imageUrl}</li>
				<!--change to img src  -->
				<li>Genre(s): ${game.genre}</li>
				<li>Trailer: ${game.trailerUrl}</li>
				<!--change to img src  -->
				<li>Developer(s): ${game.developer}</li>

			</ul>

		</c:when>
	</c:choose>


</body>
</html>