<%@ page import="de.ospu.fdup.examinee.Examinee" %>



<div class="fieldcontain ${hasErrors(bean: examineeInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="examinee.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${examineeInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: examineeInstance, field: 'questionnaires', 'error')} ">
	<label for="questionnaires">
		<g:message code="examinee.questionnaires.label" default="Questionnaires" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${examineeInstance?.questionnaires?}" var="q">
    <li><g:link controller="questionnaire" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="questionnaire" action="create" params="['examinee.id': examineeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'questionnaire.label', default: 'Questionnaire')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: examineeInstance, field: 'realname', 'error')} ">
	<label for="realname">
		<g:message code="examinee.realname.label" default="Realname" />
		
	</label>
	<g:textField name="realname" value="${examineeInstance?.realname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: examineeInstance, field: 'surname', 'error')} ">
	<label for="surname">
		<g:message code="examinee.surname.label" default="Surname" />
		
	</label>
	<g:textField name="surname" value="${examineeInstance?.surname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: examineeInstance, field: 'userAccount', 'error')} required">
	<label for="userAccount">
		<g:message code="examinee.userAccount.label" default="User Account" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="userAccount" name="userAccount.id" from="${de.ospu.fdup.security.SecUser.list()}" optionKey="id" required="" value="${examineeInstance?.userAccount?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: examineeInstance, field: 'zipcode', 'error')} ">
	<label for="zipcode">
		<g:message code="examinee.zipcode.label" default="Zipcode" />
		
	</label>
	<g:textField name="zipcode" value="${examineeInstance?.zipcode}"/>
</div>

