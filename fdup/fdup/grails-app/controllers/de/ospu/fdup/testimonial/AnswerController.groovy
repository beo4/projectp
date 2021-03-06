package de.ospu.fdup.testimonial

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class AnswerController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 100, 100)
        [answerInstanceList: Answer.list(params), answerInstanceTotal: Answer.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[answerInstance: new Answer(params)]
			break
		case 'POST':
	        def answerInstance = new Answer(params)
	        if (!answerInstance.save(flush: true)) {
	            render view: 'create', model: [answerInstance: answerInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'answer.label', default: 'Answer'), answerInstance.id])
	        redirect action: 'show', id: answerInstance.id
			break
		}
    }
	
	def createAjax() {
		switch (request.method) {
		case 'GET':
			[answerInstance: new Answer('question.id': params.id)]
			break
		case 'POST':
			def answerInstance = new Answer(params)
			if (!answerInstance.save(flush: true)) {
				render view: 'createAjax', model: [answerInstance: answerInstance]
				return
			}

			flash.message = message(code: 'default.created.message', args: [message(code: 'answer.label', default: 'Answer'), answerInstance.id])
			render answerInstance as JSON
			break
		}
	}

    def show() {
        def answerInstance = Answer.get(params.id)
        if (!answerInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'answer.label', default: 'Answer'), params.id])
            redirect action: 'list'
            return
        }

        [answerInstance: answerInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def answerInstance = Answer.get(params.id)
	        if (!answerInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'answer.label', default: 'Answer'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [answerInstance: answerInstance]
			break
		case 'POST':
	        def answerInstance = Answer.get(params.id)
	        if (!answerInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'answer.label', default: 'Answer'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (answerInstance.version > version) {
	                answerInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'answer.label', default: 'Answer')] as Object[],
	                          "Another user has updated this Answer while you were editing")
	                render view: 'edit', model: [answerInstance: answerInstance]
	                return
	            }
	        }

	        answerInstance.properties = params

	        if (!answerInstance.save(flush: true)) {
	            render view: 'edit', model: [answerInstance: answerInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'answer.label', default: 'Answer'), answerInstance.id])
	        redirect action: 'show', id: answerInstance.id
			break
		}
    }

    def delete() {
        def answerInstance = Answer.get(params.id)
        if (!answerInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'answer.label', default: 'Answer'), params.id])
            redirect action: 'list'
            return
        }

        try {
            answerInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'answer.label', default: 'Answer'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'answer.label', default: 'Answer'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
