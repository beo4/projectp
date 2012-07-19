package de.ospu.fdup.testimonial

import de.ospu.fdup.examinee.Examinee;
import de.ospu.fdup.security.SecUser;

class Questionnaire {

    static constraints = {
		examinee()
    }
	
	Examinee examinee
	Date start
	Date stop
	boolean active = true
	SortedSet<QuestionnaireQuestion> questionnaireQuestions
	
	static hasMany = [questionnaireQuestions:QuestionnaireQuestion]
	
	
	List questions() {
		return questionnaireQuestions.collect{it.question}
	}
	
	List addQuestions(List questions) {
		for (Question question : questions) {
			QuestionnaireQuestion.link(question, this)
		}
		return questionnaireQuestions.collect{it.question}
	}
	
	
	
}
