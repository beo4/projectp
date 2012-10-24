package de.ospu.fdup.download

import static org.junit.Assert.*
import de.ospu.fdup.examinee.Examinee
import de.ospu.fdup.testimonial.Questionnaire;

import org.junit.*

class Word2ServiceTestTests {
	WordService service
	
    @Before
    void setUp() {
        
    }

    @After
    void tearDown() {
        // Tear down logic here
    }

    @Test
    void testWord() {

		assert Questionnaire.list()
		
		Questionnaire.list().each {
			assert service.createWordFile(it);
		}
		
    }
}
