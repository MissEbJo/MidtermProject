<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Games You Added</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<br>
	<p>Games You Added:</p>
	<br>
	<img class="profilePicture" src="${loggedInUser.profilePicture}" />
	${loggedInUser.username}
	<br>
	<br>
	<p>Your games:</p>
	<c:if test="${! empty videoGamesAdded}">
		<c:forEach var="v" items="${videoGamesAdded }">
			<c:if test="${v.enabled == true }">
			<p>${v.name}
				<br> <img class="gameListImg" src="${v.imageUrl}" />
				<form action="editGame.do" method="post">
				<input type="hidden" name="gameId" value="${v.id }" /> <input
					type="submit" name="editGame" value="EditGame" />
			</form>
			</p>
		</c:if></c:forEach>
	</c:if>
	<br>


	<br>
	<a href="home.do"><input type="button" value="Home"></a>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>