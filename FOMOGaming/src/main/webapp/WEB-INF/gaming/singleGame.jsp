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
			<div>
			<h4>Related Board Games:</h4>
					<c:forEach var="b" items="${game.boardGames }">
					<h5>${b.name }</h5>
					Released: ${b.releaseYear }
					<br>${b.description}
					<br><a href="${b.websiteUrl }">Website</a>
					<br><img src="${b.imageUrl }">
					</c:forEach>
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

		<p>
		<c:forEach var="comment" items="${game.comments }">
					<h5>${comment.text }</h5>
					</c:forEach>
					</p>

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
      <form action="addComment.do" method="POST">
      <input type="hidden" name="gameId" value="${game.id}">
      <textarea type="text" class="input" name="comment" placeholder="Write a comment"></textarea>
          <button class='primaryContained float-right' type="submit">Add Comment</button>
       </form>
        </div>
      </div>
    </div>
  </section>
	<c:if test="${not empty loggedInUser}">
		<c:if test="${game.userWhoAdded == loggedInUser}">
			<form action="editGame.do" method="post">
				<input type="hidden" name="gameId" value="${game.id }" /> <input
					type="submit" name="editGame" value="EditGame" />
			</form>
		</c:if>
	</c:if>
</body>
</html>