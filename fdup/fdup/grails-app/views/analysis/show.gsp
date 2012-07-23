
<%@ page import="de.ospu.fdup.testimonial.Analysis" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'analysis.label', default: 'Analysis')}" />
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
				
					<g:if test="${analysisInstance?.text}">
						<dt><g:message code="analysis.text.label" default="Text" /></dt>
						
							<dd><g:fieldValue bean="${analysisInstance}" field="text"/></dd>
						
					</g:if>
				
					<g:if test="${analysisInstance?.area}">
						<dt><g:message code="analysis.area.label" default="Area" /></dt>
						
							<dd><g:link controller="area" action="show" id="${analysisInstance?.area?.id}">${analysisInstance?.area?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${analysisInstance?.active}">
						<dt><g:message code="analysis.active.label" default="Active" /></dt>
						
							<dd><g:formatBoolean boolean="${analysisInstance?.active}" /></dd>
						
					</g:if>
				
					<g:if test="${analysisInstance?.pointsFrom}">
						<dt><g:message code="analysis.pointsFrom.label" default="Points From" /></dt>
						
							<dd><g:fieldValue bean="${analysisInstance}" field="pointsFrom"/></dd>
						
					</g:if>
				
					<g:if test="${analysisInstance?.pointsTill}">
						<dt><g:message code="analysis.pointsTill.label" default="Points Till" /></dt>
						
							<dd><g:fieldValue bean="${analysisInstance}" field="pointsTill"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${analysisInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${analysisInstance?.id}">
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
