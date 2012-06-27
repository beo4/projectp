
<%@ page import="de.ospu.fdup.examinee.Examinee" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'examinee.label', default: 'Examinee')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li class="active">
							<g:link class="list" action="list">
								<i class="icon-list icon-white"></i>
								<g:message code="default.list.label" args="[entityName]" />
							</g:link>
						</li>
						<li>
							<g:link class="create" action="create">
								<i class="icon-plus"></i>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>

			<div class="span9">
				
				<div class="page-header">
					<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
						
							<g:sortableColumn property="email" title="${message(code: 'examinee.email.label', default: 'Email')}" />
						
							<g:sortableColumn property="realname" title="${message(code: 'examinee.realname.label', default: 'Realname')}" />
						
							<g:sortableColumn property="surname" title="${message(code: 'examinee.surname.label', default: 'Surname')}" />
						
							<th class="header"><g:message code="examinee.userAccount.label" default="User Account" /></th>
						
							<g:sortableColumn property="zipcode" title="${message(code: 'examinee.zipcode.label', default: 'Zipcode')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${examineeInstanceList}" var="examineeInstance">
						<tr>
						
							<td>${fieldValue(bean: examineeInstance, field: "email")}</td>
						
							<td>${fieldValue(bean: examineeInstance, field: "realname")}</td>
						
							<td>${fieldValue(bean: examineeInstance, field: "surname")}</td>
						
							<td>${fieldValue(bean: examineeInstance, field: "userAccount")}</td>
						
							<td>${fieldValue(bean: examineeInstance, field: "zipcode")}</td>
						
							<td class="link">
								<g:link action="show" id="${examineeInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${examineeInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
