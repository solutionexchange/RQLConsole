<!DOCTYPE html>
<html>
	<head>
		<title>Session Variables</title>
	</head>
	<body>
		<% Response.ContentType = "text/html" %>
		<div>
			<% For Each Item In Session.Contents %>
			<div class="session-variable">
				<div class="name"><%= Item %></div>
				<div class="content"><%= Session.Contents(item) %></div>
			</div>
			<% Next %>
		<div>
	</body>
</html>

