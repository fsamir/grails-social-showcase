package grails.social.showcase

import org.springframework.social.connect.support.Connection
import org.springframework.social.connect.support.ConnectionRepository

class ConnectionRepositoryService implements ConnectionRepository {

    static transactional = true

    boolean isConnected(Serializable username, String providerId) {

        def account = Account.findByUsername(username as String)
        def connection = GrailsConnection.findByAccountAndProviderId(account, providerId)
        return connection != null
    }

    List<Connection> findConnections(Serializable username, String providerId) {

        def account = Account.findByUsername(username as String)
        def grailsConnections = GrailsConnection.findAllByAccountAndProviderId(account, providerId)

        def connections = new ArrayList<Connection>(grailsConnections.size())
        grailsConnections.each {c -> connections.add(new Connection(c.id, c.accessToken, c.secret, c.refreshToken, c.providerAccountId)) }
        return connections
    }

    Serializable findAccountIdByConnectionAccessToken(String providerId, String accessToken) {

        def grailsConnection = GrailsConnection.findByProviderIdAndAccessToken(providerId, accessToken)
        grailsConnection.account.username
    }

    List<Serializable> findAccountIdsForProviderAccountIds(String providerId, List<String> providerAccountIds) {
        def grailsConnections = GrailsConnection.withCriteria {
            and {
                eq('providerId', providerId)
                inList('providerAccountId', providerAccountIds)
            }
        }
        def connections = new ArrayList<Serializable>(grailsConnections.size())
        grailsConnections.each {c -> connections.add(c.account.username) }
        return connections
    }

    Connection saveConnection(Serializable username, String providerId, Connection connection) {
        def account = Account.findByUsername(username as String)
        def c = new GrailsConnection(
                account: account,
                providerId: providerId,
                accessToken: connection.accessToken,
                secret: connection.secret,
                refreshToken: connection.refreshToken,
                providerAccountId: connection.providerAccountId).save(flush: true)

        new Connection(c.id, c.accessToken, c.secret, c.refreshToken, c.providerAccountId)
    }

    void removeConnection(Serializable accountId, String providerId, Long connectionId) {
        def connection = GrailsConnection.get(connectionId)
        connection.delete(flush: true)
    }
}
