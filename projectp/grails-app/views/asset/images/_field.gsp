<%@ page defaultCodec="html" %>
<div class="control-group ${invalid ? 'error' : ''}">
	<label class="control-label" for="${property}">${label}</label>
	<div class="controls">
		<uploader:uploader id="upload" url="${[controller:'Image', action:'upload']}" >
		  <uploader:onComplete>
		    $('statusDiv').update('Thank you for uploading the file '+fileName);  
		  </uploader:onComplete>
		</uploader:uploader>
		<%= widget %>
		<g:if test="${invalid}"><span class="help-inline">${errors.join('<br>')}</span></g:if>
	</div>
</div>