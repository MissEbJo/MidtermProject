<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User Added</title>
</head>
<body>

<h3>User Profile successfully added!!!</h3>

${user.id}
${user.username}
<a href="home.do"><input type="button" value="Home"></a>
</body>
</html>