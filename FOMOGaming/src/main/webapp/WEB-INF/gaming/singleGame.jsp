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
	<jsp:include page="../bootstrapHead.jsp" />
	<c:choose>
		<c:when test="${ not empty game }">
			<img class="gameListImg" src="${game.imageUrl}" />
			<div>
					<h2>${game.name}</h2>
				<ul>
					<li><blockquote>Description: ${game.description}</blockquote></li>
					<li>Release Year: ${game.releaseYear}</li>
					<li>Platform(s): ${game.platforms }</li>
					<li>Single Player: ${game.singlePlayer}</li>
					<li>Multi-Player: ${game.multiPlayer}</li>
					<li>Cross-Platform/Play: ${game.crossPlatform}</li>
					<li>Genre(s): ${game.genres}</li>
					<li>Developer Name: ${game.developer.name}</li>
					<li>Game Series: ${game.gameSeries.name}</li>

				</ul>
			</div>
			<iframe src="${game.trailerUrl}"></iframe>
			<c:if test="${ ! empty game.tvShows }">
			<br>
			<h3>Related Media</h3>
			<br>
			TV Shows:<br>
			${game.tvShows }<br>
			</c:if>
			<%-- ${game.tvShows.imbdUrl } --%>
			<c:if test="${ ! empty game.boardGames }">
			Board Games:<br>
			${game.boardGames}<br>
			</c:if>
			Book(s):
			${game.gameSeries.books }
			
		</c:when>
	</c:choose>


</body>
</html>