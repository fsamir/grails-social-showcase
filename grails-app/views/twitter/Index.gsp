<html>
<head>
    <title>Grails Social Showcase by Foldders.com: Send a Tweet</title>
</head>
<body>
<h1>Grails Social Showcase by Foldders.com: Send a Tweet</h1>

<p>Your Grails Social Showcase by Foldders.com account is connected to the following Twitter profiles:</p>
<g:each in="${connectedProfiles}" var="profile">
    <div>
        <p><a href="${profile.profileUrl}" target="_blank"><img src="${profile.profileImageUrl}" border="0"/></a></p>
        <p>${profile.name} (${profile.screenName})</p>
    </div>
</g:each>

<form action="${createLink(controller: 'connect', params: [providerId: 'twitter'])}" id="disconnect" method="post">
    <button type="submit">Disconnect from all</button>
    <input type="hidden" name="_method" value="delete"/>
</form>

<form action="${createLink(controller: 'connect', params: [providerId: 'twitter'])}" method="post">
    <p>You may connect multiple Twitter profiles with a Grails Social Showcase by Foldders.com account. To connect with another
    Twitter profile, click the button.</p>
    <p>(Note: If you are still logged into Twitter as any one of the profiles that are already connected, you'll need to
    click the "Sign Out" link when Twitter prompts you to allow access to Grails Social Showcase by Foldders.com and then login as a
    different Twitter user.)</p>
    <p><button type="submit">Connect another Twitter profile</button></p>
    <label for="postTweet"><g:checkBox id="postTweet" name="${grailsApplication.config.twitter.postTweetFlag}"/> Post a tweet about connecting with Grails Social Showcase by Foldders.com</label>
</form>

<g:form action="tweet" method="post">
    Tweet as
    <g:if test="${connectedProfiles.size() == 1 }">
        <b>${connectedProfiles[0].screenName}</b>
        <input type="hidden" name="screenName" value="${connectedProfiles[0].screenName}"/>
    </g:if>
    <g:elseif test="${connectedProfiles.size() > 1 }">
        <g:select name="screenName" from="${connectedProfiles}" optionKey="name" optionValue="screenName"/>
        <label for="postTweet">
            <g:checkBox id="postTweet" name="tweetAll"/>Tweet to all"</label>
    </g:elseif>
    <br/>
    <g:textArea name="message" rows="5" cols="80"/>
    <br/>
    <input type="submit" value="Send Tweet"/>
</g:form>

</body>
</html>
