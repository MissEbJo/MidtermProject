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


					<li><form action="gameSeries.do">
							<input type="hidden" name="gameId" id="gameId"
								value="${game.id }">Game Series: ${game.gameSeries.name}<input
								type="submit" value="Go To Game Series">
						</form></li>
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
			TV Shows:
			<br>
				<%-- ${game.tvShows }<br> --%>
				<c:forEach var="show" items="${game.tvShows }">
			${show.title } <img src="${show.posterImageUrl}">
			Number of Seasons: ${shownumberOfSeasons }
			Released: ${show.releaseYear }
			${show.description }
			<iframe src="${show.trailerUrl}"></iframe>
					<c:forEach var="s" items="${show.streamingService }">
						<h5>Watch On</h5>
						<a href="${s.websiteUrl}">${s.name }</a>
						<a href="${s.websiteUrl}"><img src="${s.imageUrl }"></a>
					</c:forEach>
				</c:forEach>
			</c:if>
			<%-- ${game.tvShows.imbdUrl } --%>
<<<<<<< HEAD
			<c:if test="${ ! empty game.boardGames }">
			Board Games:<br>
			${game.boardGames}<br>
			</c:if>
			Book(s):
			${game.gameSeries.books }
			
		</c:when>
	</c:choose>

		<P>
		<c:if test="${loggedInUser != null && !loggedInUser.videoGames.contains(game)}">
		<form action="addFavorite.do" method="post">
		<input type="hidden" name="gameId" value="${game.id }"/>
		<input type="submit"  name="favoriteButton" value="Add to favorites"/> 
		</form>
=======
		</c:when>
	</c:choose>
	<br>
	<P>
		<c:if
			test="${loggedInUser != null && !loggedInUser.videoGames.contains(game)}">
			<form action="addFavorite.do" method="post">
				<input type="hidden" name="gameId" value="${game.id }" /> <input
					type="submit" name="favoriteButton" value="Add to favorites" />
			</form>
>>>>>>> 0695433ef5e2ab2220f6d0105f8841b0e8cd5cd3
		</c:if>
	</P>

		<div class="container justify-content-center mt-5 border-left border-right">
    <div class="d-flex justify-content-center pt-3 pb-2"> <input type="text" name="text" placeholder="+ Add a note" class="form-control addtxt"> </div>
    <div class="d-flex justify-content-center py-2">
        <div class="second py-2 px-2"> <span class="text1">Type your note, and hit enter to add it</span>
            <div class="d-flex justify-content-between py-1 pt-2">
            </div>
	<c:if test="${not empty loggedInUser}">
		<c:if test="${game.userWhoAdded == loggedInUser}">
			<form action="editGame.do" method="post">
				<input type="hidden" name="gameId" value="${game.id }" /> <input
					type="submit" name="editGame" value="EditGame" />
			</form>
		</c:if>
	</c:if>
<<<<<<< HEAD
		<p>
=======

	<p>
>>>>>>> 0695433ef5e2ab2220f6d0105f8841b0e8cd5cd3
		<c:forEach var="comment" items="${game.comments }">
			<h5>${comment.text }</h5>
		</c:forEach>
	</p>

<<<<<<< HEAD
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
=======
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
				<textarea type="text" class="input" name="comment"
					placeholder="Write a comment"></textarea>
				<button class='primaryContained float-right' type="submit">Add
					Comment</button>
				<br> <br> <br>
			</form>
		</div>
		</div>
		</div>
	</section>
	<jsp:include page="../bootstrapFoot.jsp"/>
>>>>>>> 0695433ef5e2ab2220f6d0105f8841b0e8cd5cd3
</body>
</html>