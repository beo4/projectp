<%@ page import="de.ospu.fdup.testimonial.Questionnaire" %>



<div class="fieldcontain ${hasErrors(bean: questionnaireInstance, field: 'questionnaireQuestions', 'error')} ">
	<label for="questionnaireQuestions">
		<g:message code="questionnaire.questionnaireQuestions.label" default="Questionnaire Questions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${questionnaireInstance?.questionnaireQuestions?}" var="q">
    <li><g:link controller="questionnaireQuestion" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="questionnaireQuestion" action="create" params="['questionnaire.id': questionnaireInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'questionnaireQuestion.label', default: 'QuestionnaireQuestion')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: questionnaireInstance, field: 'start', 'error')} required">
	<label for="start">
		<g:message code="questionnaire.start.label" default="Start" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="start" precision="day"  value="${questionnaireInstance?.start}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: questionnaireInstance, field: 'stop', 'error')} required">
	<label for="stop">
		<g:message code="questionnaire.stop.label" default="Stop" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="stop" precision="day"  value="${questionnaireInstance?.stop}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: questionnaireInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="questionnaire.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${de.ospu.fdup.security.SecUser.list()}" optionKey="id" required="" value="${questionnaireInstance?.user?.id}" class="many-to-one"/>
</div>

