function RqlConsole(RqlConnectorObj) {
	var ThisClass = this;

	this.RqlConnectorObj = RqlConnectorObj;
	
	this.TemplateSessionVariables = '#template-session-variables';
	this.TemplateRqlResult = '#template-rql-result';
	
	this.SourceRqlTextArea = '#rqltextarea';

	$('body').on('click', '#sessions', function(){
		ThisClass.ShowSessionVariables();
	});
	
	$('body').on('click', '#run', function(){
		var RqlXml = $(ThisClass.SourceRqlTextArea).text();
		if(RqlXml == '') {
			RqlXml = $(ThisClass.SourceRqlTextArea).val();
		}
		ThisClass.RunRql(RqlXml);
	});
}

RqlConsole.prototype.RunRql = function(RqlXml) {
	var ThisClass = this;
	
	RqlConnectorObj.SendRql(RqlXml, true, function(data){
		var ResultObj = {rql: data};
		ThisClass.UpdateArea(ThisClass.TemplateRqlResult, ResultObj);
	});
}

RqlConsole.prototype.ShowSessionVariables = function() {
	var ThisClass = this;
	
	var SessionVariablesContainer = $(this.TemplateSessionVariables).attr('data-container');
	$(SessionVariablesContainer).closest('.modal').modal('show');
	
	var SessionVariablesUrl = 'sessions.asp';
	$.post(SessionVariablesUrl, function(data){
		var Sessions = [];
		$(data).find('.session-variable').each(function(){
			Sessions.push({name: $(this).find('.name').html(), content: $(this).find('.content').html()});
		});

		ThisClass.UpdateArea(ThisClass.TemplateSessionVariables, {sessions: Sessions});
	});
}

RqlConsole.prototype.UpdateArea = function(TemplateId, Data){
	var ContainerId = $(TemplateId).attr('data-container');
	var TemplateAction = $(TemplateId).attr('data-action');
	var Template = Handlebars.compile($(TemplateId).html());
	var TemplateData = Template(Data);

	if((TemplateAction == 'append') || (TemplateAction == 'replace'))
	{
		if (TemplateAction == 'replace') {
			$(ContainerId).empty();
		}

		$(ContainerId).append(TemplateData);
	}

	if(TemplateAction == 'prepend')
	{
		$(ContainerId).prepend(TemplateData);
	}

	if(TemplateAction == 'after')
	{
		$(ContainerId).after(TemplateData);
	}
}