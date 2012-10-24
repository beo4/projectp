package de.ospu.fdup.testimonial



import grails.test.mixin.*
import org.junit.*

import de.ospu.fdup.download.WordService;

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(DownloadController)
class DownloadControllerTests {
	
	def populateValidParams(params) {
		assert params != null
		// TODO: Populate valid properties like...
		params["id"] = '5'
	}
	
	void testXml() {
		defineBeans {
			wordService(WordService)
		}
		
		populateValidParams(params)
		
		controller.wordService.grailsApplication = grailsApplication
		
		controller.exportWord()
		
		assert response;
		
	}


}
