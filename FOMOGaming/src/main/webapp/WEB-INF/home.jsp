<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FOMO Gaming</title>
</head>
<body>
	<h1>Fear of Missing Out Gaming</h1>
	<jsp:include page="bootstrapHead.jsp" />

	<h2>Cryptic Slime Welcomes You...</h2>
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">FOMO Gaming</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
	<div> 
		<%-- <h3>Games Listing</h3>
		<jsp:include page="bootstrapHead.jsp" />
		<div class="topnav"> <!-- lines 18-21 for Search Bar Functionality  -->
			<a class="active" href="#home">Home</a> <a href="#about">About</a> <a
				href="#contact">Contact</a> <input type="text"
				placeholder="Search..">
		</div> --%>
		<form action="GetGames.do" method="GET">
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
							<td><img class="gameListImg" src="${g.imageUrl}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>

		<a href="AddNewGame.do">Add a new game</a><br> <a href="AddNewUser.do">Create
			Account</a>
	</div>
</body>
</html>