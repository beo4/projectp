<%@ page defaultCodec="html" %>
<div class="control-group ${invalid ? 'error' : ''}">
	<label class="control-label" for="${property}">${label}</label>
	<g:if test="${name}">
		<div class="controls" id="${name}">
	</g:if>
	<g:else>
	<div class="controls">
	</g:else>
		<table>
			<thead>
				<tr>
					<td>
					Punktebereich
					</td>
					<td>
					Text
					</td>
				</tr>
			</thead>
			<tbody>
			<g:each in="${bean.getAt(property) }" var="analysis">
				<tr>
				<td>
					${analysis.pointsFrom } - ${analysis.pointsTill}
				</td>
				<td>
					${analysis.text }
				</td>
				</tr>
			</g:each>	
			</tbody>
		</table>
		<g:if test="${invalid}"><span class="help-inline">${errors.join('<br>')}</span></g:if>
	</div>
</div>