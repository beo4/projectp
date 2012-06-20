<%@ page import="projektp.Portfolio" %>



<div class="fieldcontain ${hasErrors(bean: portfolioInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="portfolio.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="name" cols="40" rows="5" maxlength="255" required="" value="${portfolioInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: portfolioInstance, field: 'assets', 'error')} ">
	<label for="assets">
		<g:message code="portfolio.assets.label" default="Assets" />
		
	</label>
	<g:select name="assets" from="${projektp.asset.Asset.list()}" multiple="multiple" optionKey="id" size="5" value="${portfolioInstance?.assets*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: portfolioInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="portfolio.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${portfolioInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: portfolioInstance, field: 'groups', 'error')} ">
	<label for="groups">
		<g:message code="portfolio.groups.label" default="Groups" />
		
	</label>
	<g:select name="groups" from="${projektp.PortfolioGroup.list()}" multiple="multiple" optionKey="id" size="5" value="${portfolioInstance?.groups*.id}" class="many-to-many"/>
</div>

