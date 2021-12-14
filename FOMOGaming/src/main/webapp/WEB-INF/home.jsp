<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FOMO Gaming</title>
</head>
<body>
<h1>Fear of Missing Out Gaming</h1>
<jsp:include page="bootstrapHead.jsp"/>

<h2>USER: ${DEBUG}</h2>
<div>
<h3>Games Listing</h3>
		<jsp:include page="bootstrapHead.jsp"/>
		<form action="GetGames.do" method="GET">
		<input type="text" name="howmany" value="6" size="2" /> <input
			type="submit" value="Get Games" />
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
							<td><img class="gameListImg" src="${g.imageUrl}"/></td>
						</tr>
					</c:forEach>
				</tbody>
		</table>
	</c:if>

<a href="AddNewGame.do">Add a new game</a>
<a href="AddNewUser.do">Create Account</a>
</div>
</body>
</html>