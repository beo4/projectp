
<%@ page import="de.ospu.fdup.testimonial.Question" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
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
				
				<div class="tabbable">
				
					<ul class="nav nav-tabs">
					<g:set var="currentArea" value="${(areas.size()) ? areas.get(0).id : 0}"/>
					<g:each in="${areas}" var="area">
				    	<li <%= area.id == currentArea ? ' class="active"' : '' %>> <a href="#tab${area.id}" data-toggle="tab">${area.name}</a></li>
				    </g:each>
					</ul>
					<div class="tab-content">
					<g:each in="${areas}" var="area">
						<div class="tab-pane <%= area.id == currentArea ? ' active' : '' %>" id="tab${area.id}">
					 <g:set var="questionInstanceList" value="${area.questions}" />
					<table class="table table-striped">
					<thead>
						<tr>
						
							<th class="header"><g:message code="question.area.label" default="Area" /></th>
						
							<g:sortableColumn property="name" title="${message(code: 'question.name.label', default: 'Name')}" />
						
							<g:sortableColumn property="question" title="${message(code: 'question.question.label', default: 'Question')}" />
							
							<th class="header"><g:message code="question.area.count.answers" default="Anzahl Antworten" /></th>
							
							<g:sortableColumn property="ordering" title="${message(code: 'question.ordering.label', default: 'Reihenfolge')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${questionInstanceList}" var="questionInstance">
						<tr>
						
							<td>${fieldValue(bean: questionInstance, field: "area")}</td>
						
							<td>${fieldValue(bean: questionInstance, field: "name")}</td>
						
							<td>${fieldValue(bean: questionInstance, field: "question")}</td>
							
							<td>${questionInstance.answers.size()}</td>
							
							<td>
							<f:field bean="${questionInstance}" property="ordering"/>
							</td>
						
							<td class="link">
								<g:link action="show" id="${questionInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>


					    </div>
				    </g:each>
					</div>
				</div>
			</div>

		</div>
	</body>
</html>
