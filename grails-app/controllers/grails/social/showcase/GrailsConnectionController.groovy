package grails.social.showcase

class GrailsConnectionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [grailsConnectionInstanceList: GrailsConnection.list(params), grailsConnectionInstanceTotal: GrailsConnection.count()]
    }

    def create = {
        def grailsConnectionInstance = new GrailsConnection()
        grailsConnectionInstance.properties = params
        return [grailsConnectionInstance: grailsConnectionInstance]
    }

    def save = {
        def grailsConnectionInstance = new GrailsConnection(params)
        if (grailsConnectionInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'grailsConnection.label', default: 'GrailsConnection'), grailsConnectionInstance.id])}"
            redirect(action: "show", id: grailsConnectionInstance.id)
        }
        else {
            render(view: "create", model: [grailsConnectionInstance: grailsConnectionInstance])
        }
    }

    def show = {
        def grailsConnectionInstance = GrailsConnection.get(params.id)
        if (!grailsConnectionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'grailsConnection.label', default: 'GrailsConnection'), params.id])}"
            redirect(action: "list")
        }
        else {
            [grailsConnectionInstance: grailsConnectionInstance]
        }
    }

    def edit = {
        def grailsConnectionInstance = GrailsConnection.get(params.id)
        if (!grailsConnectionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'grailsConnection.label', default: 'GrailsConnection'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [grailsConnectionInstance: grailsConnectionInstance]
        }
    }

    def update = {
        def grailsConnectionInstance = GrailsConnection.get(params.id)
        if (grailsConnectionInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (grailsConnectionInstance.version > version) {
                    
                    grailsConnectionInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'grailsConnection.label', default: 'GrailsConnection')] as Object[], "Another user has updated this GrailsConnection while you were editing")
                    render(view: "edit", model: [grailsConnectionInstance: grailsConnectionInstance])
                    return
                }
            }
            grailsConnectionInstance.properties = params
            if (!grailsConnectionInstance.hasErrors() && grailsConnectionInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'grailsConnection.label', default: 'GrailsConnection'), grailsConnectionInstance.id])}"
                redirect(action: "show", id: grailsConnectionInstance.id)
            }
            else {
                render(view: "edit", model: [grailsConnectionInstance: grailsConnectionInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'grailsConnection.label', default: 'GrailsConnection'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def grailsConnectionInstance = GrailsConnection.get(params.id)
        if (grailsConnectionInstance) {
            try {
                grailsConnectionInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'grailsConnection.label', default: 'GrailsConnection'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'grailsConnection.label', default: 'GrailsConnection'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'grailsConnection.label', default: 'GrailsConnection'), params.id])}"
            redirect(action: "list")
        }
    }
}
