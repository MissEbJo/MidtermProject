<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
<h3>If you have an account, please login below:</h3>
<jsp:include page="bootstrapHead.jsp" />

<form action="userLogin.do" method="GET">
 User Name: <input type="text" name="username" required /> <br>
 Password:  <input type="password" id="password" name="password" min="8" required /> <br> 
 <input type="submit" value="Login">
 <a href="home.do"><input type="button" value="Home"> </a>
 
 </form>

</body>
</html>