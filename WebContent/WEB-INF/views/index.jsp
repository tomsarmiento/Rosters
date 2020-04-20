<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Home</title>
		<meta charset="utf-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<script src= 'http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
		<script>
			$(document).ready(function(){
				//Para mostrar el nombre de cada equipo
				// array con names de los teams
				var names = []
				var num = 0;
				<c:forEach var="name" items="${names}">
			   		names[num]= "${name}"
				   	num++
				</c:forEach>
				
				//array con la cantidad de jugadores de cada team
				var players = []
				var num1 = 0;
				<c:forEach var="amount" items="${playersAmount}">
			   		players[num1]= "${amount}"
				   	num1++
				</c:forEach>
					
				// Loopea para generar la info de cada team
				for( i=0; i < (num); i++){
					output= "<tr>"
					output+= "<td>"+names[(i)]+"</td>"
					output+= "<td>"+players[i]+"</td>"
					output+= "<td><a style='width:30px;' href='Teams?id="+(i)+"'>Details</a><a style='margin-left:5px;' href='Teams?toDeleteId="+(i)+"'>Delete</a></td>"
					output+= "</tr>"
					$('.tabla1').append(output);
				}
 			});
		</script>
	</head>
	<body>
		<div class="container-fluid">
			<h2>Protoype Roster</h2>
			<table class="tabla1 table table-responsive table-hover">
				<tr>
					<th scope="col">Team</th>
					<th scope="col">Players</th>
					<th scope="col">Actions</th>
				</tr>
			</table>
			<form action="Teams" method="post">
				<input class="btn btn-outline-secondary" type="submit" value="New Team">
			</form>
		</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	</body>
</html>