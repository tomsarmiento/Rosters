<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Team Info</title>
		<meta charset="utf-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<script src= 'http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
		<script>
			$(document).ready(function(){
				// Para poner el nombre del team como header
				var id = <c:out value="${id}"/>;
				var names = []
				var num = 0;
				<c:forEach var="name" items="${names}">
			   		names[num]= "${name}"
				   	num++					
				</c:forEach>				
				$('.headerTeamName').append(names[id])
				$('.newPlayer').attr("href","Players?id="+id+"")
				
				//Para desplegar los jugadores en la tabla
				var i = 0;
				<c:forEach var="player" items="${players}">	
					output = "<tr>"
		   			output += "<td><c:out value="${player.name}"></c:out></td>"
		   			output += "<td><c:out value="${player.getLastName()}"></c:out></td>"
		   			output += "<td>"+<c:out value="${player.age}"></c:out>+"</td>"
		   			output += "<td><a href='Players?playerId="+i+"'>Eliminar</a></td>"
		   			output += "</tr>"
			   		i++
			   		$('.tabla1').append(output);
				</c:forEach>
				
				//posicionar el link NewPlayer
				var position = $('.actions').offset();
				$('.newPlayer').offset({top: (position.top-30), left: position.left});
 			});
		</script>
	</head>
	<body>
		<div class="container-fluid">
			<h1 class="headerTeamName" style="display:inline-block"></h1>
			<a class="newPlayer">New Player</a>
			<table class="tabla1 table table-responsive table-hover">
				<tr>
					<th scope="col">First Name</th>
					<th scope="col">Last Name</th>
					<th scope="col">Age</th>
					<th class="actions" scope="col">Actions</th>
				</tr> 
			</table>
			<a href="Home">Go back to Teams</a>
		</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	</body>
</html>