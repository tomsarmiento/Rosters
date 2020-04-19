<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Creating a new Team</title>
	</head>
	<body>
		<h2>Create a new Team</h2>
		<form action="Teams" method="post">
			<label for="name">Team name: </label>
			<input type="text" name="name" required="required">
			<input type="submit" value="Create">
		</form>
		
	</body>
</html>