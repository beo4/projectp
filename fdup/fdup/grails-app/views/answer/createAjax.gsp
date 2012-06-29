<%@ page import="de.ospu.fdup.testimonial.Answer"%>
<div class="row-fluid">

	<div class="span12">

		<div class="page-header">
			<h1>
				<g:message code="default.create.label" args="[entityName]" />
			</h1>
		</div>

		<g:if test="${flash.message}">
			<bootstrap:alert class="alert-info">
				${flash.message}
			</bootstrap:alert>
		</g:if>

		<g:hasErrors bean="${answerInstance}">
			<bootstrap:alert class="alert-error">
				<ul>
					<g:eachError bean="${answerInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</bootstrap:alert>
		</g:hasErrors>

		<fieldset>
			<g:form class="form-horizontal" action="create">
				<fieldset>
					<f:all bean="answerInstance" />
					<div class="form-actions">
						<button type="submit" class="btn btn-primary">
							<i class="icon-ok icon-white"></i>
							<g:message code="default.button.create.label" default="Create" />
						</button>
					</div>
				</fieldset>
			</g:form>
		</fieldset>

	</div>

</div>