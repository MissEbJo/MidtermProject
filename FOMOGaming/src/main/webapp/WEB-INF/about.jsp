<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About our website</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
<jsp:include page="navbar.jsp" />
<div class="about-section">
<h3>About Cyptic Slime's video game website</h3>


<p>Hello!
<p>Welcome to our Cryptic Slime's midterm project!
</div>



<p>On this site, you will be able to interact with a database of video games. 
Without creating a user account, you will be able to search the current collection of video games, viewing the details such as name, description, release year, genre... and more!


<p>To create an account, go ahead and navigate to the 'Create Account' button at the bottom of the page, here you will be prompted for some information needed to create your profile, then redirected to the home page. A confirmation in the form a welcome message with your username will show at the top of your page.
Once you create an account, you will have access to other functionalities of the project, such as submitting your own videogame, viewing your profile, and much more!

<p>Adding an entry into the database as an account holder will automatically log the entries you have submitted, you can edit and delete your submissions to help grow our site!

 
<p>Team Members : Fredrick Kaucher, Ebony Johnson, Ian Verderame, Christopher Lee

<!-- <a href="home.do"><input type="button" value="Home"></a> -->
<jsp:include page="bootstrapFoot.jsp"/>
</body>
</html>