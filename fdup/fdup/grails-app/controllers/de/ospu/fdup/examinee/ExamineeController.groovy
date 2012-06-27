package de.ospu.fdup.examinee

import org.springframework.dao.DataIntegrityViolationException

import de.ospu.fdup.security.SecRole;
import de.ospu.fdup.security.SecUser;
import de.ospu.fdup.security.SecUserSecRole

class ExamineeController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [examineeInstanceList: Examinee.list(params), examineeInstanceTotal: Examinee.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[examineeInstance: new Examinee(params), secUserInstance: new SecUser(params), secUserSecRoleInstance:new SecUserSecRole()]
			break
		case 'POST':
	        def examineeInstance = new Examinee(params)
			examineeInstance.setUserAccount(new SecUser(params))
	        if (!examineeInstance.save(flush: true)) {
	            render view: 'create', model: [examineeInstance: examineeInstance, secUserInstance: examineeInstance.userAccount ]
	            return
	        }
			
			def secUserSecRoleInstance = new SecUserSecRole(params)
			secUserSecRoleInstance.setSecUser(examineeInstance.userAccount)
			secUserSecRoleInstance.save(flush: true)

			flash.message = message(code: 'default.created.message', args: [message(code: 'examinee.label', default: 'Examinee'), examineeInstance.id])
	        redirect action: 'show', id: examineeInstance.id
			break
		}
    }

    def show() {
        def examineeInstance = Examinee.get(params.id)
        if (!examineeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'examinee.label', default: 'Examinee'), params.id])
            redirect action: 'list'
            return
        }

        [examineeInstance: examineeInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def examineeInstance = Examinee.get(params.id)
	        if (!examineeInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'examinee.label', default: 'Examinee'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [examineeInstance: examineeInstance]
			break
		case 'POST':
	        def examineeInstance = Examinee.get(params.id)
	        if (!examineeInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'examinee.label', default: 'Examinee'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (examineeInstance.version > version) {
	                examineeInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'examinee.label', default: 'Examinee')] as Object[],
	                          "Another user has updated this Examinee while you were editing")
	                render view: 'edit', model: [examineeInstance: examineeInstance]
	                return
	            }
	        }

	        examineeInstance.properties = params

	        if (!examineeInstance.save(flush: true)) {
	            render view: 'edit', model: [examineeInstance: examineeInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'examinee.label', default: 'Examinee'), examineeInstance.id])
	        redirect action: 'show', id: examineeInstance.id
			break
		}
    }

    def delete() {
        def examineeInstance = Examinee.get(params.id)
        if (!examineeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'examinee.label', default: 'Examinee'), params.id])
            redirect action: 'list'
            return
        }

        try {
            examineeInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'examinee.label', default: 'Examinee'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'examinee.label', default: 'Examinee'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
