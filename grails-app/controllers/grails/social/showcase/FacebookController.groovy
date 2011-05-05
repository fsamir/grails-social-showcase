package grails.social.showcase

class FacebookController {

    def springSecurityService
    def facebook

    def index = {

        if (isConnected()) {
            def userProfile = getFacebookApi().userProfile
            ["facebookUser": userProfile]
        } else {
            render(view: "connect")
        }
    }

    def postToWall = {
        getFacebookApi().updateStatus(params.message);
        redirect(action: "index");
    }

    def connect = {}

    def connected = {
        if (!isConnected()) {
            redirect(action: "index")
        }
    }

    private def isConnected() {
        facebook.isConnected(springSecurityService.principal.username)
    }

    private def getFacebookApi() {
        return facebook.getConnections(springSecurityService.principal.username).get(0).serviceApi
    }
}

