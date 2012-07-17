package de.ospu.fdup.testimonial

import de.ospu.fdup.security.SecUser

import grails.plugins.springsecurity.Secured

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.dao.DataIntegrityViolationException

class QuestionnaireController {
	def springSecurityService

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 100, 100)
        [questionnaireInstanceList: Questionnaire.list(params), questionnaireInstanceTotal: Questionnaire.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[questionnaireInstance: new Questionnaire(params)]
			break
		case 'POST':
	        def questionnaireInstance = new Questionnaire(params)
			
			if (Questionnaire.findWhere(examinee:questionnaireInstance.examinee, active: true )) {
				flash.message = message(code: 'default.allready.exist', args: [message(code: 'questionnaire.label', default: 'Questionnaire'), params.id])
				render view: 'create', model: [questionnaireInstance: questionnaireInstance]
				return
			}
			
	        if (!questionnaireInstance.save(flush: true)) {
	            render view: 'create', model: [questionnaireInstance: questionnaireInstance]
	            return
	        }
			List activeQuestions = Question.findAllByActiveQuestion(true)
			questionnaireInstance.addQuestions(activeQuestions)

			flash.message = message(code: 'default.created.message', args: [message(code: 'questionnaire.label', default: 'Questionnaire'), questionnaireInstance.id])
	        redirect action: 'show', id: questionnaireInstance.id
			break
		}
    }

	@Secured(['ROLE_ADMIN'])
    def show() {
        def questionnaireInstance = Questionnaire.get(params.id)
        if (!questionnaireInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionnaire.label', default: 'Questionnaire'), params.id])
            redirect action: 'list'
            return
        }
		
		
		

        [questionnaireInstance: questionnaireInstance]
    }
	
	@Secured(['IS_AUTHENTICATED_REMEMBERED'])
	def test() {
		switch (request.method) {
			case 'GET':
				
				def user = SecUser.get(springSecurityService.principal.id)
				
				if (!user) {
					redirect action: 'list'
					return
				}
				
			
		        def questionnaireInstance = user.examinee.getActualQuestionnaire()
		        if (!questionnaireInstance) {
		            flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionnaire.label', default: 'Questionnaire'), params.id])
		            redirect action: 'list'
		            return
		        }
				
				questionnaireInstance.start = new Date()
				
				if (!questionnaireInstance.save(flush: true)) {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionnaire.label', default: 'Questionnaire'), params.id])
					redirect action: 'list'
					return
				}
	
		        [questionnaireInstance: questionnaireInstance]
				break
			case 'POST':
				def questionnaireInstance = Questionnaire.get(params.id)
				if (!questionnaireInstance) {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionnaire.label', default: 'Questionnaire'), params.id])
					redirect action: 'list'
					return
				}
				if (params.version) {
					def version = params.version.toLong()
					if (questionnaireInstance.version > version) {
						questionnaireInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
								  [message(code: 'questionnaire.label', default: 'Questionnaire')] as Object[],
								  "Another user has updated this Questionnaire while you were editing")
						render view: 'edit', model: [questionnaireInstance: questionnaireInstance]
						return
					}
				}
				questionnaireInstance.properties = params
				for (QuestionnaireQuestion questionnaireQuestion : questionnaireInstance.questionnaireQuestions) {
					
					String questionId = questionnaireQuestion.id
					def para = params.get(questionId)
					long answerId = params.long(questionId);
					questionnaireQuestion.answer = Answer.get(answerId)
					
					if (!questionnaireQuestion.save(flush: true)) {
		            render view: 'test', model: [questionnaireInstance: questionnaireInstance]
		            return
		        }
				}
				
				
				
				 if (!questionnaireInstance.save(flush: true)) {
		            render view: 'test', model: [questionnaireInstance: questionnaireInstance]
		            return
		        }
	
				flash.message = message(code: 'default.updated.message', args: [message(code: 'questionnaire.label', default: 'Questionnaire'), questionnaireInstance.id])
		        redirect action: 'test', id: questionnaireInstance.id
				break
			}
	}

    def edit() {
		switch (request.method) {
		case 'GET':
	        def questionnaireInstance = Questionnaire.get(params.id)
	        if (!questionnaireInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionnaire.label', default: 'Questionnaire'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [questionnaireInstance: questionnaireInstance]
			break
		case 'POST':
	        def questionnaireInstance = Questionnaire.get(params.id)
	        if (!questionnaireInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionnaire.label', default: 'Questionnaire'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (questionnaireInstance.version > version) {
	                questionnaireInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'questionnaire.label', default: 'Questionnaire')] as Object[],
	                          "Another user has updated this Questionnaire while you were editing")
	                render view: 'edit', model: [questionnaireInstance: questionnaireInstance]
	                return
	            }
	        }

	        questionnaireInstance.properties = params

	        if (!questionnaireInstance.save(flush: true)) {
	            render view: 'edit', model: [questionnaireInstance: questionnaireInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'questionnaire.label', default: 'Questionnaire'), questionnaireInstance.id])
	        redirect action: 'show', id: questionnaireInstance.id
			break
		}
    }

    def delete() {
        def questionnaireInstance = Questionnaire.get(params.id)
        if (!questionnaireInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionnaire.label', default: 'Questionnaire'), params.id])
            redirect action: 'list'
            return
        }

        try {
            questionnaireInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'questionnaire.label', default: 'Questionnaire'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'questionnaire.label', default: 'Questionnaire'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
