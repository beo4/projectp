package de.ospu.fdup.testimonial

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class AnalysisController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [analysisInstanceList: Analysis.list(params), analysisInstanceTotal: Analysis.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[analysisInstance: new Analysis(params)]
			break
		case 'POST':
	        def analysisInstance = new Analysis(params)
	        if (!analysisInstance.save(flush: true)) {
	            render view: 'create', model: [analysisInstance: analysisInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'analysis.label', default: 'Analysis'), analysisInstance.id])
	        redirect action: 'show', id: analysisInstance.id
			break
		}
    }
	
	def createAjax() {
		switch (request.method) {
		case 'GET':
			[analysisInstance: new Analysis('area.id': params.id)]
			break
		case 'POST':
			def analysisInstance = new Analysis(params)
			if (!analysisInstance.save(flush: true)) {
				render analysisInstance as JSON
				return
			}

			flash.message = message(code: 'default.created.message', args: [message(code: 'analysis.label', default: 'Analysis'), analysisInstance.id])
			render analysisInstance as JSON
			break
		}
	}

    def show() {
        def analysisInstance = Analysis.get(params.id)
        if (!analysisInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'analysis.label', default: 'Analysis'), params.id])
            redirect action: 'list'
            return
        }

        [analysisInstance: analysisInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def analysisInstance = Analysis.get(params.id)
	        if (!analysisInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'analysis.label', default: 'Analysis'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [analysisInstance: analysisInstance]
			break
		case 'POST':
	        def analysisInstance = Analysis.get(params.id)
	        if (!analysisInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'analysis.label', default: 'Analysis'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (analysisInstance.version > version) {
	                analysisInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'analysis.label', default: 'Analysis')] as Object[],
	                          "Another user has updated this Analysis while you were editing")
	                render view: 'edit', model: [analysisInstance: analysisInstance]
	                return
	            }
	        }

	        analysisInstance.properties = params

	        if (!analysisInstance.save(flush: true)) {
	            render view: 'edit', model: [analysisInstance: analysisInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'analysis.label', default: 'Analysis'), analysisInstance.id])
	        redirect action: 'show', id: analysisInstance.id
			break
		}
    }

    def delete() {
        def analysisInstance = Analysis.get(params.id)
        if (!analysisInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'analysis.label', default: 'Analysis'), params.id])
            redirect action: 'list'
            return
        }

        try {
            analysisInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'analysis.label', default: 'Analysis'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'analysis.label', default: 'Analysis'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
