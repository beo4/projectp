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
				</div>
			</aside>

			<section id="main" class="span9">

				<div class="hero-unit">
					<h1>OSPU</h1>
					<h2>Fragebogen zur Diagnose unternehmerischer Potenziale (F-DUPN)</h2>
					
					
				</div>
					
				<div class="row-fluid">
					
					<div class="span4">
						<h2>Try It</h2>
						<p>This demo app includes a couple of controllers to show off its features.</p>
						<ul class="nav nav-list">
							<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
								<li><g:link controller="${c.logicalPropertyName}">${c.naturalName}</g:link></li>
							</g:each>
						</ul>
					</div>

					<div class="span4">
						<h2>Wie gehts</h2>
						
					</div>
					
					<div class="span4">
						<h2>Letzte Meldung</h2>
					</div>

				</div>

			</section>
		</div>
	</body>
</html>
