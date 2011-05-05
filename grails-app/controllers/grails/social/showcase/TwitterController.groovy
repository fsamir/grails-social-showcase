package grails.social.showcase

class TwitterController {

    def springSecurityService
    def twitter

    def index = {

        if (isConnected()) {
            def connections = twitter.getConnections(springSecurityService.principal.username)
            def connectedProfiles = connections.collect {c -> c.serviceApi.userProfile}
            [connectedProfiles: connectedProfiles]
        } else {
            render(view: "connect")
        }
    }

    def tweet = {
        def connections = twitter.getConnections(springSecurityService.principal.username)
        connections.findAll {c -> params.tweetAll || c.serviceApi.profileId == params.screenName}.each {c -> c.serviceApi.updateStatus(params.message)}
        redirect(action: "index")
    }

    def connect = {}

    def connected = {
        if (!isConnected()) {
            redirect(action: "index")
        }
    }

    private def isConnected() {
        twitter.isConnected(springSecurityService.principal.username)
    }
}

