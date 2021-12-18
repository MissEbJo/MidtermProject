<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whoopsie</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
<jsp:include page="navbar.jsp" />
<h3>Uh oh, something went wrong :(</h3>
<img src="https://i.kym-cdn.com/photos/images/original/001/514/850/206.jpg">
<a href="home.do"><input type="button" value="Home"></a>
<jsp:include page="bootstrapFoot.jsp"/>
</body>
</html>