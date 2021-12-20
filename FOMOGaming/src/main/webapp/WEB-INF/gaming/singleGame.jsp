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
	<jsp:include page="../navbar.jsp" />
	<c:choose>
		<c:when test="${ not empty game }">
				<h2>${game.name}</h2><br>
			<img class="gameListImg" src="${game.imageUrl}" />
			<div class="singleGame">
				<ul>
					<li><blockquote>Description: <br>${game.description}</blockquote></li>
					<li>Release Year: ${game.releaseYear}</li>
					<li>Platform(s): ${game.platforms }</li>
					<li>Single Player: ${game.singlePlayer}</li>
					<li>Multi-Player: ${game.multiPlayer}</li>
					<li>Cross-Platform/Play: ${game.crossPlatform}</li>
					<li>Genre(s): ${game.genres}</li>
					<li>Developer Name: ${game.developer.name}</li>
					</ul>
					<c:choose><c:when test="${not empty game.gameSeries }">
					<form action="gameSeries.do">
							<input type="hidden" name="gameId" id="gameId"
								value="${game.id }">Game Series: ${game.gameSeries.name}<br>
								<input type="submit" value="Go To Game Series">
						</form></c:when></c:choose>
						<br>
			</div>
			<div>
				<c:choose>
					<c:when test="${ not empty game.boardGames }">
						<h4>Related Board Games:</h4>
						<c:forEach var="b" items="${game.boardGames }">
							<h5>${b.name }</h5>
					Released: ${b.releaseYear }
					<br>${b.description}
					<br>
							<a href="${b.websiteUrl }">Website</a>
							<br>
							<img src="${b.imageUrl }">
						</c:forEach>
					</c:when>
				</c:choose>
			</div>
			<c:choose>
				<c:when test="${ not empty game.trailerUrl }">
					<h4>Game Trailer</h4>
					<iframe src="${game.trailerUrl}"></iframe>
				</c:when>
			</c:choose>
			<c:if test="${ ! empty game.tvShows }">
				<br>
			<h4>TV Shows:</h4>
			<br>
				<%-- ${game.tvShows }<br> --%>
				<c:forEach var="show" items="${game.tvShows }">
			${show.title }<br> <img src="${show.posterImageUrl}"><br>
			Number of Seasons: ${shownumberOfSeasons }<br>
			Released: ${show.releaseYear }<br>
			<p>${show.description }</p><br>
			<iframe src="${show.trailerUrl}"></iframe>
					<c:forEach var="s" items="${show.streamingService }">
						<h5>Watch On</h5>
						<a href="${s.websiteUrl}">${s.name }</a><br>
						<a href="${s.websiteUrl}"><br>
						<img class="gameListImg" src="${s.imageUrl }"></a>
					</c:forEach>
				</c:forEach>
			</c:if>
			<%-- ${game.tvShows.imbdUrl } --%>
			<c:if test="${ ! empty game.boardGames }">
			<br>Board Games:<br>
			${game.boardGames}<br>
			</c:if>
			<c:if test="${ ! empty game.gameSeries.books }">
			<br>Book(s):<br>
			${game.gameSeries.books }
			</c:if>
		</c:when>
	</c:choose>

		<P>
		<c:if test="${loggedInUser != null && !loggedInUser.videoGames.contains(game)}">
		<form action="addFavorite.do" method="post">
		<input type="hidden" name="gameId" value="${game.id }"/>
		<input type="submit"  name="favoriteButton" value="Add to favorites"/> 
		</form>
		</c:if>
	</P>

	<!-- 	<div class="container justify-content-center mt-5 border-left border-right">
    <div class="d-flex justify-content-center pt-3 pb-2"> <input type="text" name="text" placeholder="+ Add a note" class="form-control addtxt"> </div>
    <div class="d-flex justify-content-center py-2">
        <div class="second py-2 px-2"> <span class="text1">Type your note, and hit enter to add it</span>
            <div class="d-flex justify-content-between py-1 pt-2">
            </div> -->
	<c:if test="${not empty loggedInUser}">
		<%-- <c:if test="${game.userWhoAdded == loggedInUser}">
			<form action="editGame.do" method="post">
				<input type="hidden" name="gameId" value="${game.id }" /> <input
					type="submit" name="editGame" value="EditGame" />
			</form>
		</c:if> --%>
	</c:if>
		<div class="comments">
		<h4>User Comments about ${game.name }</h4>
		<c:forEach var="comment" items="${game.comments }">
			<div>-----------------------------------------------------------</div>
			<h5>${comment.text }</h5>
			<div>Posted by ${comment.user.username } on ${comment.timestamp} </div> 
		</c:forEach>
		</div>
	<c:choose><c:when test="${not empty loggedInUser}">
		<section id="app">
    <div class="container">
      <div class="row">
    <!--   <div class="col-6"> --> 
          <div class="comment">
        <p v-for="items in item" v-text="items"></p>
          </div>
          </div>
          </div>
      <div class="row">
  <!--      <div class="col-6">   --> 
      <form action="addComment.do" method="POST">
      <input type="hidden" name="gameId" value="${game.id}">
      <textarea type="text" class="input" name="comment" placeholder="Write a comment"></textarea>
          <button class='primaryContained float-right' type="submit">Add Comment</button>
          <br>
          <br>
          <br>
       </form>
       	</div>
  </section></c:when></c:choose>
  
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