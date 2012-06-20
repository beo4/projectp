
<%@ page import="projektp.tenant.Tenant" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tenant.label', default: 'Tenant')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tenant" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tenant" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tenant">
			
				<g:if test="${tenantInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="tenant.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${tenantInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tenantInstance?.accounts}">
				<li class="fieldcontain">
					<span id="accounts-label" class="property-label"><g:message code="tenant.accounts.label" default="Accounts" /></span>
					
						<g:each in="${tenantInstance.accounts}" var="a">
						<span class="property-value" aria-labelledby="accounts-label"><g:link controller="account" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${tenantInstance?.financialStrength}">
				<li class="fieldcontain">
					<span id="financialStrength-label" class="property-label"><g:message code="tenant.financialStrength.label" default="Financial Strength" /></span>
					
						<span class="property-value" aria-labelledby="financialStrength-label"><g:fieldValue bean="${tenantInstance}" field="financialStrength"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tenantInstance?.incidents}">
				<li class="fieldcontain">
					<span id="incidents-label" class="property-label"><g:message code="tenant.incidents.label" default="Incidents" /></span>
					
						<g:each in="${tenantInstance.incidents}" var="i">
						<span class="property-value" aria-labelledby="incidents-label"><g:link controller="incident" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${tenantInstance?.rating}">
				<li class="fieldcontain">
					<span id="rating-label" class="property-label"><g:message code="tenant.rating.label" default="Rating" /></span>
					
						<span class="property-value" aria-labelledby="rating-label"><g:fieldValue bean="${tenantInstance}" field="rating"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tenantInstance?.id}" />
					<g:link class="edit" action="edit" id="${tenantInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
