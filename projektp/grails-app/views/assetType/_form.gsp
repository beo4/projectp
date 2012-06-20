<%@ page import="projektp.asset.AssetType" %>



<div class="fieldcontain ${hasErrors(bean: assetTypeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="assetType.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="name" cols="40" rows="5" maxlength="255" required="" value="${assetTypeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetTypeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="assetType.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${assetTypeInstance?.description}"/>
</div>

