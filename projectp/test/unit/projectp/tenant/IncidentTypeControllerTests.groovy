package projectp.tenant



import org.junit.*
import grails.test.mixin.*

@TestFor(IncidentTypeController)
@Mock(IncidentType)
class IncidentTypeControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/incidentType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.incidentTypeInstanceList.size() == 0
        assert model.incidentTypeInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.incidentTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.incidentTypeInstance != null
        assert view == '/incidentType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/incidentType/show/1'
        assert controller.flash.message != null
        assert IncidentType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/incidentType/list'


        populateValidParams(params)
        def incidentType = new IncidentType(params)

        assert incidentType.save() != null

        params.id = incidentType.id

        def model = controller.show()

        assert model.incidentTypeInstance == incidentType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/incidentType/list'


        populateValidParams(params)
        def incidentType = new IncidentType(params)

        assert incidentType.save() != null

        params.id = incidentType.id

        def model = controller.edit()

        assert model.incidentTypeInstance == incidentType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/incidentType/list'

        response.reset()


        populateValidParams(params)
        def incidentType = new IncidentType(params)

        assert incidentType.save() != null

        // test invalid parameters in update
        params.id = incidentType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/incidentType/edit"
        assert model.incidentTypeInstance != null

        incidentType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/incidentType/show/$incidentType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        incidentType.clearErrors()

        populateValidParams(params)
        params.id = incidentType.id
        params.version = -1
        controller.update()

        assert view == "/incidentType/edit"
        assert model.incidentTypeInstance != null
        assert model.incidentTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/incidentType/list'

        response.reset()

        populateValidParams(params)
        def incidentType = new IncidentType(params)

        assert incidentType.save() != null
        assert IncidentType.count() == 1

        params.id = incidentType.id

        controller.delete()

        assert IncidentType.count() == 0
        assert IncidentType.get(incidentType.id) == null
        assert response.redirectedUrl == '/incidentType/list'
    }
}
