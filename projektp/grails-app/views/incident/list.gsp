
<%@ page import="projektp.tenant.Incident" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'incident.label', default: 'Incident')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-incident" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-incident" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'incident.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="ammount" title="${message(code: 'incident.ammount.label', default: 'Ammount')}" />
					
						<th><g:message code="incident.type.label" default="Type" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${incidentInstanceList}" status="i" var="incidentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${incidentInstance.id}">${fieldValue(bean: incidentInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: incidentInstance, field: "ammount")}</td>
					
						<td>${fieldValue(bean: incidentInstance, field: "type")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${incidentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
