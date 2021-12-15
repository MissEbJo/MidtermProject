<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Searching...</title>
</head>
<body>
<jsp:include page="bootstrapHead.jsp"/>
		
		<form action="GetGames.do" method="GET">
		Game Genre:
		<input type="text" name="genre" /> 
		<input type="submit" value="Get Games" />
		</form>

</body>
</html>