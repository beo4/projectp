<%@ page import="projektp.asset.Asset" %>



<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="asset.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="name" cols="40" rows="5" maxlength="255" required="" value="${assetInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'latestValuation', 'error')} ">
	<label for="latestValuation">
		<g:message code="asset.latestValuation.label" default="Latest Valuation" />
		
	</label>
	<g:textField name="latestValuation" value="${assetInstance?.latestValuation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'location', 'error')} ">
	<label for="location">
		<g:message code="asset.location.label" default="Location" />
		
	</label>
	<g:textField name="location" value="${assetInstance?.location}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'occupancy', 'error')} ">
	<label for="occupancy">
		<g:message code="asset.occupancy.label" default="Occupancy" />
		
	</label>
	<g:textField name="occupancy" value="${assetInstance?.occupancy}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'rentReviewData', 'error')} ">
	<label for="rentReviewData">
		<g:message code="asset.rentReviewData.label" default="Rent Review Data" />
		
	</label>
	<g:textField name="rentReviewData" value="${assetInstance?.rentReviewData}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="asset.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="type" name="type.id" from="${projektp.asset.AssetType.list()}" optionKey="id" required="" value="${assetInstance?.type?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'units', 'error')} ">
	<label for="units">
		<g:message code="asset.units.label" default="Units" />
		
	</label>
	<g:select name="units" from="${projektp.asset.AssetUnit.list()}" multiple="multiple" optionKey="id" size="5" value="${assetInstance?.units*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'yield', 'error')} ">
	<label for="yield">
		<g:message code="asset.yield.label" default="Yield" />
		
	</label>
	<g:textField name="yield" value="${assetInstance?.yield}"/>
</div>

