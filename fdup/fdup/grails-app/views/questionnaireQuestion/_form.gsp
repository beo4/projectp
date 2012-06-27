<%@ page import="de.ospu.fdup.testimonial.QuestionnaireQuestion" %>



<div class="fieldcontain ${hasErrors(bean: questionnaireQuestionInstance, field: 'answer', 'error')} required">
	<label for="answer">
		<g:message code="questionnaireQuestion.answer.label" default="Answer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="answer" name="answer.id" from="${de.ospu.fdup.testimonial.Answer.list()}" optionKey="id" required="" value="${questionnaireQuestionInstance?.answer?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionnaireQuestionInstance, field: 'end', 'error')} required">
	<label for="end">
		<g:message code="questionnaireQuestion.end.label" default="End" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="end" precision="day"  value="${questionnaireQuestionInstance?.end}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: questionnaireQuestionInstance, field: 'question', 'error')} required">
	<label for="question">
		<g:message code="questionnaireQuestion.question.label" default="Question" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="question" name="question.id" from="${de.ospu.fdup.testimonial.Question.list()}" optionKey="id" required="" value="${questionnaireQuestionInstance?.question?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionnaireQuestionInstance, field: 'questionnaire', 'error')} required">
	<label for="questionnaire">
		<g:message code="questionnaireQuestion.questionnaire.label" default="Questionnaire" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="questionnaire" name="questionnaire.id" from="${de.ospu.fdup.testimonial.Questionnaire.list()}" optionKey="id" required="" value="${questionnaireQuestionInstance?.questionnaire?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionnaireQuestionInstance, field: 'start', 'error')} required">
	<label for="start">
		<g:message code="questionnaireQuestion.start.label" default="Start" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="start" precision="day"  value="${questionnaireQuestionInstance?.start}"  />
</div>

