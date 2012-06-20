<%@ page import="projektp.asset.AssetUnit" %>



<div class="fieldcontain ${hasErrors(bean: assetUnitInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="assetUnit.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="name" cols="40" rows="5" maxlength="255" required="" value="${assetUnitInstance?.name}"/>
</div>

