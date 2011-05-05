class UrlMappings {

    static mappings = {

        "/connect/$providerId" {
            controller = 'connect'
            action = [
                    POST: 'connect',
                    GET:  'callBack',
                    DELETE: 'disconnect']
        }

        "/$controller/$action?/$id?" {
            constraints {
                // apply constraints here
            }
        }
        "/"(view: "/index")
        "500"(view: '/error')

    }


}
