package de.ospu.fdup.testimonial

import org.springframework.dao.DataIntegrityViolationException

class AreaController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [areaInstanceList: Area.list(params), areaInstanceTotal: Area.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[areaInstance: new Area(params)]
			break
		case 'POST':
	        def areaInstance = new Area(params)
	        if (!areaInstance.save(flush: true)) {
	            render view: 'create', model: [areaInstance: areaInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'area.label', default: 'Area'), areaInstance.id])
	        redirect action: 'show', id: areaInstance.id
			break
		}
    }

    def show() {
        def areaInstance = Area.get(params.id)
        if (!areaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'area.label', default: 'Area'), params.id])
            redirect action: 'list'
            return
        }

        [areaInstance: areaInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def areaInstance = Area.get(params.id)
	        if (!areaInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'area.label', default: 'Area'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [areaInstance: areaInstance]
			break
		case 'POST':
	        def areaInstance = Area.get(params.id)
	        if (!areaInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'area.label', default: 'Area'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (areaInstance.version > version) {
	                areaInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'area.label', default: 'Area')] as Object[],
	                          "Another user has updated this Area while you were editing")
	                render view: 'edit', model: [areaInstance: areaInstance]
	                return
	            }
	        }

	        areaInstance.properties = params

	        if (!areaInstance.save(flush: true)) {
	            render view: 'edit', model: [areaInstance: areaInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'area.label', default: 'Area'), areaInstance.id])
	        redirect action: 'show', id: areaInstance.id
			break
		}
    }

    def delete() {
        def areaInstance = Area.get(params.id)
        if (!areaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'area.label', default: 'Area'), params.id])
            redirect action: 'list'
            return
        }

        try {
            areaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'area.label', default: 'Area'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'area.label', default: 'Area'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
