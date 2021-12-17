
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit a Game</title>
</head>
<body>
	<jsp:include page="bootstrapHead.jsp" />

	<h3>Edit a Game in FOMOGaming</h3>

	<form action="editGameInfo.do" method="GET">
		<input type="hidden" name="id" value="${game.id }"> Name: <input
			type="text" name="name" id="name" value="${game.name }" required />
		<br> <br> Description: <input type="text" name="description"
			value="${game.description }" /> <br> <br> Release Year: <input
			type="number" name="releaseYear" min="1970" max="2021"
			value="${game.releaseYear }" /> <br> <br> Is this game: <br>

		<c:choose>
		
		<c:when test="${game.singlePlayer = true }">
		Single Player - 
			<label for="sptrue">Yes</label>
			<input type="radio" name="singlePlayer" id="sptrue" value="true" checked="checked" />
			<label for="spfalse">No</label>
			<input type="radio" name="singlePlayer" id="spfalse" value="false" />
		</c:when> <c:otherwise>
			<label for="sptrue">Yes</label>
			<input type="radio" name="singlePlayer" id="sptrue" value="true" checked="checked" />
			<label for="spfalse">No</label>
			<input type="radio" name="singlePlayer" id="spfalse" value="false" />
		</c:otherwise>
		</c:choose>
		<c:choose>
		
		<c:when test="${game.multiPlayer = true }">
			Multiplayer - 
			<label for="mptrue">Yes</label>
			<input type="radio" name="multiPlayer" id="mptrue" value="true" checked="checked" />
			<label for="mpfalse">No</label>
			<input type="radio" name="multiPlayer" id="mpfalse" value="false"/>
		</c:when><c:otherwise>
			<label for="mptrue">Yes</label>
			<input type="radio" name="multiPlayer" id="mptrue" value="true" checked="checked" />
			<label for="mpfalse">No</label>
			<input type="radio" name="multiPlayer" id="mpfalse" value="false"/>
		</c:otherwise>
		</c:choose>
		<br> <br> Is this game cross-platform (can two players on
		two different systems play with each other)?: <br> <label
			for="crpl1">Yes</label> <input type="radio" name="crossPlatform"
			id="crpl1" value="true" checked="${game.crossPlatform }" /> <label
			for="crpl2">No</label> <input type="radio" name="crossPlatform"
			id="crpl2" value="false" checked="${game.crossPlatform }" /> <br>
		<br> Cover Art URL: <input type="URL" name="imageUrl"
			value="${game.imageUrl }" /> <br> <br> Game Trailer URL: <input
			type="URL" name="trailerUrl" value="${game.imageUrl }" /> <br>
		<br> What number in the series is this game? (Leave blank if the
		game is not in a series): <input type="number" name="numberInSeries"
			step="1" value="${game.numberInSeries }" /> <br> <br> What
		genre is this game: <br>
		<c:forEach var="genre" items="${genres }">
			<c:choose>
				<c:when test="${game.genres.contains(genre) }">
					<input type="checkbox" checked="checked" id="${genre.name }"
						name="genreNames" value="${genre.name }" />
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="${genre.name }" name="genreNames"
						value="${genre.name }" />
				</c:otherwise>
			</c:choose>
			<label for="${genre.name }">${genre.name }</label>
		</c:forEach>
		<br> <br> What Platform can you play your game on? <br>
		<c:forEach var="platform" items="${allPlatforms }">
			<c:choose>
				<c:when test="${game.platforms.contains(platform) }">
					<input type="checkbox" checked="checked" name="platformNames"
						id="${platform.systemName }" value="${platform.systemName }" />
				</c:when>
				<c:otherwise>
					<input name="platformNames" type="checkbox"
						id="${platform.systemName }" value="${platform.systemName }" />
				</c:otherwise>
			</c:choose>
			<label for="${platform.systemName }">${platform.systemName }</label>
		</c:forEach>
		<br> <br> Is this game part of a series? <select id="sID"
			name="sID">
			<option value="0">No, it's not part of a series</option>
			<c:forEach var="s" items="${series}">
				<option value="${s.id}">${s.name }</option>
			</c:forEach>
		</select> <br> <a href="home.do"><input type="button" value="Home"></a>
		<input type="reset"> <input type="submit" value="Edit Game" />


	</form>


</body>
</html>