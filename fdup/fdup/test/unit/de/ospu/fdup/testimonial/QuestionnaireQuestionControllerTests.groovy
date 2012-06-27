package de.ospu.fdup.testimonial



import org.junit.*
import grails.test.mixin.*

@TestFor(QuestionnaireQuestionController)
@Mock(QuestionnaireQuestion)
class QuestionnaireQuestionControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/questionnaireQuestion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.questionnaireQuestionInstanceList.size() == 0
        assert model.questionnaireQuestionInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.questionnaireQuestionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.questionnaireQuestionInstance != null
        assert view == '/questionnaireQuestion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/questionnaireQuestion/show/1'
        assert controller.flash.message != null
        assert QuestionnaireQuestion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/questionnaireQuestion/list'


        populateValidParams(params)
        def questionnaireQuestion = new QuestionnaireQuestion(params)

        assert questionnaireQuestion.save() != null

        params.id = questionnaireQuestion.id

        def model = controller.show()

        assert model.questionnaireQuestionInstance == questionnaireQuestion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/questionnaireQuestion/list'


        populateValidParams(params)
        def questionnaireQuestion = new QuestionnaireQuestion(params)

        assert questionnaireQuestion.save() != null

        params.id = questionnaireQuestion.id

        def model = controller.edit()

        assert model.questionnaireQuestionInstance == questionnaireQuestion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/questionnaireQuestion/list'

        response.reset()


        populateValidParams(params)
        def questionnaireQuestion = new QuestionnaireQuestion(params)

        assert questionnaireQuestion.save() != null

        // test invalid parameters in update
        params.id = questionnaireQuestion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/questionnaireQuestion/edit"
        assert model.questionnaireQuestionInstance != null

        questionnaireQuestion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/questionnaireQuestion/show/$questionnaireQuestion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        questionnaireQuestion.clearErrors()

        populateValidParams(params)
        params.id = questionnaireQuestion.id
        params.version = -1
        controller.update()

        assert view == "/questionnaireQuestion/edit"
        assert model.questionnaireQuestionInstance != null
        assert model.questionnaireQuestionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/questionnaireQuestion/list'

        response.reset()

        populateValidParams(params)
        def questionnaireQuestion = new QuestionnaireQuestion(params)

        assert questionnaireQuestion.save() != null
        assert QuestionnaireQuestion.count() == 1

        params.id = questionnaireQuestion.id

        controller.delete()

        assert QuestionnaireQuestion.count() == 0
        assert QuestionnaireQuestion.get(questionnaireQuestion.id) == null
        assert response.redirectedUrl == '/questionnaireQuestion/list'
    }
}
