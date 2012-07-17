<%@ page import="de.ospu.fdup.testimonial.Questionnaire" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'questionnaire.label', default: 'Questionnaire')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'testemonial.css')}" type="text/css">
		<g:javascript library="slitslider"/>

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
					<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<g:hasErrors bean="${questionnaireInstance}">
				<bootstrap:alert class="alert-error">
				<ul>
					<g:eachError bean="${questionnaireInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</bootstrap:alert>
				</g:hasErrors>
				
				<section id="sl-slider" class="sl-slider">
				    <g:each in="${questionnaireInstance?.questionnaireQuestions}" var="questionnaireQuestion" status="i">
				    <div class="sl-slide">
				    	<fieldset>
						<g:formRemote class="form-horizontal" name="${questionnaireQuestion?.id}" 
						url="[action: 'editAjax', controller: 'QuestionnaireQuestion']"
						onSuccess="jQuery( '#sl-slider' ).slitslider()._navigate( 'in' );" onFailure="alert('Fehler!')" >
					    	<g:hiddenField name="id" value="${questionnaireQuestion?.id}"/>
					        <div class="sl-deco" data-icon="${questionnaireQuestion?.id}"></div>
					        <h2>${questionnaireQuestion?.question?.question}</h2>
					        <blockquote>
								<ul>
									<g:radioGroup value="${(questionnaireQuestion.answer)?questionnaireQuestion.answer.id : "" }" values="${questionnaireQuestion.question.answers.id}"  labels="${questionnaireQuestion.question.answers.text}" name="answer.id">
										<li><span>${it.radio}</span><g:message code="${it.label}" /></li>
									</g:radioGroup>
								</ul>
								
					        </blockquote>
					        
				        </g:formRemote>
				        <nav>
				<g:if test="${i != 0}"> <span class="sl-prev btn btn-danger"><i class="icon-chevron-left icon-white"></i>Previous</span> </g:if>
				<span class="sl-next btn btn-success" id="name="${questionnaireQuestion?.id}"">
									<i class="icon-ok icon-white"></i>
									<g:message code="questionnaire.test.save.nextquestion" default="Save and next" />
				</button>
				</nav>
				    </div>
				    
				     </g:each>
				
				</section>

				<jq:jquery>
				$(function() {
				
					$( '#sl-slider' ).slitslider();
				
				});
				</jq:jquery>

				<fieldset>
					<g:form class="form-horizontal" action="test" id="${questionnaireInstance?.id}" >
						<g:hiddenField name="version" value="${questionnaireInstance?.version}" />
						<fieldset>
							<g:hiddenField name="examinee.id" value="${questionnaireInstance?.examinee?.id}"/>
							
							<g:each in="${questionnaireInstance?.questionnaireQuestions}" var="questionnaireQuestions">
							<div>
								${questionnaireQuestions.question.question}
								<ul>
								<g:radioGroup value="${(questionnaireQuestions.answer)?questionnaireQuestions.answer.id : "" }" values="${questionnaireQuestions.question.answers.id}"  labels="${questionnaireQuestions.question.answers.text}" name="${questionnaireQuestions?.id}">
									<li><span>${it.radio}</span><g:message code="${it.label}" /></li>
								</g:radioGroup>
								</ul>
							</div>
							</g:each>
							
							<div class="form-actions">
								<button type="submit" class="btn btn-primary">
									<i class="icon-ok icon-white"></i>
									<g:message code="default.button.update.label" default="Update" />
								</button>
								<button type="submit" class="btn btn-danger" name="_action_delete" formnovalidate>
									<i class="icon-trash icon-white"></i>
									<g:message code="default.button.delete.label" default="Delete" />
								</button>
							</div>
						</fieldset>
					</g:form>
				</fieldset>

			</div>

		</div>
	</body>
</html>
