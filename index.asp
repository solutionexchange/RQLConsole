<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
	<script type="text/javascript" src="Rqlconnector.js"></script>
	<script type="text/javascript">
		var LoginGuid = '<%= session("loginguid") %>';
		var SessionKey = '<%= session("sessionkey") %>';
		var RqlConnectorObj = new RqlConnector(LoginGuid, SessionKey);
	
		$(document).ready(function() {
			$('#result').hide();
		});

		function run()
		{
			$('#result').hide();
			$('.form-actions').hide();

			var strRQLXML = $('#rqltextarea').text();

			RqlConnectorObj.SendRql(strRQLXML, false, function(data){
				$('#result').show();
				$('#resulttextarea').text($(data).html());
			});

			$('.form-actions').show();
		}
		
		function ShowSessions()
		{
			var PopUpUrl = 'sessions.asp';
			window.open(PopUpUrl, 'Sessions', 'width=800,height=600,scrollbars=yes,resizable=yes'); 
		}
	</script>
</head>
<body>
	<div class="navbar navbar-inverse">
		<div class="navbar-inner">
			<span class="brand">RQL Console</span>
			<button class="btn btn-info pull-right" onclick="ShowSessions()">Sessions</button>
		</div>
	</div>
	<textarea id="rqltextarea"></textarea>
	<div id="result">
		<span class="label label-success">Results</span><br />
		<textarea readonly="readonly" id="resulttextarea" ></textarea>
	</div>
	<div class="form-actions">
		<button class="btn btn-success pull-right" onclick="run()">Run</button>
	</div>
</body>
</html>