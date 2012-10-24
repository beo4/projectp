package de.ospu.fdup.download



import java.util.Date;

import grails.test.mixin.*
import groovy.mock.interceptor.MockFor;

import org.junit.*

import de.ospu.fdup.examinee.Examinee;
import de.ospu.fdup.testimonial.Questionnaire;

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(WordService)
@Mock(Questionnaire)
class WordServiceTests {
	

    void testXml() {
		
		def testInstances = [[
			id: 5,
			examinee: new Examinee(
				
				),
			start: new Date(),
			stop: new Date(),
			active: true
			]]
		mockDomain(Questionnaire)
		
		WordService service = new WordService();
		service.grailsApplication = grailsApplication
		
		assert service.createWordFile(Questionnaire.get("5"));
		
    }
}
