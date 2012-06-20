
<%@ page import="projektp.tenant.Tenant" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tenant.label', default: 'Tenant')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tenant" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tenant" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'tenant.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="financialStrength" title="${message(code: 'tenant.financialStrength.label', default: 'Financial Strength')}" />
					
						<g:sortableColumn property="rating" title="${message(code: 'tenant.rating.label', default: 'Rating')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tenantInstanceList}" status="i" var="tenantInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tenantInstance.id}">${fieldValue(bean: tenantInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: tenantInstance, field: "financialStrength")}</td>
					
						<td>${fieldValue(bean: tenantInstance, field: "rating")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tenantInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
