
<%@ page import="de.ospu.fdup.testimonial.Analysis" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'analysis.label', default: 'Analysis')}" />
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
						
							<g:sortableColumn property="text" title="${message(code: 'analysis.text.label', default: 'Text')}" />
						
							<th class="header"><g:message code="analysis.area.label" default="Area" /></th>
						
							<g:sortableColumn property="active" title="${message(code: 'analysis.active.label', default: 'Active')}" />
						
							<g:sortableColumn property="pointsFrom" title="${message(code: 'analysis.pointsFrom.label', default: 'Points From')}" />
						
							<g:sortableColumn property="pointsTill" title="${message(code: 'analysis.pointsTill.label', default: 'Points Till')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${analysisInstanceList}" var="analysisInstance">
						<tr>
						
							<td>${fieldValue(bean: analysisInstance, field: "text")}</td>
						
							<td>${fieldValue(bean: analysisInstance, field: "area")}</td>
						
							<td><g:formatBoolean boolean="${analysisInstance.active}" /></td>
						
							<td>${fieldValue(bean: analysisInstance, field: "pointsFrom")}</td>
						
							<td>${fieldValue(bean: analysisInstance, field: "pointsTill")}</td>
						
							<td class="link">
								<g:link action="show" id="${analysisInstance.id}" class="btn btn-small">Show &raquo;</g:link>
								<g:link action="edit" id="${analysisInstance.id}" class="btn btn-small">Edit</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${analysisInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
