
<%@ page import="de.ospu.fdup.examinee.Examinee" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'examinee.label', default: 'Examinee')}" />
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
				
					<g:if test="${examineeInstance?.email}">
						<dt><g:message code="examinee.email.label" default="Email" /></dt>
						
							<dd><g:fieldValue bean="${examineeInstance}" field="email"/></dd>
						
					</g:if>
				
					<g:if test="${examineeInstance?.questionnaires}">
						<dt><g:message code="examinee.questionnaires.label" default="Questionnaires" /></dt>
						
							<g:each in="${examineeInstance.questionnaires}" var="q">
							<dd><g:link controller="questionnaire" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></dd>
							</g:each>
						
					</g:if>
				
					<g:if test="${examineeInstance?.realname}">
						<dt><g:message code="examinee.realname.label" default="Realname" /></dt>
						
							<dd><g:fieldValue bean="${examineeInstance}" field="realname"/></dd>
						
					</g:if>
				
					<g:if test="${examineeInstance?.surname}">
						<dt><g:message code="examinee.surname.label" default="Surname" /></dt>
						
							<dd><g:fieldValue bean="${examineeInstance}" field="surname"/></dd>
						
					</g:if>
				
					<g:if test="${examineeInstance?.zipcode}">
						<dt><g:message code="examinee.zipcode.label" default="Zipcode" /></dt>
						
							<dd><g:fieldValue bean="${examineeInstance}" field="zipcode"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${examineeInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${examineeInstance?.id}">
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
