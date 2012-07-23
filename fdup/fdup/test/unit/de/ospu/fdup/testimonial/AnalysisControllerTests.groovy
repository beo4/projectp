package de.ospu.fdup.testimonial



import org.junit.*
import grails.test.mixin.*

@TestFor(AnalysisController)
@Mock(Analysis)
class AnalysisControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/analysis/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.analysisInstanceList.size() == 0
        assert model.analysisInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.analysisInstance != null
    }

    void testSave() {
        controller.save()

        assert model.analysisInstance != null
        assert view == '/analysis/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/analysis/show/1'
        assert controller.flash.message != null
        assert Analysis.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/analysis/list'


        populateValidParams(params)
        def analysis = new Analysis(params)

        assert analysis.save() != null

        params.id = analysis.id

        def model = controller.show()

        assert model.analysisInstance == analysis
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/analysis/list'


        populateValidParams(params)
        def analysis = new Analysis(params)

        assert analysis.save() != null

        params.id = analysis.id

        def model = controller.edit()

        assert model.analysisInstance == analysis
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/analysis/list'

        response.reset()


        populateValidParams(params)
        def analysis = new Analysis(params)

        assert analysis.save() != null

        // test invalid parameters in update
        params.id = analysis.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/analysis/edit"
        assert model.analysisInstance != null

        analysis.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/analysis/show/$analysis.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        analysis.clearErrors()

        populateValidParams(params)
        params.id = analysis.id
        params.version = -1
        controller.update()

        assert view == "/analysis/edit"
        assert model.analysisInstance != null
        assert model.analysisInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/analysis/list'

        response.reset()

        populateValidParams(params)
        def analysis = new Analysis(params)

        assert analysis.save() != null
        assert Analysis.count() == 1

        params.id = analysis.id

        controller.delete()

        assert Analysis.count() == 0
        assert Analysis.get(analysis.id) == null
        assert response.redirectedUrl == '/analysis/list'
    }
}
