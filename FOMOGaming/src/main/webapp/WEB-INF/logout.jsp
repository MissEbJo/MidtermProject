<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
<jsp:include page="navbar.jsp" />
<h2>You have Succesfully Logged Out</h2>
<a href="login.do"><input type="button" value="Login"></a>
<a href="home.do"><input type="button" value="Homepage"></a>
<jsp:include page="bootstrapFoot.jsp"/>
</body>
</html>