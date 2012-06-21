package projectp.util

import org.springframework.dao.DataIntegrityViolationException

class DocumentController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [documentInstanceList: Document.list(params), documentInstanceTotal: Document.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[documentInstance: new Document(params)]
			break
		case 'POST':
	        def documentInstance = new Document(params)
	        if (!documentInstance.save(flush: true)) {
	            render view: 'create', model: [documentInstance: documentInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'document.label', default: 'Document'), documentInstance.id])
	        redirect action: 'show', id: documentInstance.id
			break
		}
    }

    def show() {
        def documentInstance = Document.get(params.id)
        if (!documentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'document.label', default: 'Document'), params.id])
            redirect action: 'list'
            return
        }

        [documentInstance: documentInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def documentInstance = Document.get(params.id)
	        if (!documentInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'document.label', default: 'Document'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [documentInstance: documentInstance]
			break
		case 'POST':
	        def documentInstance = Document.get(params.id)
	        if (!documentInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'document.label', default: 'Document'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (documentInstance.version > version) {
	                documentInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'document.label', default: 'Document')] as Object[],
	                          "Another user has updated this Document while you were editing")
	                render view: 'edit', model: [documentInstance: documentInstance]
	                return
	            }
	        }

	        documentInstance.properties = params

	        if (!documentInstance.save(flush: true)) {
	            render view: 'edit', model: [documentInstance: documentInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'document.label', default: 'Document'), documentInstance.id])
	        redirect action: 'show', id: documentInstance.id
			break
		}
    }

    def delete() {
        def documentInstance = Document.get(params.id)
        if (!documentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'document.label', default: 'Document'), params.id])
            redirect action: 'list'
            return
        }

        try {
            documentInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'document.label', default: 'Document'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'document.label', default: 'Document'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
