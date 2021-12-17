<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Media Tie In</title>
</head>
<body>
	<h3>Tie in other media</h3>

	<form>
		<input type="hidden" value="${game.id }" name="gameId" />
	</form>
	<form action="AddSeriesToGame.do" method="GET">
<!-- Create a new series -->
		<input type="submit"/>
	</form>

<jsp:include page="bootstrapFoot.jsp"/>
</body>
</html>