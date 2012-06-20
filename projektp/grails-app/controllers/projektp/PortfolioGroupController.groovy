package projektp

import org.springframework.dao.DataIntegrityViolationException

class PortfolioGroupController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [portfolioGroupInstanceList: PortfolioGroup.list(params), portfolioGroupInstanceTotal: PortfolioGroup.count()]
    }

    def create() {
        [portfolioGroupInstance: new PortfolioGroup(params)]
    }

    def save() {
        def portfolioGroupInstance = new PortfolioGroup(params)
        if (!portfolioGroupInstance.save(flush: true)) {
            render(view: "create", model: [portfolioGroupInstance: portfolioGroupInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'portfolioGroup.label', default: 'PortfolioGroup'), portfolioGroupInstance.id])
        redirect(action: "show", id: portfolioGroupInstance.id)
    }

    def show() {
        def portfolioGroupInstance = PortfolioGroup.get(params.id)
        if (!portfolioGroupInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'portfolioGroup.label', default: 'PortfolioGroup'), params.id])
            redirect(action: "list")
            return
        }

        [portfolioGroupInstance: portfolioGroupInstance]
    }

    def edit() {
        def portfolioGroupInstance = PortfolioGroup.get(params.id)
        if (!portfolioGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'portfolioGroup.label', default: 'PortfolioGroup'), params.id])
            redirect(action: "list")
            return
        }

        [portfolioGroupInstance: portfolioGroupInstance]
    }

    def update() {
        def portfolioGroupInstance = PortfolioGroup.get(params.id)
        if (!portfolioGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'portfolioGroup.label', default: 'PortfolioGroup'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (portfolioGroupInstance.version > version) {
                portfolioGroupInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'portfolioGroup.label', default: 'PortfolioGroup')] as Object[],
                          "Another user has updated this PortfolioGroup while you were editing")
                render(view: "edit", model: [portfolioGroupInstance: portfolioGroupInstance])
                return
            }
        }

        portfolioGroupInstance.properties = params

        if (!portfolioGroupInstance.save(flush: true)) {
            render(view: "edit", model: [portfolioGroupInstance: portfolioGroupInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'portfolioGroup.label', default: 'PortfolioGroup'), portfolioGroupInstance.id])
        redirect(action: "show", id: portfolioGroupInstance.id)
    }

    def delete() {
        def portfolioGroupInstance = PortfolioGroup.get(params.id)
        if (!portfolioGroupInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'portfolioGroup.label', default: 'PortfolioGroup'), params.id])
            redirect(action: "list")
            return
        }

        try {
            portfolioGroupInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'portfolioGroup.label', default: 'PortfolioGroup'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'portfolioGroup.label', default: 'PortfolioGroup'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
