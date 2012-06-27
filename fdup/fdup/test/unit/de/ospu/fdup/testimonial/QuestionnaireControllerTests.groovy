package de.ospu.fdup.testimonial



import org.junit.*
import grails.test.mixin.*

@TestFor(QuestionnaireController)
@Mock(Questionnaire)
class QuestionnaireControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/questionnaire/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.questionnaireInstanceList.size() == 0
        assert model.questionnaireInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.questionnaireInstance != null
    }

    void testSave() {
        controller.save()

        assert model.questionnaireInstance != null
        assert view == '/questionnaire/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/questionnaire/show/1'
        assert controller.flash.message != null
        assert Questionnaire.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/questionnaire/list'


        populateValidParams(params)
        def questionnaire = new Questionnaire(params)

        assert questionnaire.save() != null

        params.id = questionnaire.id

        def model = controller.show()

        assert model.questionnaireInstance == questionnaire
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/questionnaire/list'


        populateValidParams(params)
        def questionnaire = new Questionnaire(params)

        assert questionnaire.save() != null

        params.id = questionnaire.id

        def model = controller.edit()

        assert model.questionnaireInstance == questionnaire
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/questionnaire/list'

        response.reset()


        populateValidParams(params)
        def questionnaire = new Questionnaire(params)

        assert questionnaire.save() != null

        // test invalid parameters in update
        params.id = questionnaire.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/questionnaire/edit"
        assert model.questionnaireInstance != null

        questionnaire.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/questionnaire/show/$questionnaire.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        questionnaire.clearErrors()

        populateValidParams(params)
        params.id = questionnaire.id
        params.version = -1
        controller.update()

        assert view == "/questionnaire/edit"
        assert model.questionnaireInstance != null
        assert model.questionnaireInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/questionnaire/list'

        response.reset()

        populateValidParams(params)
        def questionnaire = new Questionnaire(params)

        assert questionnaire.save() != null
        assert Questionnaire.count() == 1

        params.id = questionnaire.id

        controller.delete()

        assert Questionnaire.count() == 0
        assert Questionnaire.get(questionnaire.id) == null
        assert response.redirectedUrl == '/questionnaire/list'
    }
}
