<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="expires" content="-1" />
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="copyright" content="2013, Web Site Management" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" >
	<title>RQL Console</title>
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<style type="text/css">
		body
		{
			padding: 10px;
		}
		textarea
		{
			width: 95%;
			height: 150px;
		}
	</style>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/handlebars-v2.0.0.js"></script>
	<script type="text/javascript" src="rqlconnector/Rqlconnector.js"></script>
	<script id="template-session-variables" type="text/x-handlebars-template" data-container="#session-variables .modal-body" data-action="replace">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Name</th>
					<th>Content</th>
                </tr>
			</thead>
            <tbody>
				{{#each sessions}}
				<tr>
					<td>{{name}}</td>
					<td>{{content}}</td>
                </tr>
				{{/each}}
			</tbody>
		</table>	
	</script>
	<script id="template-rql-result" type="text/x-handlebars-template" data-container="#rql-result" data-action="replace">
		<div class="label label-success">Results</div>
		<textarea readonly="readonly">{{rql}}</textarea>
	</script>
	<script type="text/javascript" src="js/rql-console.js"></script>
	<script type="text/javascript">
		var LoginGuid = '<%= session("loginguid") %>';
		var SessionKey = '<%= session("sessionkey") %>';
		var RqlConnectorObj = new RqlConnector(LoginGuid, SessionKey);
	
		$(document).ready(function() {
			var RqlConsoleObj = new RqlConsole(RqlConnectorObj);
		});
	</script>
</head>
<body>
	<div id="session-variables" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">Session Variables</h3>
		</div>
		<div class="modal-body">

		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
		</div>
	</div>
	<div class="navbar navbar-inverse">
		<div class="navbar-inner">
			<span class="brand">RQL Console</span>
			<div class="btn btn-info pull-right" id="sessions">Sessions</div>
		</div>
	</div>
	<textarea id="rqltextarea"></textarea>
	<div id="rql-result">

	</div>
	<div class="form-actions">
		<button class="btn btn-success pull-right" id="run">Run</button>
	</div>
</body>
</html>