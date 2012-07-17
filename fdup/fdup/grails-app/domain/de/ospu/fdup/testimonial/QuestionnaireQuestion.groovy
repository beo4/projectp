package de.ospu.fdup.testimonial

class QuestionnaireQuestion implements Comparable{

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
	int ordering = 0
	
	
	static belongsTo = [Questionnaire]
	
	static QuestionnaireQuestion link(question, questionnaire) {
		def q = QuestionnaireQuestion.findByQuestionAndQuestionnaire(question, questionnaire)
		if (!q)
		{
			q = new QuestionnaireQuestion(question: question)
			q.ordering = question.ordering
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

	@Override
	public int compareTo(Object o) {
		return (ordering!=o.ordering)? ordering - o.ordering:1;
	}
}
