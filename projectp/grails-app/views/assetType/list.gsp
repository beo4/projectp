
<%@ page import="projectp.asset.AssetType" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'assetType.label', default: 'AssetType')}" />
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
						
							<g:sortableColumn property="name" title="${message(code: 'assetType.name.label', default: 'Name')}" />
						
							<g:sortableColumn property="description" title="${message(code: 'assetType.description.label', default: 'Description')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${assetTypeInstanceList}" var="assetTypeInstance">
						<tr>
						
							<td>${fieldValue(bean: assetTypeInstance, field: "name")}</td>
						
							<td>${fieldValue(bean: assetTypeInstance, field: "description")}</td>
						
							<td class="link">
								<g:link action="show" id="${assetTypeInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${assetTypeInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
