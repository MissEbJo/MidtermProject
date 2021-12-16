
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Game Series</title>
</head>
<body>
	<jsp:include page="bootstrapHead.jsp" />
	<c:choose>
		<c:when test="${not empty game }">
			<div class="gameSeriesLayout">
				<h2>${game.gameSeries.name}</h2>

				<section><img src="${game.gameSeries.imageUrl}"/></section>

				<p>${game.gameSeries.description }</p>
			</div>
		</c:when>
	</c:choose>
</body>
</html>