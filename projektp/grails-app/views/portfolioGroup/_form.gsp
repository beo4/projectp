<%@ page import="projektp.PortfolioGroup" %>



<div class="fieldcontain ${hasErrors(bean: portfolioGroupInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="portfolioGroup.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="name" cols="40" rows="5" maxlength="255" required="" value="${portfolioGroupInstance?.name}"/>
</div>

