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
	<h3>Games Listing</h3>

	<c:if test="${! empty games }">
		<table>
			<thead>
				<tr>
					<th>Game Name</th>
					<th>Delete/Enable Game</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="g" items="${games}">
					<tr>
						<td>${g.name }
						<c:if test="${g.enabled == true}">
						<td><form action="deleteGame.do" method="POST">
							<input type="hidden" name="deleteId" value="${g.id }">
							<input type="submit" value="Delete Game" onclick="Are you sure you want to do this?">
						</form></td></c:if>
						<c:if test="${g.enabled == false}">
						<td><form action="enableGame.do" method="POST">
							<input type="hidden" name="enableId" value="${g.id }">
							<input type="submit" value="Re-Enable Game" onclick="Are you sure you want to do this?">
						</form></td></c:if>
						<%-- <td><a href="GetByNameDetails.do?name=${g.name}">${g.name}</a></td> --%>
						<!-- img  -->
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	<a href="home.do"><input type="button" value="Home"></a>
	<!-- <a href="AdvancedSearch.do"><input type="button" value="Search"></a> -->
	<br>
	<jsp:include page="bootstrapFoot.jsp"/>
</body>
</html>