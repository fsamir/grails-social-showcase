<html>
<head>
	<title>Grails Social Showcase: Connect to TripIt</title>
</head>
<body>
<h1>Grails Social Showcase: Connect to TripIt</h1>

<form  action="${createLink(controller:'connect', params:[providerId:'tripit'])}" method="post">
	<div class="formInfo">
		<p>You haven't created any connections with TripIt yet. Click the button to connect Grails Social Showcase with your TripIt account.
		(You'll be redirected to TripIt where you'll be asked to authorize the connection.)</p>
	</div>
    <p><button type="submit">Connect to TripIt</button></p>
</form>


</body>
</html>
