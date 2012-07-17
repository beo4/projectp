package de.ospu.fdup.testimonial

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class QuestionController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']
	
	

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
		def areas = Area.findAll()
		
        params.max = Math.min(params.max ? params.int('max') : 100, 100)
        [questionInstanceList: Question.list(params), questionInstanceTotal: Question.count(), areas: areas]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[questionInstance: new Question(params)]
			break
		case 'POST':
	        def questionInstance = new Question(params)
	        if (!questionInstance.save(flush: true)) {
	            render view: 'create', model: [questionInstance: questionInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'question.label', default: 'Question'), questionInstance.id])
	        redirect action: 'show', id: questionInstance.id
			break
		}
    }

    def show() {
        def questionInstance = Question.get(params.id)
        if (!questionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), params.id])
            redirect action: 'list'
            return
        }

        [questionInstance: questionInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def questionInstance = Question.get(params.id)
	        if (!questionInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [questionInstance: questionInstance]
			break
		case 'POST':
	        def questionInstance = Question.get(params.id)
	        if (!questionInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (questionInstance.version > version) {
	                questionInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'question.label', default: 'Question')] as Object[],
	                          "Another user has updated this Question while you were editing")
	                render view: 'edit', model: [questionInstance: questionInstance]
	                return
	            }
	        }

	        questionInstance.properties = params

	        if (!questionInstance.save(flush: true)) {
	            render view: 'edit', model: [questionInstance: questionInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'question.label', default: 'Question'), questionInstance.id])
	        redirect action: 'show', id: questionInstance.id
			break
		}
    }

    def delete() {
        def questionInstance = Question.get(params.id)
        if (!questionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), params.id])
            redirect action: 'list'
            return
        }

        try {
            questionInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'question.label', default: 'Question'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'question.label', default: 'Question'), params.id])
            redirect action: 'show', id: params.id
        }
    }
	
	def sort(){
		switch (request.method) {
			case 'GET':
				render message(code: 'default.updated.message', args: [message(code: 'area.label', default: 'Area'), areaInstance.id]) as JSON
				break
			case 'POST':
				def questionInstance = Question.get(params.id)
				if (!questionInstance) {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'area.label', default: 'Area'), params.id])
					redirect action: 'list'
					return
				}
				
				
				questionInstance.properties = params
				
				if (!questionInstance.save(flush: true)) {
					render  questionInstance as JSON
					return
				}
				
				[questionInstance: questionInstance]
	
				flash.message = message(code: 'default.updated.message', args: [message(code: 'area.label', default: 'Area'), areaInstance.id])
				render questionInstance as JSON
				break
			}
	}
	
}
