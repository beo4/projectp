
<%@ page import="projektp.tenant.Incident" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'incident.label', default: 'Incident')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-incident" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-incident" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list incident">
			
				<g:if test="${incidentInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="incident.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${incidentInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${incidentInstance?.ammount}">
				<li class="fieldcontain">
					<span id="ammount-label" class="property-label"><g:message code="incident.ammount.label" default="Ammount" /></span>
					
						<span class="property-value" aria-labelledby="ammount-label"><g:fieldValue bean="${incidentInstance}" field="ammount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${incidentInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="incident.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:link controller="incidentType" action="show" id="${incidentInstance?.type?.id}">${incidentInstance?.type?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${incidentInstance?.id}" />
					<g:link class="edit" action="edit" id="${incidentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
