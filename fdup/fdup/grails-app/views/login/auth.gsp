<html>
<head>
<meta name='layout' content='bootstrap' />
<title><g:message code="springSecurity.login.title" /></title>
</head>

<body>
	<div class="row-fluid">



		<div class="span3">
			<div id='login' class="well">
				<div class='inner'>
					<div class='fheader'>
						<g:message code="springSecurity.login.header" />
					</div>

					<g:if test='${flash.message}'>
						<div class='login_message'>
							${flash.message}
						</div>
					</g:if>

					<form action='${postUrl}' method='POST' id='loginForm'
						class='cssform' autocomplete='off'>
							<label for='username'>
								<g:message code="springSecurity.login.username.label" />:</label> 
								<input type='text' class='text_' name='j_username' id='username' />
							<label for='password'><g:message
									code="springSecurity.login.password.label" />:</label> <input
								type='password' class='text_' name='j_password' id='password' />

						<label
								for='remember_me'><g:message
									code="springSecurity.login.remember.me.label" />
							<input type='checkbox' class='chk' name='${rememberMeParameter}'
								id='remember_me'
								<g:if test='${hasCookie}'>checked='checked'</g:if> /> </label>

							<input type='submit' id="submit"
								value='${message(code: "springSecurity.login.button")}' />
					</form>
				</div>
			</div>
			<script type='text/javascript'>
			<!--
				(function() {
					document.forms['loginForm'].elements['j_username'].focus();
				})();
			// -->
			</script>
		</div>
	</div>
</body>
</html>
