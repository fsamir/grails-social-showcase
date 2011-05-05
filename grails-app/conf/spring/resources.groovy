
import org.springframework.social.facebook.connect.FacebookServiceProvider
import org.springframework.social.twitter.connect.TwitterServiceProvider
import org.springframework.social.tripit.connect.TripItServiceProvider
import grails.social.showcase.ConnectionRepositoryService
import org.springframework.social.connect.ServiceProvider
import org.codehaus.groovy.grails.commons.ConfigurationHolder
import org.springframework.social.web.connect.ConnectController
import org.springframework.beans.factory.config.MapFactoryBean
import grails.social.showcase.web.PostAfterConnectInterceptor

def config = ConfigurationHolder.config

// Place your Spring DSL code here
beans = {

    facebook(FacebookServiceProvider, config.facebook.appId, config.facebook.appSecret, ref("connectionRepositoryService") ) {}
    twitter(TwitterServiceProvider, config.twitter.consumerKey, config.twitter.consumerSecret, ref("connectionRepositoryService") ) {}
    tripit(TripItServiceProvider, config.tripit.consumerKey, config.tripit.consumerSecret, ref("connectionRepositoryService") ) {}

    providers(MapFactoryBean) {
        sourceMap =  [
                facebook : ref("facebook"),
                twitter : ref("twitter"),
                tripit : ref("tripit")
                ]
    }

    interceptors(MapFactoryBean) {
        sourceMap =  [
                facebook : [new PostAfterConnectInterceptor(requestFlag: config.facebook.postToWallFlag, sessionFlag: "facebookConnect.$config.facebook.postToWallFlag")],
                twitter : [new PostAfterConnectInterceptor(requestFlag: config.twitter.postTweetFlag, sessionFlag: "twitterConnect.$config.twitter.postTweetFlag")],
                tripit : []
                ]
    }

}
