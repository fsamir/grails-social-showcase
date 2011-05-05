<html>
<head>
	<title>Grails Social Showcase by Foldders.com: Connect to Twitter</title>
</head>
<body>
<h1>Grails Social Showcase by Foldders.com: Connect to Twitter</h1>

<form  action="${createLink(controller:'connect', params:[providerId:'twitter'])}" method="post">
	<div class="formInfo">
		<p>You haven't created any connections with Twitter yet. Click the button to connect Grails Social Showcase by Foldders.com with your Twitter account.
		(You'll be redirected to Twitter where you'll be asked to authorize the connection.)</p>
	</div>
    <p><button type="submit"><img src="${createLinkTo(dir: 'images/social/twitter', file: 'connect-with-twitter.png')}" /></button></p>
	<label for="postTweet"><g:checkBox id="postTweet" name="${grailsApplication.config.twitter.postTweetFlag}"  /> Post a tweet about connecting with Grails Social Showcase by Foldders.com</label>
</form>


</body>
</html>
