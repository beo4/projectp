package projektp.asset

import org.springframework.dao.DataIntegrityViolationException

class AssetUnitController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [assetUnitInstanceList: AssetUnit.list(params), assetUnitInstanceTotal: AssetUnit.count()]
    }

    def create() {
        [assetUnitInstance: new AssetUnit(params)]
    }

    def save() {
        def assetUnitInstance = new AssetUnit(params)
        if (!assetUnitInstance.save(flush: true)) {
            render(view: "create", model: [assetUnitInstance: assetUnitInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'assetUnit.label', default: 'AssetUnit'), assetUnitInstance.id])
        redirect(action: "show", id: assetUnitInstance.id)
    }

    def show() {
        def assetUnitInstance = AssetUnit.get(params.id)
        if (!assetUnitInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'assetUnit.label', default: 'AssetUnit'), params.id])
            redirect(action: "list")
            return
        }

        [assetUnitInstance: assetUnitInstance]
    }

    def edit() {
        def assetUnitInstance = AssetUnit.get(params.id)
        if (!assetUnitInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'assetUnit.label', default: 'AssetUnit'), params.id])
            redirect(action: "list")
            return
        }

        [assetUnitInstance: assetUnitInstance]
    }

    def update() {
        def assetUnitInstance = AssetUnit.get(params.id)
        if (!assetUnitInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'assetUnit.label', default: 'AssetUnit'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (assetUnitInstance.version > version) {
                assetUnitInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'assetUnit.label', default: 'AssetUnit')] as Object[],
                          "Another user has updated this AssetUnit while you were editing")
                render(view: "edit", model: [assetUnitInstance: assetUnitInstance])
                return
            }
        }

        assetUnitInstance.properties = params

        if (!assetUnitInstance.save(flush: true)) {
            render(view: "edit", model: [assetUnitInstance: assetUnitInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'assetUnit.label', default: 'AssetUnit'), assetUnitInstance.id])
        redirect(action: "show", id: assetUnitInstance.id)
    }

    def delete() {
        def assetUnitInstance = AssetUnit.get(params.id)
        if (!assetUnitInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'assetUnit.label', default: 'AssetUnit'), params.id])
            redirect(action: "list")
            return
        }

        try {
            assetUnitInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'assetUnit.label', default: 'AssetUnit'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'assetUnit.label', default: 'AssetUnit'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
