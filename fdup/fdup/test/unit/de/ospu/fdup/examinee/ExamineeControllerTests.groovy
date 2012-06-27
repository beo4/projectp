package de.ospu.fdup.examinee



import org.junit.*
import grails.test.mixin.*

@TestFor(ExamineeController)
@Mock(Examinee)
class ExamineeControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/examinee/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.examineeInstanceList.size() == 0
        assert model.examineeInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.examineeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.examineeInstance != null
        assert view == '/examinee/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/examinee/show/1'
        assert controller.flash.message != null
        assert Examinee.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/examinee/list'


        populateValidParams(params)
        def examinee = new Examinee(params)

        assert examinee.save() != null

        params.id = examinee.id

        def model = controller.show()

        assert model.examineeInstance == examinee
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/examinee/list'


        populateValidParams(params)
        def examinee = new Examinee(params)

        assert examinee.save() != null

        params.id = examinee.id

        def model = controller.edit()

        assert model.examineeInstance == examinee
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/examinee/list'

        response.reset()


        populateValidParams(params)
        def examinee = new Examinee(params)

        assert examinee.save() != null

        // test invalid parameters in update
        params.id = examinee.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/examinee/edit"
        assert model.examineeInstance != null

        examinee.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/examinee/show/$examinee.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        examinee.clearErrors()

        populateValidParams(params)
        params.id = examinee.id
        params.version = -1
        controller.update()

        assert view == "/examinee/edit"
        assert model.examineeInstance != null
        assert model.examineeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/examinee/list'

        response.reset()

        populateValidParams(params)
        def examinee = new Examinee(params)

        assert examinee.save() != null
        assert Examinee.count() == 1

        params.id = examinee.id

        controller.delete()

        assert Examinee.count() == 0
        assert Examinee.get(examinee.id) == null
        assert response.redirectedUrl == '/examinee/list'
    }
}
