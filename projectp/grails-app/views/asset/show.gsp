
<%@ page import="projectp.asset.Asset" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'asset.label', default: 'Asset')}" />
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
				
					<g:if test="${assetInstance?.name}">
						<dt><g:message code="asset.name.label" default="Name" /></dt>
						
							<dd><g:fieldValue bean="${assetInstance}" field="name"/></dd>
						
					</g:if>
				
					<g:if test="${assetInstance?.belongingAsset}">
						<dt><g:message code="asset.belongingAsset.label" default="Belonging Asset" /></dt>
						
							<dd><g:link controller="asset" action="show" id="${assetInstance?.belongingAsset?.id}">${assetInstance?.belongingAsset?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${assetInstance?.activities}">
						<dt><g:message code="asset.activities.label" default="Activities" /></dt>
						
							<g:each in="${assetInstance.activities}" var="a">
							<dd><g:link controller="activity" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></dd>
							</g:each>
						
					</g:if>
				
					<g:if test="${assetInstance?.events}">
						<dt><g:message code="asset.events.label" default="Events" /></dt>
						
							<g:each in="${assetInstance.events}" var="e">
							<dd><g:link controller="event" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></dd>
							</g:each>
						
					</g:if>
				
					<g:if test="${assetInstance?.latestValuation}">
						<dt><g:message code="asset.latestValuation.label" default="Latest Valuation" /></dt>
						
							<dd><g:fieldValue bean="${assetInstance}" field="latestValuation"/></dd>
						
					</g:if>
				
					<g:if test="${assetInstance?.location}">
						<dt><g:message code="asset.location.label" default="Location" /></dt>
						
							<dd><g:fieldValue bean="${assetInstance}" field="location"/></dd>
						
					</g:if>
				
					<g:if test="${assetInstance?.occupancy}">
						<dt><g:message code="asset.occupancy.label" default="Occupancy" /></dt>
						
							<dd><g:fieldValue bean="${assetInstance}" field="occupancy"/></dd>
						
					</g:if>
				
					<g:if test="${assetInstance?.rentReviewData}">
						<dt><g:message code="asset.rentReviewData.label" default="Rent Review Data" /></dt>
						
							<dd><g:fieldValue bean="${assetInstance}" field="rentReviewData"/></dd>
						
					</g:if>
				
					<g:if test="${assetInstance?.subAssets}">
						<dt><g:message code="asset.subAssets.label" default="Sub Assets" /></dt>
						
							<g:each in="${assetInstance.subAssets}" var="s">
							<dd><g:link controller="asset" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></dd>
							</g:each>
						
					</g:if>
				
					<g:if test="${assetInstance?.yield}">
						<dt><g:message code="asset.yield.label" default="Yield" /></dt>
						
							<dd><g:fieldValue bean="${assetInstance}" field="yield"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${assetInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${assetInstance?.id}">
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
