<%@ page import="projektp.tenant.Tenant" %>



<div class="fieldcontain ${hasErrors(bean: tenantInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="tenant.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="name" cols="40" rows="5" maxlength="255" required="" value="${tenantInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tenantInstance, field: 'accounts', 'error')} ">
	<label for="accounts">
		<g:message code="tenant.accounts.label" default="Accounts" />
		
	</label>
	<g:select name="accounts" from="${projektp.tenant.Account.list()}" multiple="multiple" optionKey="id" size="5" value="${tenantInstance?.accounts*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tenantInstance, field: 'financialStrength', 'error')} ">
	<label for="financialStrength">
		<g:message code="tenant.financialStrength.label" default="Financial Strength" />
		
	</label>
	<g:textField name="financialStrength" value="${tenantInstance?.financialStrength}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tenantInstance, field: 'incidents', 'error')} ">
	<label for="incidents">
		<g:message code="tenant.incidents.label" default="Incidents" />
		
	</label>
	<g:select name="incidents" from="${projektp.tenant.Incident.list()}" multiple="multiple" optionKey="id" size="5" value="${tenantInstance?.incidents*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tenantInstance, field: 'rating', 'error')} ">
	<label for="rating">
		<g:message code="tenant.rating.label" default="Rating" />
		
	</label>
	<g:textField name="rating" value="${tenantInstance?.rating}"/>
</div>

