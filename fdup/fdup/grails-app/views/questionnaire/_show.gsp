<%@ page import="de.ospu.fdup.testimonial.Questionnaire" %>
<%@ page import="org.grails.plugins.google.visualization.formatter.BarFormatter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<meta name="layout" content="bootstrap"/>
		<g:set var="entityName" value="${message(code: 'questionnaire.label', default: 'Questionnaire')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
		
		<div class="span3">
				<div class="well">
					<g:img file="ospulogo_transparent.png"/>
				</div>
			</div>
			
			<div class="span9">

				<div class="page-header">
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				

				<dl>
			
				
					<g:if test="${questionnaireInstance?.start}">
						<dt><g:message code="questionnaire.start.label" default="Start" /></dt>
						
						<dd><g:formatDate date="${questionnaireInstance?.start}" /></dd>
						
					</g:if>
				
					<g:if test="${questionnaireInstance?.stop}">
						<dt><g:message code="questionnaire.stop.label" default="Stop" /></dt>
						
							<dd><g:formatDate date="${questionnaireInstance?.stop}" /></dd>
						
					</g:if>
				
					<g:if test="${questionnaireInstance?.examinee}">
						<dt><g:message code="questionnaire.examinee.label" default="Examinee" /></dt>
						
							<dd><g:link controller="examinee" action="show" id="${questionnaireInstance?.examinee?.id}">${questionnaireInstance?.examinee?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				</dl>
					<g:set var="pointsAchieved" value="${questionnaireInstance.questionnaireQuestions.sum{(it.answer)?it.answer.points:0}}"></g:set>
					<g:set var="pointsAvailable" value="${questionnaireInstance.questionnaireQuestions.sum{it.question.answers.points.max()}}"></g:set>
					<h2><g:message code="questionnaire.questions.pointsAchieved.all,label" default="Erreichte Punkte Gesamt"/></h2>
					
					<g:message code="questionnaire.questions.pointsAchieved.all" default="Erreichte Punkte" args="[pointsAchieved,pointsAvailable]" />
					<g:render template="/questionnaire/lineChart"/>
					<g:each in="${questionnaireAnalysis }" var="analysis">
					${analysis.text }
					</g:each>
					
				<dl>
					<g:each in="${resultMap.entrySet()}" var="areaEntry">
						<g:set var="area" value="${areaEntry.key}" />
						<g:set var="questionnaireQuestions" value="${areaEntry.value}" />
						<g:set var="pointsAchieved" value="${questionnaireQuestions.sum{(it.answer)?it.answer.points:0}}"></g:set>
						<g:set var="pointsAvailable" value="${questionnaireQuestions.sum{it.question.answers.points.max()}}"></g:set>
						<dt>${area}</dt>
						<dd><g:message code="questionnaire.questions.pointsAchieved" default="Erreichte Punkte" args="[pointsAchieved,pointsAvailable]" /></dd>
						<g:each in="${area.analysises }" var="analysis">
							<dd>${analysis.text }</dd>
						</g:each>
						<dd>
						<dl class="dl-horizontal">
						<dt><g:message code="questionnaire.questions.label" default="Questions" /></dt>
							<g:each in="${questionnaireQuestions}" var="q">
							
							<dd>${q.question.encodeAsHTML()}:
							<g:if test="${q.answer }">
								${q.answer.encodeAsHTML() } - 
								${q.answer.points}
							</g:if>
							</dd>
							
							</g:each>
						</dl>
						</dd>
					</g:each>
				</dl>
			</div>
		</div>
	</body>
</html>
