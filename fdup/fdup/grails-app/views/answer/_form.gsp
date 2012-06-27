<%@ page import="de.ospu.fdup.testimonial.Answer" %>



<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="answer.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${answerInstance?.active}" />
</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'points', 'error')} required">
	<label for="points">
		<g:message code="answer.points.label" default="Points" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="points" required="" value="${answerInstance.points}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'text', 'error')} ">
	<label for="text">
		<g:message code="answer.text.label" default="Text" />
		
	</label>
	<g:textField name="text" value="${answerInstance?.text}"/>
</div>

