
<%@ page import="projektp.asset.Asset" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'asset.label', default: 'Asset')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-asset" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-asset" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list asset">
			
				<g:if test="${assetInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="asset.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${assetInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assetInstance?.latestValuation}">
				<li class="fieldcontain">
					<span id="latestValuation-label" class="property-label"><g:message code="asset.latestValuation.label" default="Latest Valuation" /></span>
					
						<span class="property-value" aria-labelledby="latestValuation-label"><g:fieldValue bean="${assetInstance}" field="latestValuation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assetInstance?.location}">
				<li class="fieldcontain">
					<span id="location-label" class="property-label"><g:message code="asset.location.label" default="Location" /></span>
					
						<span class="property-value" aria-labelledby="location-label"><g:fieldValue bean="${assetInstance}" field="location"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assetInstance?.occupancy}">
				<li class="fieldcontain">
					<span id="occupancy-label" class="property-label"><g:message code="asset.occupancy.label" default="Occupancy" /></span>
					
						<span class="property-value" aria-labelledby="occupancy-label"><g:fieldValue bean="${assetInstance}" field="occupancy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assetInstance?.rentReviewData}">
				<li class="fieldcontain">
					<span id="rentReviewData-label" class="property-label"><g:message code="asset.rentReviewData.label" default="Rent Review Data" /></span>
					
						<span class="property-value" aria-labelledby="rentReviewData-label"><g:fieldValue bean="${assetInstance}" field="rentReviewData"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assetInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="asset.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:link controller="assetType" action="show" id="${assetInstance?.type?.id}">${assetInstance?.type?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${assetInstance?.units}">
				<li class="fieldcontain">
					<span id="units-label" class="property-label"><g:message code="asset.units.label" default="Units" /></span>
					
						<g:each in="${assetInstance.units}" var="u">
						<span class="property-value" aria-labelledby="units-label"><g:link controller="assetUnit" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${assetInstance?.yield}">
				<li class="fieldcontain">
					<span id="yield-label" class="property-label"><g:message code="asset.yield.label" default="Yield" /></span>
					
						<span class="property-value" aria-labelledby="yield-label"><g:fieldValue bean="${assetInstance}" field="yield"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${assetInstance?.id}" />
					<g:link class="edit" action="edit" id="${assetInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
