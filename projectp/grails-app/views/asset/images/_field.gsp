<%@ page defaultCodec="html" %>


<div class="control-group ${invalid ? 'error' : ''}">
	<label class="control-label" for="${property}">${label}</label>
	<div class="controls">
		<uploadr:add name="imageUploadr" path="tmp" maxVisible="5" controller="image" action="upload">
 
		</uploadr:add>
		<ul>
		<g:each in="${assetInstance?.images?}" var="s">
    	<li>
    	<img class="image" src="${createLink(controller:'image', action:'viewImage', id:"s.id")}" /></li>
		</g:each>
		</ul>
		
		
		<%= widget %>
		<g:if test="${invalid}"><span class="help-inline">${errors.join('<br>')}</span></g:if>
	</div>
</div>