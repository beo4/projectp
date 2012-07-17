
<%@ page import="de.ospu.fdup.testimonial.Questionnaire" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'questionnaire.label', default: 'Questionnaire')}" />
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
			
				
					<g:if test="${questionnaireInstance?.start}">
						<dt><g:message code="questionnaire.start.label" default="Start" /></dt>
						
							<dd><g:formatDate date="${questionnaireInstance?.start}" /></dd>
						
					</g:if>
				
					<g:if test="${questionnaireInstance?.stop}">
						<dt><g:message code="questionnaire.stop.label" default="Stop" /></dt>
						
							<dd><g:formatDate date="${questionnaireInstance?.stop}" /></dd>
						
					</g:if>
				
					<g:if test="${questionnaireInstance?.examinee}">
						<dt><g:message code="questionnaire.examinee.label" default="Examinee" /></dt>
						
							<dd><g:link controller="examinee" action="show" id="${questionnaireInstance?.examinee?.id}">${questionnaireInstance?.examinee?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
					<g:set var="currentArea" value=""/>
					<g:if test="${questionnaireInstance?.questionnaireQuestions}">
						<dt><g:message code="questionnaire.questions.label" default="Questions" /></dt>
							<g:each in="${questionnaireInstance?.questionnaireQuestions}" var="q">
							<g:if test="${q.question.area != currentArea}">
								<g:set var="currentArea" value="${q.question.area}"/>
								${currentArea.encodeAsHTML()}
							</g:if>
							<dd>${q.question.encodeAsHTML()} -
							<g:if test="${q.answer }">
								${q.answer.encodeAsHTML() } - 
								${q.answer.points}
							</g:if>
							</dd>
							</g:each>
					</g:if>
					
					
					
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${questionnaireInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${questionnaireInstance?.id}">
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
