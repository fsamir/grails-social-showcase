<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page session="false" %>
<html>
<head>
	<title>Grails Social Showcase: Facebook</title>
    <meta name='layout' content='main' />
</head>
<body>
	<h1>Facebook</h1>

	<p>Hello, ${facebookUser.firstName} (<g:link controller="connect" params="[providerId:'facebook']">Disconnect from Facebook</g:link>)</p>
	
	<p>Your Facebook profile:</p>
	<dl>
		<dt>Facebook ID:</dt>
		<dd>${facebookUser.id}</dd>
		<dt>Name:</dt>
		<dd>${facebookUser.name}</dd>
		<dt>Email:</dt>
		<dd>${facebookUser.email}</dd>
	</dl>
	<hr/>
	<g:form method="POST" action="postToWall">
		<p>Post to your Facebook wall:<p>
		<textarea id="message" name="message" rows="5" cols="40"></textarea><br/>
		<input type="submit" value="Post" />
    </g:form>

</body>
</html>
