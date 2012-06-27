package de.ospu.fdup.testimonial



import org.junit.*
import grails.test.mixin.*

@TestFor(AreaController)
@Mock(Area)
class AreaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/area/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.areaInstanceList.size() == 0
        assert model.areaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.areaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.areaInstance != null
        assert view == '/area/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/area/show/1'
        assert controller.flash.message != null
        assert Area.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/area/list'


        populateValidParams(params)
        def area = new Area(params)

        assert area.save() != null

        params.id = area.id

        def model = controller.show()

        assert model.areaInstance == area
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/area/list'


        populateValidParams(params)
        def area = new Area(params)

        assert area.save() != null

        params.id = area.id

        def model = controller.edit()

        assert model.areaInstance == area
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/area/list'

        response.reset()


        populateValidParams(params)
        def area = new Area(params)

        assert area.save() != null

        // test invalid parameters in update
        params.id = area.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/area/edit"
        assert model.areaInstance != null

        area.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/area/show/$area.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        area.clearErrors()

        populateValidParams(params)
        params.id = area.id
        params.version = -1
        controller.update()

        assert view == "/area/edit"
        assert model.areaInstance != null
        assert model.areaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/area/list'

        response.reset()

        populateValidParams(params)
        def area = new Area(params)

        assert area.save() != null
        assert Area.count() == 1

        params.id = area.id

        controller.delete()

        assert Area.count() == 0
        assert Area.get(area.id) == null
        assert response.redirectedUrl == '/area/list'
    }
}
