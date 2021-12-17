<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Searching...</title>
<jsp:include page="bootstrapHead.jsp"/>
</head>
<body>
<jsp:include page="navbar.jsp" />		
		<form action="GetByName.do" method="GET">
		Game Name:
		<input type="text" name="name" /> 
		<input type="submit" value="Get Games" />
		</form>

		<form action="GetByDescription.do" method="GET">
		Game Description:
		<input type="text" name="description" /> 
		<input type="submit" value="Get Games" />
		</form>

		<form action="GetByReleaseYear.do" method="GET">
		Game Release Year:
		<input type="text" name="releaseYear" /> 
		<input type="submit" value="Get Games" />
		</form>

		<form action="GetByPlatform.do" method="GET">
		Game Platform:
		
		<select id="platform" name="platform">
		<option value="Nintendo">Nintendo</option>
		<option value="playstation">PlayStation</option>
		<option value="xbox">XBox</option>
		<option value="pc">PC</option>
		<option value="mac">Mac</option>
		<option value="sega">Sega</option>
		<option value="arcade">Arcade</option>
		</select><input type="submit" value="Search By Platform"/>
		
		<!-- <input type="text" name="platform" /> 
		<input type="submit" value="Get Games" /> -->
		</form>

		<form action="GetByDeveloper.do" method="GET">
		Game Developer:
		<input type="text" name="developer"/> 
		<input type="submit" value="Get Games" />
		</form>

		<form action="GetBySeries.do" method="GET">
		Game Series:
		<input type="text" name="series"/> 
		<input type="submit" value="Get Games" />
		</form>
		
		<form action="GetGames.do" method="GET">
		Game Genre:
		<input type="text" name="genre" /> 
		<input type="submit" value="Get Games" />
		</form>
<jsp:include page="bootstrapFoot.jsp"/>
</body>
</html>