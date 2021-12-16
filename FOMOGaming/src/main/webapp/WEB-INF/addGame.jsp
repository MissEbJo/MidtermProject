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
		Description:
		<input type="text" name="description"/> 
		<br>
		Release Year:
		<input type="number" name="releaseYear" min="1970" max="2021"/> 
		<br>
		Mode: 
		<label for="sp">Single Player</label>
		<input type="checkbox" name="singlePlayer" value=""/> 
		<label for="mp">MultiPlayer</label>
		<input type="checkbox" name="multiPlayer" value=""/> 
		<br>
		Is this game cross-platform (can two players on two different systems play with each other)?: 
		<label for="crpl1">Yes</label>
		<input type="radio" name="crossPlatform" id="crpl1" value="true"/>
		<label for="crpl2">No</label>
		<input type="radio" name="crossPlatform" id="crpl2" value="false"/>
		<br>
		Cover Art URL: 
		<input type="URL" name="imageUrl"/> 
		<br>
		Game Trailer URL:
		<input type="URL" name="trailerUrl"/> 
		<br>
		What number in the series is this game? 
		(Leave blank if the game is not in a series): 
		<input type="number" name="numberInSeries" step="1"/> 
		<br>
		What genre is this game:
		<c:forEach var="genre" items ="${genres }">
		  <input type="checkbox" id="${genre.name }" name="genreNames" value="${genre.name }"/> 
		  <label for="${genre.name }">${genre.name }</label>
		</c:forEach>
		
		What Platform can you play your game on?
		<c:forEach var="platform" items="${allPlatforms }">
			<input name="platformNames" type="checkbox" id="${platform.systemName }"  value="${platform.systemName }"/> 
			<label for="${platform.systemName }">${platform.systemName }</label>
		</c:forEach>
		<!-- <input type="checkbox" id="genre" name="rpg" value="rolePlayingGame"/> 
		<label for="rpg">Role-Playing</label>
		<input type="checkbox" id="genre" name="adv" value="adventure"/> 
		<label for="adv">Adventure</label>
		<input type="checkbox" id="genre" name="sht" value="shooter"/> 
		<label for="sht">Shooter</label>
		<input type="checkbox" id="genre" name="sports" value="sports"/> 
		<label for="sports">Sports</label>
		<input type="checkbox" id="genre" name="fight" value="fighting"/> 
		<label for="fight">Fighting</label>
		<input type="checkbox" id="genre" name="strat" value="strategy"/> 
		<label for="strat">Strategy</label>
		<input type="checkbox" id="genre" name="race" value="racing"/> 
		<label for="race">Racing</label>
		<input type="checkbox" id="genre" name="sim" value="simulation"/> 
		<label for="sim">Simulation</label>
		<input type="checkbox" id="genre" name="puz" value="puzzle"/> 
		<label for="ouz">Puzzle</label>
		<input type="checkbox" id="genre" name="rogue" value="rogue"/> 
		<label for="rogue">Rogue</label>
		<input type="checkbox" id="genre" name="br" value="battleRoyale"/> 
		<label for="br">Battle Royale</label>
		<input type="checkbox" id="genre" name="party" value="party"/> 
		<label for="br">Party</label>
		<input type="checkbox" id="genre" name="rts" value="realTimeStrategy"/> 
		<label for="rts">Real-Time Strategy</label>
		<input type="checkbox" id="genre" name="mmo" value="massivelyMultiplayerOnline"/> 
		<label for="mmo">Massively Multiplayer Online</label> -->
		<br>
	<%-- 	Is this game part of a series? (Select "No" if you need to add the series into the database)
		<select id="gameSeries" name="gameSeries"> 
		<option value="">No</option>
		<c:forEach forEach var="singleSeries" items="${series}">
			<option value="${singleSeries}">${singleSeries.name }</option>
		</c:forEach>
		</select> 
		<br> --%>
		
		<!-- <input type="checkbox" name="platforms" id="pc" value="pc"/> 
		<label for="pc">PC</label>
		<input type="checkbox" name="platforms" id="mac" value="mac"/> 
		<label for="mac">Mac</label>
		<input type="checkbox" name="platforms" id="xbox" value="xbox"/> 
		<label for="xbox">Xbox</label>
		<input type="checkbox" name="platforms" id="ps" value="playstation"/> 
		<label for="ps">PlayStation</label>
		<input type="checkbox" name="platforms" id="sega" value="sega"/> 
		<label for="sega">Sega</label>
		<input type="checkbox" name="platforms" id="arcade" value="arcade"/> 
		<label for="arcade">Arcade</label> -->
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