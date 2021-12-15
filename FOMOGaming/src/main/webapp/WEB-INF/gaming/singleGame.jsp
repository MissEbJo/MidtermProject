<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Video Game</title>
<<<<<<< HEAD
=======
<jsp:include page="bootstrapHead.jsp" />
>>>>>>> ed59ee0eb0638cd4c8873c240dfbb8b1de0319a6
</head>
<body>
<jsp:include page="../bootstrapHead.jsp"/>
	<c:choose>
<<<<<<< HEAD
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
		
=======
		<c:when test="${! not empty game }">
			<h4>${game.name}!</h4>
			<ul>
				<li>Game Name: ${game.name}</li>
				<li>Description: ${game.description}</li>
				<li>Release Year: ${game.releaseYear}</li>
				<li>Mode(s): ${game.mode}</li>
				<li>Cross-Platform Capability: ${game.crossPlatform}</li>
				<li>Image: ${game.imageUrl}</li>
				<!--change to img src  -->
				<li>Genre(s): ${game.genre}</li>
				<li>Trailer: ${game.trailerUrl}</li>
				<!--change to img src  -->
				<li>Developer(s): ${game.developer}</li>

>>>>>>> ed59ee0eb0638cd4c8873c240dfbb8b1de0319a6
			</ul>

		</c:when>
	</c:choose>


</body>
</html>