package grails.social.showcase

import org.codehaus.groovy.grails.commons.ConfigurationHolder
import org.springframework.social.connect.oauth1.OAuth1ServiceProvider
import org.springframework.social.oauth1.AuthorizedRequestToken

class ConnectController {

    def springSecurityService
    def providers
    def interceptors

    def preConnect() {
        interceptors[params.providerId]*.preConnect(params, session)
    }

    def postConnect(connection) {
        interceptors[params.providerId]*.postConnect(connection, session)
    }

    def connect = {
        preConnect()
        def provider = providers[params.providerId]

        if (provider instanceof OAuth1ServiceProvider) {
            def oauth1Ops = provider.getOAuthOperations()
            def requestToken = oauth1Ops.fetchNewRequestToken(callBackUrl(params.providerId))
            session.oauthToken = requestToken
            redirect(url: oauth1Ops.buildAuthorizeUrl(requestToken.getValue(), callBackUrl(params.providerId)))
        } else {
        redirect(url: provider.getOAuthOperations().buildAuthorizeUrl(callBackUrl(params.providerId), params.scope))
    	}
	}

    def disconnect = {
        def provider = providers[params.providerId]
        def connections = provider.getConnections(springSecurityService.principal.username)
        connections.each { c -> c.disconnect()}

        redirect(controller:params.providerId,  action: "connect")
    }

    def callBack = {

        def connection

        if (params.oauth_token)
            connection = oauth1CallBack()
        if (params.code)
            connection = oauth2CallBack()

        postConnect(connection)

        redirect(controller:params.providerId,  action: "connected")
    }

    def oauth1CallBack = {
        def provider = providers[params.providerId]

        def token = session.oauthToken
        session.removeAttribute("oauthToken")
        def accessToken = provider.getOAuthOperations().exchangeForAccessToken(new AuthorizedRequestToken(token, params.oauth_verifier))
        provider.connect(springSecurityService.principal.username, accessToken)
    }

    def oauth2CallBack = {
        def provider = providers[params.providerId]
        def accessGrant = provider.getOAuthOperations().exchangeForAccess(params.code, callBackUrl(params.providerId))
        provider.connect(springSecurityService.principal.username, accessGrant)
    }

    def callBackUrl(String provider) {"${ConfigurationHolder.config.grails.serverURL}/connect/${provider}"}
}
