
<%@ page import="de.ospu.fdup.testimonial.QuestionnaireQuestion" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'questionnaireQuestion.label', default: 'QuestionnaireQuestion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li>
							<g:link class="list" action="list">
								<i class="icon-list"></i>
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
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<dl>
				
					<g:if test="${questionnaireQuestionInstance?.answer}">
						<dt><g:message code="questionnaireQuestion.answer.label" default="Answer" /></dt>
						
							<dd><g:link controller="answer" action="show" id="${questionnaireQuestionInstance?.answer?.id}">${questionnaireQuestionInstance?.answer?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${questionnaireQuestionInstance?.end}">
						<dt><g:message code="questionnaireQuestion.end.label" default="End" /></dt>
						
							<dd><g:formatDate date="${questionnaireQuestionInstance?.end}" /></dd>
						
					</g:if>
				
					<g:if test="${questionnaireQuestionInstance?.question}">
						<dt><g:message code="questionnaireQuestion.question.label" default="Question" /></dt>
						
							<dd><g:link controller="question" action="show" id="${questionnaireQuestionInstance?.question?.id}">${questionnaireQuestionInstance?.question?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${questionnaireQuestionInstance?.questionnaire}">
						<dt><g:message code="questionnaireQuestion.questionnaire.label" default="Questionnaire" /></dt>
						
							<dd><g:link controller="questionnaire" action="show" id="${questionnaireQuestionInstance?.questionnaire?.id}">${questionnaireQuestionInstance?.questionnaire?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${questionnaireQuestionInstance?.start}">
						<dt><g:message code="questionnaireQuestion.start.label" default="Start" /></dt>
						
							<dd><g:formatDate date="${questionnaireQuestionInstance?.start}" /></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${questionnaireQuestionInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${questionnaireQuestionInstance?.id}">
							<i class="icon-pencil"></i>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-danger" type="submit" name="_action_delete">
							<i class="icon-trash icon-white"></i>
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
					</div>
				</g:form>

			</div>

		</div>
	</body>
</html>
