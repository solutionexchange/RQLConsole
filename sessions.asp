<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="expires" content="-1" />
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="copyright" content="2013, Web Site Management" />
	<title>RQL Console</title>
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<style type="text/css">
		body
		{
			padding: 10px;
		}
		textarea
		{
			width: 100%;
			height: 150px;
			padding: 4px;
		}
		.the-fix
		{
			padding-right: 10px;
		}
	</style>
</head>
<body>
	<div class="navbar navbar-inverse">
		<div class="navbar-inner">
			<span class="brand">RQL Sessions</span>
		</div>
	</div>
    <table class="table table-hover">
		<tr class=".success">
			<th>Name</th>
			<th>Value</th>
		</tr>
		<% For Each Item In Session.Contents %>
			<tr>
				<td><%= Item %></td>
				<td><%= Session.Contents(item) %></td>
			</tr>
		<% Next %>
    </table>
	<div class="form-horizontal">

	</div>
</body>
</html>