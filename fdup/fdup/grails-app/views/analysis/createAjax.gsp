<%@ page import="de.ospu.fdup.testimonial.Analysis" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'analysis.label', default: 'Analysis')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span12">

				<div class="page-header">
					<h1><g:message code="default.create.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<g:hasErrors bean="${analysisInstance}">
				<bootstrap:alert class="alert-error">
				<ul>
					<g:eachError bean="${analysisInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</bootstrap:alert>
				</g:hasErrors>

				<fieldset>
					<g:formRemote class="form-horizontal" action="create" url="[controller: 'analysis', action: 'createAjax']" name="myAnalysis${analysisInstance?.area?.id}" onSuccess="addAnalysis(data)">
						<fieldset>
							<g:hiddenField name="area.id" value="${analysisInstance?.area?.id}" />
							<g:hiddenField name="active" value="true"/>
							<f:field bean="analysisInstance" property="pointsFrom" />
							<f:field bean="analysisInstance" property="pointsTill" />
							<f:field bean="analysisInstance" property="text"/>
						</fieldset>
					</g:formRemote>
				</fieldset>
				
			</div>

		</div>
	</body>
</html>
