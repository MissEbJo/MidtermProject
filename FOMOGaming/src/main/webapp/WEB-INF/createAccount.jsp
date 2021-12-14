<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Account</title>
</head>
<body>
	<h3>Please enter required information to create an account</h3>
	<jsp:include page="bootstrapHead.jsp" />

	<form action="addUserInfo.do" method="GET">
		First Name: <input type="text" name="firstname" required /> <br>
		Last Name:<input type="text" name="lastname" required /><br>
	    User Name: <input type="text" name="name" required /> <br>
		Email: <input type="email" id="email" required /> <br> 
		Password (8 character minimum): <input type="password" id="pass"
			name="password" minlength="8" required /> <br> 
			Birthday (YYYY/MM): <input type="month" id="bday" name="bdaymonth" /> <br>
		Add a profile picture (optional): <input id="image" type="file"
			name="profile_photo" placeholder="Photo" capture /> <br> 
			<a href="home.do"><input type="button" value="Home"></a>
			<input type="reset">
			<input type="submit" value="Submit >" />

	</form>

</body>
</html>