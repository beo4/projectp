package projektp

import org.springframework.dao.DataIntegrityViolationException

class PortfolioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [portfolioInstanceList: Portfolio.list(params), portfolioInstanceTotal: Portfolio.count()]
    }

    def create() {
        [portfolioInstance: new Portfolio(params)]
    }

    def save() {
        def portfolioInstance = new Portfolio(params)
        if (!portfolioInstance.save(flush: true)) {
            render(view: "create", model: [portfolioInstance: portfolioInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'portfolio.label', default: 'Portfolio'), portfolioInstance.id])
        redirect(action: "show", id: portfolioInstance.id)
    }

    def show() {
        def portfolioInstance = Portfolio.get(params.id)
        if (!portfolioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'portfolio.label', default: 'Portfolio'), params.id])
            redirect(action: "list")
            return
        }

        [portfolioInstance: portfolioInstance]
    }

    def edit() {
        def portfolioInstance = Portfolio.get(params.id)
        if (!portfolioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'portfolio.label', default: 'Portfolio'), params.id])
            redirect(action: "list")
            return
        }

        [portfolioInstance: portfolioInstance]
    }

    def update() {
        def portfolioInstance = Portfolio.get(params.id)
        if (!portfolioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'portfolio.label', default: 'Portfolio'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (portfolioInstance.version > version) {
                portfolioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'portfolio.label', default: 'Portfolio')] as Object[],
                          "Another user has updated this Portfolio while you were editing")
                render(view: "edit", model: [portfolioInstance: portfolioInstance])
                return
            }
        }

        portfolioInstance.properties = params

        if (!portfolioInstance.save(flush: true)) {
            render(view: "edit", model: [portfolioInstance: portfolioInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'portfolio.label', default: 'Portfolio'), portfolioInstance.id])
        redirect(action: "show", id: portfolioInstance.id)
    }

    def delete() {
        def portfolioInstance = Portfolio.get(params.id)
        if (!portfolioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'portfolio.label', default: 'Portfolio'), params.id])
            redirect(action: "list")
            return
        }

        try {
            portfolioInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'portfolio.label', default: 'Portfolio'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'portfolio.label', default: 'Portfolio'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
