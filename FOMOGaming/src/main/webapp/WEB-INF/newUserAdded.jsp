<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User Added</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
<jsp:include page="navbar.jsp" />
<h3>User Profile successfully added!!!</h3>

${user.id}
${user.username}
<a href="home.do"><input type="button" value="Home"></a>
<a href="login.do"><input type="button" value="Login"></a>
<jsp:include page="bootstrapFoot.jsp"/>
</body>
</html>