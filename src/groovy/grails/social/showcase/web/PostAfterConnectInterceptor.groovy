package grails.social.showcase.web

class PostAfterConnectInterceptor {

    def sessionFlag
    def requestFlag

	public void preConnect(def params, def session) {
		if (params[requestFlag]) {
			session[sessionFlag] = params[requestFlag]
		}
	}

	public void postConnect(def connection, def session) {
		if (session[sessionFlag]) {
            session.removeAttribute(sessionFlag)
            connection.serviceApi.updateStatus("I've connected with the Grail Social Showcase!")
		}
	}
}
