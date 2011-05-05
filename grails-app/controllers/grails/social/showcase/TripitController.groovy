package grails.social.showcase

class TripitController {

    def springSecurityService
    def tripit

    def index = {

        if (isConnected()) {
            def api = tripit.getConnections(springSecurityService.principal.username).get(0).serviceApi
            [tripItUser: api.userProfile, trips: api.upcomingTrips]
        }
        else {
            render(view: "connect")
        }
    }


    def connect = {}

    def connected = {
        if (!isConnected()) {
            redirect(action: "index")
        }
    }

    private def isConnected() {
        tripit.isConnected(springSecurityService.principal.username)
    }
}


