package de.ospu.fdup.testimonial

class QuestionnaireQuestion {

    static constraints = {
		answer(nullable: true, blank:true)
		start(nullable: true, blank:true)
		end(nullable: true, blank:true)
    }
	
	Date start
	Date end
	
	Question question
	Questionnaire questionnaire
	Answer answer
	int order = 0
	
	
	static belongsTo = [Questionnaire]
	
	static QuestionnaireQuestion link(question, questionnaire) {
		def q = QuestionnaireQuestion.findByQuestionAndQuestionnaire(question, questionnaire)
		if (!q)
		{
			q = new QuestionnaireQuestion(question: question)
			q.order = question.order
			questionnaire.addToQuestionnaireQuestions(q);
			q.save()
		}
		return q
	}

	static void unlink(question, questionnaire) {
		def q = QuestionnaireQuestion.findByQuestionAndQuestionnaire(question, questionnaire)
		if (q)
		{
			question?.removeToQuestionnaireQuestions(q)
			questionnaire?.removeToQuestionnaireQuestions(q)
			q.delete()
		}
	}
}
