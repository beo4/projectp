package de.ospu.fdup.testimonial

import org.springframework.dao.DataIntegrityViolationException

class QuestionnaireQuestionController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [questionnaireQuestionInstanceList: QuestionnaireQuestion.list(params), questionnaireQuestionInstanceTotal: QuestionnaireQuestion.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[questionnaireQuestionInstance: new QuestionnaireQuestion(params)]
			break
		case 'POST':
	        def questionnaireQuestionInstance = new QuestionnaireQuestion(params)
	        if (!questionnaireQuestionInstance.save(flush: true)) {
	            render view: 'create', model: [questionnaireQuestionInstance: questionnaireQuestionInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'questionnaireQuestion.label', default: 'QuestionnaireQuestion'), questionnaireQuestionInstance.id])
	        redirect action: 'show', id: questionnaireQuestionInstance.id
			break
		}
    }

    def show() {
        def questionnaireQuestionInstance = QuestionnaireQuestion.get(params.id)
        if (!questionnaireQuestionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionnaireQuestion.label', default: 'QuestionnaireQuestion'), params.id])
            redirect action: 'list'
            return
        }

        [questionnaireQuestionInstance: questionnaireQuestionInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def questionnaireQuestionInstance = QuestionnaireQuestion.get(params.id)
	        if (!questionnaireQuestionInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionnaireQuestion.label', default: 'QuestionnaireQuestion'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [questionnaireQuestionInstance: questionnaireQuestionInstance]
			break
		case 'POST':
	        def questionnaireQuestionInstance = QuestionnaireQuestion.get(params.id)
	        if (!questionnaireQuestionInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionnaireQuestion.label', default: 'QuestionnaireQuestion'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (questionnaireQuestionInstance.version > version) {
	                questionnaireQuestionInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'questionnaireQuestion.label', default: 'QuestionnaireQuestion')] as Object[],
	                          "Another user has updated this QuestionnaireQuestion while you were editing")
	                render view: 'edit', model: [questionnaireQuestionInstance: questionnaireQuestionInstance]
	                return
	            }
	        }

	        questionnaireQuestionInstance.properties = params

	        if (!questionnaireQuestionInstance.save(flush: true)) {
	            render view: 'edit', model: [questionnaireQuestionInstance: questionnaireQuestionInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'questionnaireQuestion.label', default: 'QuestionnaireQuestion'), questionnaireQuestionInstance.id])
	        redirect action: 'show', id: questionnaireQuestionInstance.id
			break
		}
    }

    def delete() {
        def questionnaireQuestionInstance = QuestionnaireQuestion.get(params.id)
        if (!questionnaireQuestionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionnaireQuestion.label', default: 'QuestionnaireQuestion'), params.id])
            redirect action: 'list'
            return
        }

        try {
            questionnaireQuestionInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'questionnaireQuestion.label', default: 'QuestionnaireQuestion'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'questionnaireQuestion.label', default: 'QuestionnaireQuestion'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
