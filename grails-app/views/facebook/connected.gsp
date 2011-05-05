<%@ taglib uri="http://www.springframework.org/spring-social/facebook/tags" prefix="facebook" %>

<html>
<head>
    <title>Grails Social Showcase by Foldders.com: Connected to Facebook</title>
    <meta name='layout' content='main' />
    <g:javascript library="jquery" plugin="jquery"/>
</head>
<body>
<h1>Connected to Facebook</h1>

<form action="${createLink(controller: 'connect', params: [providerId: 'facebook'])}" id="disconnect" method="post">
    <input type="hidden" name="_method" value="DELETE" id="_method"/>
    <div class="formInfo">
        <p>
            Grails Social Showcase by Foldders.com is connected to your Facebook account.
            Click the button if you wish to disconnect.
        </p>
    </div>
</form>
<button onclick="FB.logout(function() {$('#disconnect').submit()});">Disconnect</button>

<g:link controller="home">Return to home page</g:link>

<facebook:init appId="${grailsApplication.config.facebook.appId}"/>

</body>
</html>
