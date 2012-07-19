
<%@ page import="de.ospu.fdup.testimonial.Questionnaire" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'questionnaire.label', default: 'Questionnaire')}" />
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
						
							<g:sortableColumn property="start" title="${message(code: 'questionnaire.start.label', default: 'Start')}" />
						
							<g:sortableColumn property="stop" title="${message(code: 'questionnaire.stop.label', default: 'Stop')}" />
						
							<th class="header"><g:message code="questionnaire.examinee.label" default="Examinee" /></th>
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${questionnaireInstanceList}" var="questionnaireInstance">
						<tr>
						
							<td><g:formatDate date="${questionnaireInstance.start}" /></td>
						
							<td><g:formatDate date="${questionnaireInstance.stop}" /></td>
						
							<td>${fieldValue(bean: questionnaireInstance, field: "examinee")}</td>
						
							<td class="link">
								<g:link action="show" id="${questionnaireInstance.id}" class="btn btn-small">Show &raquo;</g:link>
								<g:pdfLink pdfAction="show" pdfController="questionnaire"  pdfId="${questionnaireInstance.id}" class="btn btn-small">PDF</g:pdfLink>
								<g:pdfLink url="/questionnaire/show/${questionnaireInstance.id}" class="btn btn-small">PDF2</g:pdfLink>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${questionnaireInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
