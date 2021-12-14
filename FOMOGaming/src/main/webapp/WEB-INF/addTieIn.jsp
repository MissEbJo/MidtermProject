<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add a Game</title>
</head>
<body>
	<h3>Add a game to FOMOGaming</h3>

	<form action="NewGameInfo.do" method="GET">
	
	Is this game part of a series? (Select "No" if you need to add the series into the database)
	 	<select id="gameSeries" name="gameSeries"> 
		<option value="">No</option>
		<c:forEach forEach var="singleSeries" items="${series}">
			<option value="${singleSeries}">${singleSeries.name }</option>
		</c:forEach>
		</select> 
		<br> 

	</form>


</body>
</html>