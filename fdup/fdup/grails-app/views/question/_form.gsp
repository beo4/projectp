<%@ page import="de.ospu.fdup.testimonial.Question" %>



<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'area', 'error')} required">
	<label for="area">
		<g:message code="question.area.label" default="Area" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="area" name="area.id" from="${de.ospu.fdup.testimonial.Area.list()}" optionKey="id" required="" value="${questionInstance?.area?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="question.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${questionInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'question', 'error')} ">
	<label for="question">
		<g:message code="question.question.label" default="Question" />
		
	</label>
	<g:textField name="question" value="${questionInstance?.question}"/>
</div>

