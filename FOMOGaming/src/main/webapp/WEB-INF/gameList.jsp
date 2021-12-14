<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FOMO Gaming</title>
</head>
<body>
	<h3>Games Listing</h3>
		<jsp:include page="bootstrapHead.jsp"/>
		<form action="GetGames.do" method="GET">
		<input type="text" name="howmany" value="6" size="2" /> <input
			type="submit" value="Get Numbers" />
		</form>
		
	<c:if test="${not empty games }">
		<table>
			<thead>
				<tr>
					<th>Game Name</th>
					<th>Game Description</th>
				</tr>
			</thead>
				<tbody>
					<c:forEach var="g" items="${games}">
						<tr>
							<td>${g.name}</td>
							<td>${g.description}</td>
							<!-- img  -->
						</tr>
					</c:forEach>
				</tbody>
		</table>
	</c:if>

</body>
</html>