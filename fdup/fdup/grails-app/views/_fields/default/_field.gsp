<%@ page defaultCodec="html" %>
<div class="control-group ${invalid ? 'error' : ''}">
	<label class="control-label" for="${property}">${label}</label>
	<g:if test="${name}">
		<div class="controls" id="${name}">
	</g:if>
	<g:else>
	<div class="controls">
	</g:else>
		<%= widget %>
		<g:if test="${invalid}"><span class="help-inline">${errors.join('<br>')}</span></g:if>
	</div>
</div>