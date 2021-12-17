<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FOMO Gaming</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<c:if test="${not empty loggedInUser }">
	<h2>Welcome, ${loggedInUser.username }</h2>
	
	</c:if>
		<form action="GetGames.do" method="GET">
		</form>
		<c:if test="${not empty games }">
			<table>
				<thead>
					<tr>
						<th><h4>Game Name</h4></th>
						<th>Game Description</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="g" items="${games}">
						<tr>
							<td><h5>${g.name}</h5></td>
							<td><p><br><br>${g.description}</p></td>
							<%-- <td><form action="GetByName.do"><input type="image" src="${g.imageUrl}" id="${g.name }" name="${g.name }" value="${g.name }"></form></td> --%>
							<td><img class="gameListImg" src="${g.imageUrl}"/><br><br></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
		
	<jsp:include page="bootstrapFoot.jsp"/>
</body>
</html>