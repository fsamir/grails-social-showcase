<html>
<head>
	<title>Grails Social Showcase by Foldders.com: TripIt</title>
</head>
<body>
<h1>Grails Social Showcase by Foldders.com: TripIt</h1>

<p>Hello ${tripItUser.publicDisplayName} !</p>
<p>Your TripIt profile:</p>
<ul>
	<li>Screen name: ${tripItUser.screenName}</li>
	<li>Home city: ${tripItUser.homeCity}</li>
	<li>Company: ${tripItUser.company}</li>
</ul>

<p>Your upcoming trips:</p>
<ul>
<g:each in="${trips}" var="trip">
	<li>${trip.displayName} - Destination: ${trip.primaryLocation};
        <g:formatDate date="${trip.startDate}" dateStyle="full" /> to <g:formatDate date="${trip.endDate}" dateStyle="full" />
    </li>
</g:each>
</ul>

<form action="${createLink(controller: 'connect', params: [providerId: 'tripit'])}" id="disconnect" method="post">
    <button type="submit">Disconnect from Tripit</button>
    <input type="hidden" name="_method" value="delete"/>
</form>

</body>
</html>
