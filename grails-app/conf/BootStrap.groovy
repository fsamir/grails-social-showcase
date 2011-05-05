import grails.social.showcase.Account
import grails.social.showcase.Role
import grails.social.showcase.AccountRole

class BootStrap {

    def springSecurityService

    def init = { servletContext ->

        def userRole = new Role(authority: "ROLE_USER").save(flush: true)

        def account1 = new Account(
                username: "foldders",
                password: springSecurityService.encodePassword("foldders"),
                enabled: true
        ).save(flush: true)
        AccountRole.create account1, userRole, true

        def account2 = new Account(
                username: "habuma",
                password: springSecurityService.encodePassword("habuma"),
                enabled: true
        ).save(flush: true)
        AccountRole.create account2, userRole, true

        def account3 = new Account(
                username: "kdonald",
                password: springSecurityService.encodePassword("melbourne"),
                enabled: true
        ).save(flush: true)
        AccountRole.create account3, userRole, true

        def account4 = new Account(
                username: "rclarkson",
                password: springSecurityService.encodePassword("atlanta"),
                enabled: true
        ).save(flush: true)
        AccountRole.create account4, userRole, true

    }
    def destroy = {
    }
}
