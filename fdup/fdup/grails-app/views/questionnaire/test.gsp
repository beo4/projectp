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
				    	
						<g:formRemote class="form-horizontal sl-slide" name="${questionnaireQuestion?.id}"
						url="[action: 'editAjax', controller: 'QuestionnaireQuestion']"
						onSuccess="jQuery( '#sl-slider' ).slitslider('_navigate','in')" onFailure="alert('Fehler!')" >
					    	<fieldset>
					    	<g:hiddenField name="id" value="${questionnaireQuestion?.id}"/>
					        <div class="sl-deco" data-icon="${i+1}"></div>
					        <h2>${questionnaireQuestion?.question?.question}</h2>
					        <blockquote>
					        	

								
								<f:field bean="${questionnaireQuestion }" property="answer" />
								
					        </blockquote>

								<nav>
									<g:if test="${i != questionnaireInstance?.questionnaireQuestions.size()-1}">
									<button type="submit" class="sl-next btn btn-success" id="name="${questionnaireQuestion?.id}"">
										<i class="icon-ok icon-white"></i> <g:message
											code="questionnaire.test.save.nextquestion"
											default="Save and next" />
										</button>
									</g:if>
									<g:else>
									<g:hiddenField name="last" value="true"/>
									<button type="submit" class="sl-next btn btn-success" id="name="${questionnaireQuestion?.id}"">
										<i class="icon-ok icon-white"></i> <g:message
											code="questionnaire.test.save.finishquestion"
											default="Save and exit" />
										</button>
									</g:else>
								</nav>
								
							</fieldset>
							</g:formRemote>
				        	
				    
				     </g:each>
					
					<div class="sl-slide">
				        <div class="sl-deco" data-icon="Ende"></div>
				        <h2>Danke!</h2>
				        <blockquote>
				            <p>Sie haben den Test beendet
				            </p>
				        </blockquote>
				    </div>
					 
				</section>

				<jq:jquery>
				$(function() {
				
					$( '#sl-slider' ).slitslider();
				
				});
				</jq:jquery>

			</div>

		</div>
	</body>
</html>
