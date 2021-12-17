 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add a Game</title>
</head>
<body>
	<h3>Add a game to FOMOGaming</h3>
	<jsp:include page="bootstrapHead.jsp" />

	<form action="NewGameInfo.do" method="GET">
	
		
		Name:
		<input type="text" name="name" required/> 
		<br>
		<br>
		Description:
		<input type="text" name="description" /> 
		<br>
		<br>
		Release Year:
		<input type="number" name="releaseYear" min="1970" max="2021" /> 
		<br>
		<br>
		Is this game:
		<br> 
		Single Player - 
		<label for="sptrue">Yes</label>
		<input type="radio" name="singlePlayer" id="sptrue" value="true" /> 
		<label for="spfalse">No</label>
		<input type="radio" name="singlePlayer" id="spfalse" value="false" /> 
		<br>
		Multiplayer - 
		<label for="mptrue">Yes</label>
		<input type="radio" name="multiPlayer" id="mptrue" value="true"/> 
		<label for="mpfalse">No</label>
		<input type="radio" name="multiPlayer" id="mpfalse" value="false" /> 
		<br>
		<br>
		
		Is this game cross-platform (can two players on two different systems play with each other)?: 
		<br>
		<label for="crpl1">Yes</label>
		<input type="radio" name="crossPlatform" id="crpl1" value="true" />
		<label for="crpl2">No</label>
		<input type="radio" name="crossPlatform" id="crpl2" value="false"/>
		<br>
		<br>
		
		Cover Art URL: 
		<input type="URL" name="imageUrl" /> 
		<br>
		<br>
		Game Trailer URL:
		<input type="URL" name="trailerUrl" /> 
		<br>
		<br>
		What number in the series is this game? 
		(Leave blank if the game is not in a series): 
		<input type="number" name="numberInSeries" step="1" /> 
		<br>
		<br>
		What genre is this game:
		<br>
		<c:forEach var="genre" items ="${genres }">
		  <input type="checkbox" id="${genre.name }" name="genreNames" value="${genre.name }" /> 
		  <label for="${genre.name }">${genre.name }</label>
		</c:forEach>
		<br>
		<br>
		What Platform can you play your game on?
		<br>
		<c:forEach var="platform" items="${allPlatforms }">
			<input name="platformNames" type="checkbox" id="${platform.systemName }"  value="${platform.systemName }"/> 
			<label for="${platform.systemName }">${platform.systemName }</label>
		</c:forEach>
		
		<br>
		<br>
		Is this game part of a series? 
		<select id="sID" name="sID">
			<option value="0">No, it's not part of a series</option>
			<c:forEach var="s" items="${series}">
				<option value="${s.id}">${s.name }</option>
			</c:forEach>
		</select> <br> 
		<a href="home.do"><input type="button" value="Home"></a>
		<input type="reset">
		<input type="submit" value="Add Game" />


	</form>


</body>
</html>