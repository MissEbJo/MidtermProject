<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home (Logged In)</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
<jsp:include page="navbar.jsp" />
<h3>FOMO Gaming</h3>

<a href="userProfile.do">Profile Page</a>
<a href="logout.do">Log Out</a>

<jsp:include page="bootstrapFoot.jsp"/>
</body>
</html>