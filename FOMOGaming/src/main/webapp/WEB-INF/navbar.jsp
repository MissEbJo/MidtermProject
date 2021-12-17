<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="fomoHeader">
<h1>Fear of Missing Out Gaming</h1>
</div>
<h2>Cryptic Slime Welcomes You...</h2>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">FOMO Gaming</a>
  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
      <a class="nav-item nav-link active" href="home.do">Home <span class="sr-only"></span></a>

      
      
      <a class="nav-item nav-link" href="AdvancedSearch.do">Advanced Search</a>

     <!--  <a class="nav-item nav-link disabled" href="#">Disabled</a> -->
     <c:if test="${not empty loggedInUser }">
     <a class="nav-item nav-link" href="userLogout.do">Logout</a>
     <a class="nav-item nav-link" href="profile.do">Profile</a>
     <a class="nav-item nav-link" href="AddNewGame.do">Add a new game</a> <br>
     <a class="nav-item nav-link" href="AddNewMedia.do">Add a new media tie-in</a> <br>
     </c:if>
     <c:if test="${empty loggedInUser }">
     <a class="nav-item nav-link" href="login.do">Login</a>
     <a class="nav-item nav-link" href="AddNewUser.do">Create Account</a><br>
     </c:if>
      <a class="nav-item nav-link"></a><form action="GetByName.do" method="GET">
		<input type="text" name="name" placeholder="Game Name"/> 
		<input type="submit" value="Search" />
		</form> <!--change functionality to have text input search bar -->
      <a class="nav-item nav-link" href="about.do">About Cryptic Slime</a>
     
    </div>
  </div>
</nav>