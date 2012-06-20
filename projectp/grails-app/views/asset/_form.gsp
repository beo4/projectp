<%@ page import="projectp.asset.Asset" %>



<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="asset.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="name" cols="40" rows="5" maxlength="255" required="" value="${assetInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'belongingAsset', 'error')} ">
	<label for="belongingAsset">
		<g:message code="asset.belongingAsset.label" default="Belonging Asset" />
		
	</label>
	<g:select id="belongingAsset" name="belongingAsset.id" from="${projectp.asset.Asset.list()}" optionKey="id" value="${assetInstance?.belongingAsset?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'activities', 'error')} ">
	<label for="activities">
		<g:message code="asset.activities.label" default="Activities" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${assetInstance?.activities?}" var="a">
    <li><g:link controller="activity" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="activity" action="create" params="['asset.id': assetInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'activity.label', default: 'Activity')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'events', 'error')} ">
	<label for="events">
		<g:message code="asset.events.label" default="Events" />
		
	</label>
	<g:select name="events" from="${projectp.event.Event.list()}" multiple="multiple" optionKey="id" size="5" value="${assetInstance?.events*.id}" class="many-to-many"/>
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

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'subAssets', 'error')} ">
	<label for="subAssets">
		<g:message code="asset.subAssets.label" default="Sub Assets" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${assetInstance?.subAssets?}" var="s">
    <li><g:link controller="asset" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="asset" action="create" params="['asset.id': assetInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'asset.label', default: 'Asset')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'yield', 'error')} ">
	<label for="yield">
		<g:message code="asset.yield.label" default="Yield" />
		
	</label>
	<g:textField name="yield" value="${assetInstance?.yield}"/>
</div>

