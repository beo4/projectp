<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap"/>
		<title>OSPU F-DUP</title>
	</head>

	<body>
		<div class="row-fluid">
			<aside id="application-status" class="span3">
				<div class="well sidebar-nav">
				<ospu:logo/>
				<sec:ifAnyGranted roles="ADMIN_ROLE" >
					<h5>Application Status</h5>
					<ul>
						<li>App version: <g:meta name="app.version"/></li>
						<li>Grails version: <g:meta name="app.grails.version"/></li>
						<li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
						<li>JVM version: ${System.getProperty('java.version')}</li>
						<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
						<li>Domains: ${grailsApplication.domainClasses.size()}</li>
						<li>Services: ${grailsApplication.serviceClasses.size()}</li>
						<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
					</ul>
					<h5>Installed Plugins</h5>
					<ul>
						<g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
							<li>${plugin.name} - ${plugin.version}</li>
						</g:each>
					</ul>
					</sec:ifAnyGranted>
				</div>
			</aside>

			<section id="main" class="span9">

				<div class="hero-unit">
					<h1>Fragebogen zur Diagnose unternehmerischer Potenziale (F-DUP)</h1>
					
					
				</div>
					
				<div class="row-fluid">
					
					<div class="span4">
					<sec:ifAnyGranted roles="ADMIN_ROLE">
						<h2>All Controller</h2>
						<p>This demo app includes a couple of controllers to show off its features.</p>
						<ul class="nav nav-list">
							<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
								<li><g:link controller="${c.logicalPropertyName}">${c.naturalName}</g:link></li>
							</g:each>
						</ul>
					</sec:ifAnyGranted>
						<h2>Was wollen wir?</h2>
						<p>Ziele Text.</p>
					</div>

					<div class="span4">
						<h2>Wer sind wir?</h2>
						
					</div>
					
					<div class="span4">
						<h2>Wer sind sie?</h2>
					</div>

				</div>

			</section>
		</div>
	</body>
</html>
