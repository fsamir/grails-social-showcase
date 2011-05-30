<html>
<head>
    <title>Grails Social Showcase: Connected to Twitter</title>
    <meta name='layout' content='main' />
</head>
<body>
<h1>Connected to Twitter</h1>

<form action="${createLink(controller: 'connect', params: [providerId: 'twitter'])}" id="disconnect" method="post">
    <input type="hidden" name="_method" value="delete"/>
    <div class="formInfo">
        <p>The Grails Social Showcase sample application is already connected to your Twitter account.
        Click the button if you wish to disconnect.
    </div>

    <button type="submit">Disconnect</button>
</form>

<p><g:link controller="home">Return to home page</g:link></p>

</body>
</html>
