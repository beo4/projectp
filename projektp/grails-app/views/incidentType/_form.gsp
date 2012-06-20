<%@ page import="projektp.tenant.IncidentType" %>



<div class="fieldcontain ${hasErrors(bean: incidentTypeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="incidentType.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="name" cols="40" rows="5" maxlength="255" required="" value="${incidentTypeInstance?.name}"/>
</div>

