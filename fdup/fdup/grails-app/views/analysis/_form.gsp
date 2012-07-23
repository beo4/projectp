<%@ page import="de.ospu.fdup.testimonial.Analysis" %>



<div class="fieldcontain ${hasErrors(bean: analysisInstance, field: 'text', 'error')} ">
	<label for="text">
		<g:message code="analysis.text.label" default="Text" />
		
	</label>
	<g:textArea name="text" cols="40" rows="5" maxlength="65000" value="${analysisInstance?.text}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: analysisInstance, field: 'area', 'error')} ">
	<label for="area">
		<g:message code="analysis.area.label" default="Area" />
		
	</label>
	<g:select id="area" name="area.id" from="${de.ospu.fdup.testimonial.Area.list()}" optionKey="id" value="${analysisInstance?.area?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: analysisInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="analysis.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${analysisInstance?.active}" />
</div>

<div class="fieldcontain ${hasErrors(bean: analysisInstance, field: 'pointsFrom', 'error')} required">
	<label for="pointsFrom">
		<g:message code="analysis.pointsFrom.label" default="Points From" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="pointsFrom" required="" value="${analysisInstance.pointsFrom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: analysisInstance, field: 'pointsTill', 'error')} required">
	<label for="pointsTill">
		<g:message code="analysis.pointsTill.label" default="Points Till" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="pointsTill" required="" value="${analysisInstance.pointsTill}"/>
</div>

