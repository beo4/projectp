
<%@ page import="projectp.asset.Asset" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'asset.label', default: 'Asset')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li class="active">
							<g:link class="list" action="list">
								<i class="icon-list icon-white"></i>
								<g:message code="default.list.label" args="[entityName]" />
							</g:link>
						</li>
						<li>
							<g:link class="create" action="create">
								<i class="icon-plus"></i>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>

			<div class="span9">
				
				<div class="page-header">
					<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
						
							<g:sortableColumn property="name" title="${message(code: 'asset.name.label', default: 'Name')}" />
						
							<th class="header"><g:message code="asset.belongingAsset.label" default="Belonging Asset" /></th>
						
							<g:sortableColumn property="latestValuation" title="${message(code: 'asset.latestValuation.label', default: 'Latest Valuation')}" />
						
							<g:sortableColumn property="location" title="${message(code: 'asset.location.label', default: 'Location')}" />
						
							<g:sortableColumn property="occupancy" title="${message(code: 'asset.occupancy.label', default: 'Occupancy')}" />
						
							<g:sortableColumn property="rentReviewData" title="${message(code: 'asset.rentReviewData.label', default: 'Rent Review Data')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${assetInstanceList}" var="assetInstance">
						<tr>
						
							<td>${fieldValue(bean: assetInstance, field: "name")}</td>
						
							<td>${fieldValue(bean: assetInstance, field: "belongingAsset")}</td>
						
							<td>${fieldValue(bean: assetInstance, field: "latestValuation")}</td>
						
							<td>${fieldValue(bean: assetInstance, field: "location")}</td>
						
							<td>${fieldValue(bean: assetInstance, field: "occupancy")}</td>
						
							<td>${fieldValue(bean: assetInstance, field: "rentReviewData")}</td>
						
							<td class="link">
								<g:link action="show" id="${assetInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${assetInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
