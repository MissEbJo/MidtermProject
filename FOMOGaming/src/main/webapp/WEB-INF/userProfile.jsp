<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
<jsp:include page="navbar.jsp" />
	<br>
<p>User Info:</p>
	<br><img class="profilePicture" src="${loggedInUser.profilePicture}" />
	${loggedInUser.username} 
	${loggedInUser.email}
	<br>
	<br>
	<p>Your favorite games:</p>
	<c:if test="${! empty loggedInUser.videoGames}">
			<c:forEach var="v" items="${loggedInUser.videoGames }">
			<p>${v.name} <br> <img class="gameListImg" src="${v.imageUrl}" /></p>
			</c:forEach></c:if>
	<br><a href="getGamesAdded.do"><input type="button" value="Show games you added"></a>
	<br><c:if test="${loggedInUser.role == 'admin' }">
	<a href="seeAllGames.do"><input type="button" value="See All Games"></a>
	</c:if>
	
	
	<br><a href="deleteProfile.do"><input type="button" value="Delete Profile" onclick="return confirm('Are you sure?')"></a>
	<br><a href="beginEditProfile.do"><input type="button" value="Edit Profile"></a>
	
	<br><a href="home.do"><input type="button" value="Home"></a>
	<jsp:include page="bootstrapFoot.jsp"/>
</body>
</html>