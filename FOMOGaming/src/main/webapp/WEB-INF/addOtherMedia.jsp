 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Media Tie Ins</title>
</head>
<body>
	<jsp:include page="bootstrapHead.jsp" />
	<h1>Add Media to FOMOGaming</h1>

	<h3>Add a Movie</h3>
	<form action="AddMovie.do" method="GET">
		
		Title:
		<input type="text" name="title" required/> 
		<br>
		Description:
		<input type="text" name="description"/> 
		<br>
		Release Year:
		<input type="number" name="releaseYear" min="1900" max="2021" required/> 
		<br>
		Trailer URL:
		<input type="URL" name="trailerUrl"/> 
		<br>
		Movie Poster URL:
		<input type="URL" name="posterImageUrl"/> 
		<br>
		IMDB URL:
		<input type="URL" name="imdbUrl"/> 
		<br>
		What series is this movie a part of? 
		<select id="seriesId" name="seriesId">
			<option value="0">No, it's not part of a series</option>
			<c:forEach var="s" items="${series}">
				<option value="${s.id}">${s.name }</option>
			</c:forEach>
		</select> <br> 
		<input type="reset">
		<input type="submit" value="Submit Movie"/>
		</form>
		
	<h3>Add a BoardGame</h3>
	<form action="AddBoardGame.do" method="GET">
		
		Title:
		<input type="text" name="name" required/> 
		<br>
		Description:
		<input type="text" name="description"/> 
		<br>
		Release Year:
		<input type="number" name="releaseYear" min="1900" max="2021"/> 
		<br>
		Website URL:
		<input type="URL" name="websiteUrl"/> 
		<br>
		Image URL:
		<input type="URL" name="imageUrl"/>
		<br>
		What VideoGame is this BoardGame a part of? 
		<select id="gameId" name="gameId">
			<option value="0">No, it's not part of a game</option>
			<c:forEach var="g" items="${allGames}">
				<option value="${g.id}">${g.name }</option>
			</c:forEach>
		</select> <br> 
		<input type="reset">
		<input type="submit" value="Submit BoardGame"/>
		</form>
		
	<h3>Add a Book</h3>
	<form action="AddBoardGame.do" method="GET">
		
		Title:
		<input type="text" name="title" required/> 
		<br>
		Description:
		<input type="text" name="description"/> 
		<br>
		Release Year:
		<input type="number" name="releaseYear" min="1900" max="2021"/> 
		<br>
		Author:
		<input type="text" name="author"/> 
		<br>
		What series is this movie a part of? 
		<select id="seriesId" name="seriesId">
			<option value="0">No, it's not part of a series</option>
			<c:forEach var="s" items="${series}">
				<option value="${s.id}">${s.name }</option>
			</c:forEach>
		</select> <br> 
		<input type="reset">
		<input type="submit" value="Submit Book"/>
		</form>
		
	<h3>Add a TV Show</h3>
	<form action="AddTVShow.do" method="GET">
		
		Title:
		<input type="text" name="title" required/> 
		<br>
		Description:
		<input type="text" name="description"/> 
		<br>
		Release Year:
		<input type="number" name="releaseYear" min="1900" max="2021"/> 
		<br>
		Number of Seasons:
		<input type="number" name="numberOfSeasons" step="1"/> 
		<br>
		IMDB URL:
		<input type="URL" name="imdbUrl"/> 
		<br>
		Trailer URL:
		<input type="URL" name="trailerUrl"/> 
		<br>
		Poster Image URL:
		<input type="URL" name="posterImageUrl"/> 
		<br>
		<input type="reset">
		<input type="submit" value="Submit TV Show"/>
		</form>
		
		
</body>
</html>