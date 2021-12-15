<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FOMO Gaming</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
	<h1>Fear of Missing Out Gaming</h1>
	<c:if test="${not empty loggedInUser }">
	<h1>WE DID IT!!!</h1>
	<h2>Welcome ${loggedInUser.username }</h2>
	</c:if>
	
		<form action="GetGames.do" method="GET">
		</form>
		<c:if test="${not empty games }">
			<table>
				<thead>
					<tr>
						<th>Game Name</th>
						<th>Game Description</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="g" items="${games}">
						<tr>
							<td>${g.name}</td>
							<td>${g.description}</td>
							<td><img class="gameListImg" src="${g.imageUrl}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
		
		
		<a href="AdvancedSearch.do">Advanced Search</a> <br>
		<a href="AddNewGame.do">Add a new game</a> <br>
		 <a href="AddNewUser.do">Create Account</a><br>
		  <a href="login.do">Login</a>
		  <a href="about.do">About this website</a>
	<jsp:include page="bootstrapFoot.jsp"/>
</body>
</html>