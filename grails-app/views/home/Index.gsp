<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<title>Grails Social Showcase by Foldders</title>
    <meta name='layout' content='main' />
</head>
<body>
<h1>Grails Social Showcase by Foldders</h1>

<p>Welcome, <sec:username />!</p>
<g:link controller="logout">Sign Out</g:link>

<ul>
	<li><g:link controller="twitter">Twitter</g:link> (Connected? ${twitter_status})</li>
	<li><g:link controller="facebook">Facebook</g:link>(Connected? ${facebook_status})</li>
	<li><g:link controller="tripit">Tripit</g:link>(Connected? ${tripit_status})</li>
</ul>

</body>
</html>
