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
	<br>
<p>User Info:</p>
	<br>${loggedInUser.username} 
	<br>${loggedInUser.email}
	<br>
	<p>Your favorite games:</p>
	<c:if test="${! empty loggedInUser.videoGames}">
			<c:forEach var="v" items="${loggedInUser.videoGames }">
			<p>${v.name}</p>
			</c:forEach></c:if>
	<br><img class="profilePicture" src="${loggedInUser.profilePicture}" />
	<br><a href="deleteProfile.do"><input type="button" value="Delete Profile" onclick="return confirm('Are you sure?')"></a>
	<br><a href="beginEditProfile.do"><input type="button" value="Edit Profile"></a>
	<br><a href="home.do"><input type="button" value="Home"></a>
</body>
</html>