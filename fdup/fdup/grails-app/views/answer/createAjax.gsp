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
			<g:formRemote class="form-horizontal" action="createAjax" url="[controller: 'answer', action: 'createAjax']" name="answerFor${answerInstance?.question?.id}" onSuccess="addAnswer(data)">
				<fieldset>
					<f:field bean="answerInstance" property="text"/>
					<f:field bean="answerInstance" property="points"/>
					<g:hiddenField name="question.id" value="${answerInstance?.question?.id}"/>
				</fieldset>
			</g:formRemote>
		</fieldset>

	</div>

</div>
