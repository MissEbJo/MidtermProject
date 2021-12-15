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
<jsp:include page="../bootstrapHead.jsp"/>
	<c:choose>
		<c:when test="${ not empty game }">
			<ul>
			
				<li>Game Name: ${game.name} </li>
				<li>Game Name: ${game.description} </li>
				<li>Game Name: ${game.releaseYear} </li>
				<li>Game Name: ${game.mode} </li>
				<li>Game Name: ${game.crossPlatform} </li>
				<li>Game Name: ${game.imageUrl} </li>  <!--change to img  -->
				<li>Game Name: ${game.genres} </li>
				<li>Game Name: ${game.trailerUrl} </li> <!--change to Iframe  -->
				<li>Game Name: ${game.developer.name} </li>
			</ul>

		</c:when>
	</c:choose>


</body>
</html>