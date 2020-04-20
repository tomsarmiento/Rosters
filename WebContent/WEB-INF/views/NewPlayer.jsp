<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>

		<title>Create a New Player</title>
		<meta charset="utf-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<script src= 'http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
		<script>
			$(document).ready(function(){
				// Para poner el nombre del team como header
				var id = (<c:out value="${id}"/>);
				var names = []
				var num = 0;
				<c:forEach var="name" items="${names}">
			   		names[num]= "${name}"
				   	num++
				</c:forEach>					
				$('.headerTeamName').append(names[(id)])
				$('.back').attr("href","Teams?id="+id+"")
 			});
		</script>
	</head>
	<body>
		<div class="container-fluid">
			<h2 class="headerTeamName">Add a new player to team </h2>
			<form action="Players" method="post" class="form-inline" style="margin-top:20px;">
				<div class="form-group">
					<label style="margin:0px 10px 0px 10px;" for="name">Name: </label>
					<input pattern=".{3,}" title="3 characters minimum" type="text" name="name" class="form-control" required="required">
				</div>
				<div class="form-group">
					<label style="margin:0px 10px 0px 10px;" for="lastname">Lastname: </label>
					<input pattern=".{3,}" title="3 characters minimum" type="text" name="apellido" class="form-control" required="required">
				</div>
				<div class="form-group">
					<label style="margin:0px 10px 0px 10px;" for="age">Age: </label>
					<input type="number" name="age" class="form-control" required step="1" min="17">
				</div>
				<input class="btn btn-outline-secondary" type="submit" value="Add">
			</form>
			<a class="back">Go back</a>
		</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	</body>
</html>