package projektp.tenant

import org.springframework.dao.DataIntegrityViolationException

class IncidentTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [incidentTypeInstanceList: IncidentType.list(params), incidentTypeInstanceTotal: IncidentType.count()]
    }

    def create() {
        [incidentTypeInstance: new IncidentType(params)]
    }

    def save() {
        def incidentTypeInstance = new IncidentType(params)
        if (!incidentTypeInstance.save(flush: true)) {
            render(view: "create", model: [incidentTypeInstance: incidentTypeInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'incidentType.label', default: 'IncidentType'), incidentTypeInstance.id])
        redirect(action: "show", id: incidentTypeInstance.id)
    }

    def show() {
        def incidentTypeInstance = IncidentType.get(params.id)
        if (!incidentTypeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'incidentType.label', default: 'IncidentType'), params.id])
            redirect(action: "list")
            return
        }

        [incidentTypeInstance: incidentTypeInstance]
    }

    def edit() {
        def incidentTypeInstance = IncidentType.get(params.id)
        if (!incidentTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'incidentType.label', default: 'IncidentType'), params.id])
            redirect(action: "list")
            return
        }

        [incidentTypeInstance: incidentTypeInstance]
    }

    def update() {
        def incidentTypeInstance = IncidentType.get(params.id)
        if (!incidentTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'incidentType.label', default: 'IncidentType'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (incidentTypeInstance.version > version) {
                incidentTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'incidentType.label', default: 'IncidentType')] as Object[],
                          "Another user has updated this IncidentType while you were editing")
                render(view: "edit", model: [incidentTypeInstance: incidentTypeInstance])
                return
            }
        }

        incidentTypeInstance.properties = params

        if (!incidentTypeInstance.save(flush: true)) {
            render(view: "edit", model: [incidentTypeInstance: incidentTypeInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'incidentType.label', default: 'IncidentType'), incidentTypeInstance.id])
        redirect(action: "show", id: incidentTypeInstance.id)
    }

    def delete() {
        def incidentTypeInstance = IncidentType.get(params.id)
        if (!incidentTypeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'incidentType.label', default: 'IncidentType'), params.id])
            redirect(action: "list")
            return
        }

        try {
            incidentTypeInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'incidentType.label', default: 'IncidentType'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'incidentType.label', default: 'IncidentType'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
