<%@ page import="projektp.tenant.Account" %>



<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="account.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="name" cols="40" rows="5" maxlength="255" required="" value="${accountInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'accountNumber', 'error')} ">
	<label for="accountNumber">
		<g:message code="account.accountNumber.label" default="Account Number" />
		
	</label>
	<g:textField name="accountNumber" value="${accountInstance?.accountNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'blz', 'error')} ">
	<label for="blz">
		<g:message code="account.blz.label" default="Blz" />
		
	</label>
	<g:textField name="blz" value="${accountInstance?.blz}"/>
</div>

