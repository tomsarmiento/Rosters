<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Create a New Player</title>
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
				</c:forEach>					//*Tenía id+1, pero ya que borré el primer elemento default que habia puesto en el array name, lo cambié
				$('.headerTeamName').append(names[(id)])
 			});
		</script>
	</head>
	<body>
		<h2 class="headerTeamName">Add a new player to team </h2>
		<form action="Players" method="post">
			<label for="name">Name: </label>
			<input type="text" name="name" required="required">
			<label for="lastname">Lastname: </label>
			<input type="text" name="apellido" required="required">
			<label for="age">Age: </label>
			<input type="number" name="age" required="required" step="1">
			<input type="submit" value="Add">
		</form>
	</body>
</html>