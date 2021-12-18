<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add a New Game Series</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
<jsp:include page="navbar.jsp" />
<h3>Add a game series to FOMOGaming</h3>

 <form action="NewGameInfo.do" method="GET">
 
 	Series Name:
 		<input type="text" name="name" required/>
 		<br>
	Description:
		<input type="text" name="description"/> 
		<br>
 	URL for Series Image: 
		<input type="URL" name="imageUrl"/> 
		<br>
	<input type="reset">
	<input type="submit" value="Add Series" />
 </form>
<jsp:include page="bootstrapFoot.jsp"/>
</body>
</html>