
<%@ page import="de.ospu.fdup.testimonial.QuestionnaireQuestion" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'questionnaireQuestion.label', default: 'QuestionnaireQuestion')}" />
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
						
							<th class="header"><g:message code="questionnaireQuestion.answer.label" default="Answer" /></th>
						
							<g:sortableColumn property="end" title="${message(code: 'questionnaireQuestion.end.label', default: 'End')}" />
						
							<th class="header"><g:message code="questionnaireQuestion.question.label" default="Question" /></th>
						
							<th class="header"><g:message code="questionnaireQuestion.questionnaire.label" default="Questionnaire" /></th>
						
							<g:sortableColumn property="start" title="${message(code: 'questionnaireQuestion.start.label', default: 'Start')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${questionnaireQuestionInstanceList}" var="questionnaireQuestionInstance">
						<tr>
						
							<td>${fieldValue(bean: questionnaireQuestionInstance, field: "answer")}</td>
						
							<td><g:formatDate date="${questionnaireQuestionInstance.end}" /></td>
						
							<td>${fieldValue(bean: questionnaireQuestionInstance, field: "question")}</td>
						
							<td>${fieldValue(bean: questionnaireQuestionInstance, field: "questionnaire")}</td>
						
							<td><g:formatDate date="${questionnaireQuestionInstance.start}" /></td>
						
							<td class="link">
								<g:link action="show" id="${questionnaireQuestionInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${questionnaireQuestionInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
