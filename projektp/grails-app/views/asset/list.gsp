
<%@ page import="projektp.asset.Asset" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'asset.label', default: 'Asset')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-asset" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-asset" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'asset.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="latestValuation" title="${message(code: 'asset.latestValuation.label', default: 'Latest Valuation')}" />
					
						<g:sortableColumn property="location" title="${message(code: 'asset.location.label', default: 'Location')}" />
					
						<g:sortableColumn property="occupancy" title="${message(code: 'asset.occupancy.label', default: 'Occupancy')}" />
					
						<g:sortableColumn property="rentReviewData" title="${message(code: 'asset.rentReviewData.label', default: 'Rent Review Data')}" />
					
						<th><g:message code="asset.type.label" default="Type" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${assetInstanceList}" status="i" var="assetInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${assetInstance.id}">${fieldValue(bean: assetInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: assetInstance, field: "latestValuation")}</td>
					
						<td>${fieldValue(bean: assetInstance, field: "location")}</td>
					
						<td>${fieldValue(bean: assetInstance, field: "occupancy")}</td>
					
						<td>${fieldValue(bean: assetInstance, field: "rentReviewData")}</td>
					
						<td>${fieldValue(bean: assetInstance, field: "type")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${assetInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
