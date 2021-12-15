<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
<form action="EditProfile.do" method="POST">
		Edit Username
	<input type="text" name="username" value="${user.username }" required/> 
		<br>
		Edit Password
	<input type="password" name="password" value="${user.password }" required/> 
		<br>
		Edit Email
<input type="email" name="email" value="${user.email }"/> 
		<br>
		Edit Profile Picture URL
<input type="url" name="profilePicture" value="${user.profilePicture }"/> 
		<br>
		<input type="hidden" name="id" id="id" value="${user.id }">
		<input type="hidden" name="enabled" id="enabled" value="${user.enabled }">
		<input type="hidden" name="role" id="role" value="${user.role }">
<input type="submit" onclick="return confirm('Are you sure?')">
<input type="reset">

</form>
</body>
</html>