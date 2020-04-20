<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Home</title>
		<script src= 'http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
		<script>
			$(document).ready(function(){
				//Para mostrar el nombre de cada equipo
				var id = (<c:out value="${totalTeams}"/>);
				if(id!=null){
					// array con names de los teams
					var names = []
					var num = 0;
					<c:forEach var="name" items="${names}">
			   			names[num]= "${name}"
				   		num++
					</c:forEach>
					console.log(num)
					
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
							output+= "<td><a href='Teams?id="+(i)+"'>Details</a></td>"
							output+= "<td><a onclick='deleteTeam("+i+")' class='toDelete' href='Teams?toDeleteId="+(i)+"'>Delete</a></td>"
							output+= "</tr>"
							$('.tabla1').append(output);
						}
				}
				//function deleteTeam(teamId){
						
				//}
 			});
		</script>
	</head>
	<body>
		<h2>Protoype Roster</h2>
		<table class="tabla1">
			<tr>
				<th scope="col">Team</th>
				<th scope="col">Players</th>
				<th scope="col">Actions</th>
			</tr>
		</table>
		<form action="Teams" method="post">
			<input type="submit" value="New Team">
		</form>
		<br><br>
	</body>
</html>