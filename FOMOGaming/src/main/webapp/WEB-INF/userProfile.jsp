<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>

	<br>${loggedInUser.username} 
	<br>${loggedInUser.email}
	<br><img class="profilePicture" src="${loggedInUser.profilePicture}" />
	<br><a href="deleteProfile.do"><input type="button" value="Delete Profile" onclick="return confirm('Are you sure?')"></a>
	<br><a href="home.do"><input type="button" value="Home"></a>
</body>
</html>