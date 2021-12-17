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
					<li><form action="gameSeries.do"><input type="hidden" name="gameId" id="gameId" value="${game.id }">Game Series: ${game.gameSeries.name}<input type="submit" value="Go To Game Series"></form></li>

				</ul>
			</div>
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
			<br>
			<iframe src="${game.trailerUrl}"></iframe>

		<P>
		<c:if test="${loggedInUser != null && !loggedInUser.videoGames.contains(game)}">
		<form action="addFavorite.do" method="post">
		<input type="hidden" name="gameId" value="${game.id }"/>
		<input type="submit"  name="favoriteButton" value="Add to favorites"/> 
		</form>
		</c:if>
		</P>

		<section id="app">
    <div class="container">
      <div class="row">
        <div class="col-6">
          <div class="comment">
        <p v-for="items in item" v-text="items"></p>
          </div>
          </div>
          </div>
      <div class="row">
        <div class="col-6">
      <textarea type="text" class="input" placeholder="Write a comment" v-model="newItem" @keyup.enter="addItem()"></textarea>
          <button v-on:click="addItem()" class='primaryContained float-right' type="submit">Add Comment</button>
        </div>
      </div>
    </div>
  </section>

</body>
</html>