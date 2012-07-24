<%@ page import="org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes" %>
<!doctype html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<title><g:layoutTitle default="${meta(name: 'app.name')}"/></title>
		<meta name="description" content=""/>
		<meta name="author" content=""/>

		<meta name="viewport" content="initial-scale = 1.0"/>

		<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

		<r:require modules="ospu"/>

		<!-- Le fav and touch icons -->
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}"/>
		<link rel="apple-touch-icon" sizes="72x72" href="${resource(dir: 'images', file: 'apple-touch-icon-72x72.png')}"/>
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-114x114.png')}"/>

		<g:layoutHead/>
		<r:layoutResources/>
	</head>

	<body>

		<nav class="navbar navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container-fluid">
					
					<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</a>
					
					<g:if test="${(questionnaireInstance && questionnaireInstance.start == questionnaireInstance.stop)}">
					<div class="nav-collapse">
						<ul class="nav">
							<li class="brand">F DUP</li>
							<li class="brand no-print">Prüfung gestartet</li>
							</ul>
						</div>
					</g:if>
					<g:else>
					<a class="brand" href="${createLink(uri: '/')}">F DUP</a>
					<div class="nav-collapse no-print">
						<ul class="nav">
							<li<%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>><a href="${createLink(uri: '/')}">Home</a></li>
							<sec:ifAllGranted roles="ROLE_ADMIN">
							<li<%= 'questionnaire' == controllerName ? ' class="active"' : '' %>><g:link controller="questionnaire">Fragebogen</g:link></li>
							<li<%= 'area' == controllerName ? ' class="active"' : '' %>><g:link controller="area">Bereich</g:link></li>
							<li<%= 'question' == controllerName ? ' class="active"' : '' %>><g:link controller="question">Fragen</g:link></li>
							<li<%= 'answer' == controllerName ? ' class="active"' : '' %>><g:link controller="answer">Antworten</g:link></li>
							<li<%= 'examinee' == controllerName ? ' class="active"' : '' %>><g:link controller="examinee">Benutzerverwaltung</g:link></li>
							</sec:ifAllGranted>
							
							<sec:ifNotLoggedIn>
							  <li><g:link controller="login" action="auth">Login</g:link></li>
							</sec:ifNotLoggedIn>
							<sec:ifLoggedIn>
							  <g:set var="fullName" value="${sec.loggedInUserInfo(field:"username")}" />
							  <g:set var="id" value="${sec.loggedInUserInfo(field:"id")}" />

							  
							  <li><g:link controller="questionnaire" action="test" params="[userId: id]">Start Test</g:link></li>
							  <li><g:link controller="logout">${fullName} (sign out)</g:link></li>
							</sec:ifLoggedIn>
						</ul>
					</div>
					</g:else>
				</div>
			</div>
		</nav>

		<div class="container-fluid">
			<g:layoutBody/>

			<hr>

			<footer>
				<p>&copy; OSPU GmbH 2012</p>
			</footer>
		</div>

		<r:layoutResources/>

	</body>
</html>