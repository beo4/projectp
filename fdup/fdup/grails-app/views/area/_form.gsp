<%@ page import="de.ospu.fdup.testimonial.Area" %>



<div class="fieldcontain ${hasErrors(bean: areaInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="area.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${areaInstance?.name}"/>
</div>

