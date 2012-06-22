package projectp.util

import grails.converters.JSON
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import uk.co.desirableobjects.ajaxuploader.exception.FileUploadException

class ImageController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']
	
	def uploadService

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [imageInstanceList: Image.list(params), imageInstanceTotal: Image.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[imageInstance: new Image(params)]
			break
		case 'POST':
	        def imageInstance = new Image(params)
	        if (!imageInstance.save(flush: true)) {
	            render view: 'create', model: [imageInstance: imageInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'image.label', default: 'Image'), imageInstance.id])
	        redirect action: 'show', id: imageInstance.id
			break
		}
    }
	
	def upload = {
		try {
			def contentType	= request.getHeader("Content-Type") as String
			def fileName    = request.getHeader('X-File-Name') as String
			def fileSize 	= request.getHeader('X-File-Size') as Long
			def name 		= request.getHeader('X-Uploadr-Name') as String
			def info		= session.getAttribute('uploadr')
			int dot         = 0
			def namePart    = ""
			def extension   = ""
			def testName    = ""
			def testIterator= 1
			int status      = 0
			def statusText  = ""
			

			log.debug("upload")
			InputStream inputStream = selectInputStream(request)

			byte[] file 
			file = uploadService.upload(inputStream)
			
			def imageInstance = new Image(name: fileName, image: file, fileType: contentType)
			if (!imageInstance.save(flush: true)) {
				log.error("Failed to upload file.")
				imageInstance.errors.each {
			        println it
			    }
				return render(text: [success:false] as JSON, contentType:'text/json')
			}
			

			return render(text: [success:true, id: imageInstance.id] as JSON, contentType:'text/json')

		} catch (FileUploadException e) {

			log.error("Failed to upload file.", e)
			return render(text: [success:false] as JSON, contentType:'text/json')

		}

	}
	
	private InputStream selectInputStream(HttpServletRequest request) {
		if (request instanceof MultipartHttpServletRequest) {
			MultipartFile uploadedFile = ((MultipartHttpServletRequest) request).getFile('qqfile')
			return uploadedFile.inputStream
		}
		return request.inputStream
	}

    def show() {
        def imageInstance = Image.get(params.id)
        if (!imageInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'image.label', default: 'Image'), params.id])
            redirect action: 'list'
            return
        }

        [imageInstance: imageInstance]
    }
	
	def viewImage= {
		def imageInstance = Image.get(params.id)
		response.setHeader("Content-disposition", "attachment; filename=${photo.name}")
		response.contentType = imageInstance.fileType //'image/jpeg' will do too
		response.outputStream << imageInstance.image //'myphoto.jpg' will do too
		response.outputStream.flush()
		return;
	  }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def imageInstance = Image.get(params.id)
	        if (!imageInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'image.label', default: 'Image'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [imageInstance: imageInstance]
			break
		case 'POST':
	        def imageInstance = Image.get(params.id)
	        if (!imageInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'image.label', default: 'Image'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (imageInstance.version > version) {
	                imageInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'image.label', default: 'Image')] as Object[],
	                          "Another user has updated this Image while you were editing")
	                render view: 'edit', model: [imageInstance: imageInstance]
	                return
	            }
	        }

	        imageInstance.properties = params

	        if (!imageInstance.save(flush: true)) {
	            render view: 'edit', model: [imageInstance: imageInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'image.label', default: 'Image'), imageInstance.id])
	        redirect action: 'show', id: imageInstance.id
			break
		}
    }

    def delete() {
        def imageInstance = Image.get(params.id)
        if (!imageInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'image.label', default: 'Image'), params.id])
            redirect action: 'list'
            return
        }

        try {
            imageInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'image.label', default: 'Image'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'image.label', default: 'Image'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
