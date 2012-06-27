
<%@ page import="de.ospu.fdup.testimonial.Answer" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'answer.label', default: 'Answer')}" />
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
						
							<g:sortableColumn property="active" title="${message(code: 'answer.active.label', default: 'Active')}" />
						
							<g:sortableColumn property="points" title="${message(code: 'answer.points.label', default: 'Points')}" />
						
							<g:sortableColumn property="text" title="${message(code: 'answer.text.label', default: 'Text')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${answerInstanceList}" var="answerInstance">
						<tr>
						
							<td><g:formatBoolean boolean="${answerInstance.active}" /></td>
						
							<td>${fieldValue(bean: answerInstance, field: "points")}</td>
						
							<td>${fieldValue(bean: answerInstance, field: "text")}</td>
						
							<td class="link">
								<g:link action="show" id="${answerInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${answerInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
