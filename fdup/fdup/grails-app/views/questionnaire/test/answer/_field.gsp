<%@ page defaultCodec="html" %>
<div class="control-group ${invalid ? 'error' : ''}">
	<g:if test="${name}">
		<div class="controls" id="${name}">
	</g:if>
	<g:else>
		<div class="controls">
	</g:else>
		<ul class="nav nav-list">
			
			<g:radioGroup value="${(bean.answer)?bean.answer.id : "" }"  values="${bean.question.answers.id}"  labels="${bean.question.answers.text}" name="answer.id">
				<li><label class="radio"><%=it.radio%><g:message code="${it.label}" /></label></li>
			</g:radioGroup>
		</ul>
		<g:if test="${invalid}"><span class="help-inline">${errors.join('<br>')}</span></g:if>
	</div>
	
</div>