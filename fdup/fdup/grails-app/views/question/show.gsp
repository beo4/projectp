
<%@ page import="de.ospu.fdup.testimonial.Question" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
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
				
					<g:if test="${questionInstance?.area}">
						<dt><g:message code="question.area.label" default="Area" /></dt>
						
							<dd><g:link controller="area" action="show" id="${questionInstance?.area?.id}">${questionInstance?.area?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${questionInstance?.name}">
						<dt><g:message code="question.name.label" default="Name" /></dt>
						
							<dd><g:fieldValue bean="${questionInstance}" field="name"/></dd>
						
					</g:if>
				
					<g:if test="${questionInstance?.question}">
						<dt><g:message code="question.question.label" default="Question" /></dt>
						
							<dd><g:fieldValue bean="${questionInstance}" field="question"/></dd>
						
					</g:if>
					
						
					<f:field bean="questionInstance" property="answers" name="myAnswer"/>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${questionInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${questionInstance?.id}">
							<i class="icon-pencil"></i>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						
						<button class="btn btn-danger" type="submit" name="_action_delete">
							<i class="icon-trash icon-white"></i>
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
					</div>
				</g:form>
				<bootstrap:prompt url="[controller:'answer', action:'createAjax']" createId="${ questionInstance.id }" name="myAnswer" on404="alert('not found!')" />
				<g:javascript>
				var link = '<%= createLink(action:'show',controller:'answer')%>/';
					function addAnswer(response) {
						jQuery("#answer ul").append(
						jQuery('<li>').append(jQuery('<a>').prop('href', link + response.id).append(
					            response.text))
					);
					}
				</g:javascript>
			</div>

		</div>
	</body>
</html>
