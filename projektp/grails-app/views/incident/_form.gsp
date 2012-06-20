<%@ page import="projektp.tenant.Incident" %>



<div class="fieldcontain ${hasErrors(bean: incidentInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="incident.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="name" cols="40" rows="5" maxlength="255" required="" value="${incidentInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: incidentInstance, field: 'ammount', 'error')} required">
	<label for="ammount">
		<g:message code="incident.ammount.label" default="Ammount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="ammount" required="" value="${fieldValue(bean: incidentInstance, field: 'ammount')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: incidentInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="incident.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="type" name="type.id" from="${projektp.tenant.IncidentType.list()}" optionKey="id" required="" value="${incidentInstance?.type?.id}" class="many-to-one"/>
</div>

