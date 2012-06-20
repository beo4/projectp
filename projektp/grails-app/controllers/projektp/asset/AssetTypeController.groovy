package projektp.asset

import org.springframework.dao.DataIntegrityViolationException

class AssetTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [assetTypeInstanceList: AssetType.list(params), assetTypeInstanceTotal: AssetType.count()]
    }

    def create() {
        [assetTypeInstance: new AssetType(params)]
    }

    def save() {
        def assetTypeInstance = new AssetType(params)
        if (!assetTypeInstance.save(flush: true)) {
            render(view: "create", model: [assetTypeInstance: assetTypeInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'assetType.label', default: 'AssetType'), assetTypeInstance.id])
        redirect(action: "show", id: assetTypeInstance.id)
    }

    def show() {
        def assetTypeInstance = AssetType.get(params.id)
        if (!assetTypeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'assetType.label', default: 'AssetType'), params.id])
            redirect(action: "list")
            return
        }

        [assetTypeInstance: assetTypeInstance]
    }

    def edit() {
        def assetTypeInstance = AssetType.get(params.id)
        if (!assetTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'assetType.label', default: 'AssetType'), params.id])
            redirect(action: "list")
            return
        }

        [assetTypeInstance: assetTypeInstance]
    }

    def update() {
        def assetTypeInstance = AssetType.get(params.id)
        if (!assetTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'assetType.label', default: 'AssetType'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (assetTypeInstance.version > version) {
                assetTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'assetType.label', default: 'AssetType')] as Object[],
                          "Another user has updated this AssetType while you were editing")
                render(view: "edit", model: [assetTypeInstance: assetTypeInstance])
                return
            }
        }

        assetTypeInstance.properties = params

        if (!assetTypeInstance.save(flush: true)) {
            render(view: "edit", model: [assetTypeInstance: assetTypeInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'assetType.label', default: 'AssetType'), assetTypeInstance.id])
        redirect(action: "show", id: assetTypeInstance.id)
    }

    def delete() {
        def assetTypeInstance = AssetType.get(params.id)
        if (!assetTypeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'assetType.label', default: 'AssetType'), params.id])
            redirect(action: "list")
            return
        }

        try {
            assetTypeInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'assetType.label', default: 'AssetType'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'assetType.label', default: 'AssetType'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
