<%@ page import="projectp.util.Image" %>



<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'image', 'error')} required">
	<label for="image">
		<g:message code="image.image.label" default="Image" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="image" name="image" />
</div>

<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="image.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${imageInstance?.name}"/>
</div>

