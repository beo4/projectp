
<%@ page import="de.ospu.fdup.testimonial.Area" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'area.label', default: 'Area')}" />
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
				
					<g:if test="${areaInstance?.name}">
						<dt><g:message code="area.name.label" default="Name" /></dt>
						
							<dd><g:fieldValue bean="${areaInstance}" field="name"/></dd>
						
					</g:if>
					<dt><g:message code="area.name.label" default="Name" /></dt>
					<dd><f:field bean="areaInstance" property="analysises" name="myAnalysis"/></dd>
				
				</dl>
				
				
				<g:form>
					<g:hiddenField name="id" value="${areaInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${areaInstance?.id}">
							<i class="icon-pencil"></i>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-danger" type="submit" name="_action_delete">
							<i class="icon-trash icon-white"></i>
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
					</div>
				</g:form>
				<bootstrap:prompt url="[controller:'analysis', action:'createAjax']" createId="${areaInstance.id}" name="myAnalysis" on404="alert('not found!')" />
				<g:javascript>
				var link = '<%= createLink(action:'show',controller:'analysis')%>/';
					function addAnalysis(response) {
						jQuery("#myAnalysis table tbody").append(
						jQuery('<tr>').append(jQuery('<td>').append(response.pointsFrom + ' - ' + response.pointsTill),jQuery('<td>').append(response.text))
					);
					}
				</g:javascript>
			</div>

		</div>
	</body>
</html>
