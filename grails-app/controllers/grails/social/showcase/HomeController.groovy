package grails.social.showcase

import grails.plugins.springsecurity.Secured


@Secured(['ROLE_USER'])
class HomeController {

    def providers
    def springSecurityService



    def index = {

        def status = [:]
        def user = Account.get(springSecurityService.principal.id)
        providers.values().each { p ->  status.put(p.id + "_status", p.getConnections(user.username).any())}

        return status
    }
}
