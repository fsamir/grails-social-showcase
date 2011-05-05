<%@ taglib uri="http://www.springframework.org/spring-social/facebook/tags" prefix="facebook" %>

<html>
<head>
	<title>Grails Social Showcase by Foldders.com: Connect to Facebook</title>
	<g:javascript library="jquery" plugin="jquery"/>
    <script>
		function signInWithFacebook() {
			FB.getLoginStatus(function(response) {
		        if (response.session) {
		    		$('#fb_signin').submit();
		        }
		      });
	
		}
	</script>
</head>
<body>
	<h1>Grails Social Showcase by Foldders.com: Connect to Facebook</h1>

   <form action="${createLink(controller:'connect', params:[providerId:'facebook'])}" method="post">
		<input type="hidden" name="scope" value="publish_stream,offline_access" />
		<div class="formInfo">
			<p>Click the button to connect Grails Social Showcase by Foldders.com with your Facebook account.</p>
		</div>
		<p><button type="submit"><img src="${createLinkTo(dir: 'images/social/facebook', file: 'connect_light_medium_short.gif')}" /></button></p>
		<label for="postToWall"><g:checkBox id="postToWall" name="${grailsApplication.config.facebook.postToWallFlag}" />  Tell your friends about Grails Social Showcase by Foldders.com on your Facebook wall</label>
	</form>
	
	<form id="fb_signin" action="${createLink(controller:'connect', params:[providerId:'facebook'])}" method="post">
		<div id="fb-root"></div>	
		<p><fb:login-button perms="email,publish_stream,offline_access" onlogin="signInWithFacebook();" v="2" length="long">Connect to Facebook</fb:login-button></p>
	</form>

	<facebook:init appId="${grailsApplication.config.facebook.appId}" />
	
</body>
</html>
