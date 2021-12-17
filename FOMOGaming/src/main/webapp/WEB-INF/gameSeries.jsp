
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
		<c:when test="${not empty gameSeries }">
			<div class="gameSeriesLayout">
				<h2>${gameSeries.name}</h2>

				<section>
					<img src="${gameSeries.imageUrl}" />
				</section>

				<c:choose>
					<c:when test="${not empty gameSeries.movies }">
						<br>
						<br>
						<h3>Related Movies</h3>
						<p>
							<c:forEach var="m" items="${gameSeries.movies}">
								<br>
								<h4>Title: ${m.title }</h4> Released: ${m.releaseYear }<br>
								${m.description }<br>
								<img src="${m.posterImageUrl }">
								<br>
								<a href="${m.imdbUrl }">IMDB</a>
								<br>
								<a href="${m.trailerUrl }">Link to Trailer</a>
								<br>
							</c:forEach>
						</p>
					</c:when>
				</c:choose>
			</div>

			<div>
				<c:choose>
					<c:when test="${not empty gameSeries.tvShows }">
						<br>
						<br>
						<h3>Related TV Shows</h3>
						<p>
							<c:forEach var="t" items="${gameSeries.tvShows}">
								<br>
								<h4>Title: ${t.title }</h4> Released: ${t.releaseYear }<br>
								${t.description }<br>
								<img src="${t.posterImageUrl }">
								<br>
								<a href="${t.imdbUrl }">IMDB</a>
								<br>
								<a href="${t.trailerUrl }">Link to Trailer</a>
								<br>
							</c:forEach>
						</p>
					</c:when>
				</c:choose>
			</div>
			<div>
				<br> <br>
				<c:choose>
					<c:when test="${not empty gameSeries.books }">
						<h3>Related Books</h3>
						<c:forEach var="b" items="${gameSeries.books}">
							<br>
							<h4>Title: ${b.title }</h4>
				Written by: ${b.author}
				Released: ${b.releaseYear }<br>
				${b.description }<br>

						</c:forEach>
					</c:when>
				</c:choose>
			</div>
		</c:when>
	</c:choose>
</body>
</html>