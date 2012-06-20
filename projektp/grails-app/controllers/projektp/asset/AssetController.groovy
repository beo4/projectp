package projektp.asset

import org.springframework.dao.DataIntegrityViolationException

class AssetController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [assetInstanceList: Asset.list(params), assetInstanceTotal: Asset.count()]
    }

    def create() {
        [assetInstance: new Asset(params)]
    }

    def save() {
        def assetInstance = new Asset(params)
        if (!assetInstance.save(flush: true)) {
            render(view: "create", model: [assetInstance: assetInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'asset.label', default: 'Asset'), assetInstance.id])
        redirect(action: "show", id: assetInstance.id)
    }

    def show() {
        def assetInstance = Asset.get(params.id)
        if (!assetInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'asset.label', default: 'Asset'), params.id])
            redirect(action: "list")
            return
        }

        [assetInstance: assetInstance]
    }

    def edit() {
        def assetInstance = Asset.get(params.id)
        if (!assetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asset.label', default: 'Asset'), params.id])
            redirect(action: "list")
            return
        }

        [assetInstance: assetInstance]
    }

    def update() {
        def assetInstance = Asset.get(params.id)
        if (!assetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asset.label', default: 'Asset'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (assetInstance.version > version) {
                assetInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'asset.label', default: 'Asset')] as Object[],
                          "Another user has updated this Asset while you were editing")
                render(view: "edit", model: [assetInstance: assetInstance])
                return
            }
        }

        assetInstance.properties = params

        if (!assetInstance.save(flush: true)) {
            render(view: "edit", model: [assetInstance: assetInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'asset.label', default: 'Asset'), assetInstance.id])
        redirect(action: "show", id: assetInstance.id)
    }

    def delete() {
        def assetInstance = Asset.get(params.id)
        if (!assetInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'asset.label', default: 'Asset'), params.id])
            redirect(action: "list")
            return
        }

        try {
            assetInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'asset.label', default: 'Asset'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'asset.label', default: 'Asset'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
