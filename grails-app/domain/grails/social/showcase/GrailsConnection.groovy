package grails.social.showcase

class GrailsConnection {

    Account account
    String providerId
    String accessToken
    String secret
    String refreshToken
    String providerAccountId

    static constraints = {
        account(unique: ['providerId', 'accessToken'])
        secret(nullable: true)
        refreshToken(nullable: true)
        providerAccountId(nullable: true)
    }
}
