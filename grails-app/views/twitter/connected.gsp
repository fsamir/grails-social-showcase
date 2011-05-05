<html>
<head>
    <title>Grails Social Showcase by Foldders.com: Connected to Twitter</title>
</head>
<body>
<h1>Grails Social Showcase by Foldders.com: Connected to Twitter</h1>

<form action="${createLink(controller: 'connect', params: [providerId: 'twitter'])}" id="disconnect" method="post">
    <input type="hidden" name="_method" value="delete"/>
    <div class="formInfo">
        <p>The Grails Social Showcase by Foldders.com sample application is already connected to your Twitter account.
        Click the button if you wish to disconnect.
    </div>

    <button type="submit">Disconnect</button>
</form>

<p><g:link controller="home">Return to home page</g:link></p>

</body>
</html>
