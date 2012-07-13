<%@ page defaultCodec="html"%>

<g:formRemote action="sort" url="[action: 'sort']"
	name="sortFor${bean.id}" update="ordering" class="form-inline">
	<g:hiddenField name="id" value="${bean.id}" />
	<span class="control-group ${invalid ? 'error' : ''}"> 
		<%= widget %>
		<g:if test="${invalid}"><span class="help-inline">${errors.join('<br>')}</span>
		</g:if>
	</span>
	<button type="submit" class="btn btn-primary">
		<i class="icon-pencil icon-white"></i>
		<g:message code="default.button.update.label" default="Create" />
	</button>
</g:formRemote>