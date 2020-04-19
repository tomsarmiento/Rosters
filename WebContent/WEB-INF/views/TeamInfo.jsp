<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Team Info</title>
		<script src= 'http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
		<script>
			$(document).ready(function(){
				// Para poner el nombre del team como header
				var id = <c:out value="${id}"/>;
				console.log(id)
				var names = []
				var num = 0;
				<c:forEach var="name" items="${names}">
			   		names[num]= "${name}"
				   	num++					//* hay un error con id, no lo pesca, así que puse num
				</c:forEach>				//*Tenía id+1, pero ya que borré el primer elemento default que habia puesto en el array name, lo cambié
				$('.headerTeamName').append(names[id])
				$('.newPlayer').attr("href","Players?id="+id+"")
 			});
		</script>
	</head>
	<body>
		<h1 class="headerTeamName"></h1>
		<a class="newPlayer">New Player</a>
		<table class="tabla1">
			<tr>
				<th scope="col">First Name</th>
				<th scope="col">Last Name</th>
				<th scope="col">Age</th>
				<th scope="col">Actions</th>
			</tr>
			<!--  En el segundo team se muestran los players del primero porque el attributo players permanece desde el anterior--> 
			<c:forEach var="player" items="${players}">	
					<tr>
			   		<td><c:out value="${player.name}"></c:out></td>
			   		<td><c:out value="${player.getLastName()}"></c:out></td>
			   		<td><c:out value="${player.age}"></c:out></td>
			   		<td><a href="Players">Eliminar</a></td>
			   		</tr>
				</c:forEach>
		</table>
		<a href="Home">Go back to Teams</a>
	</body>
</html>