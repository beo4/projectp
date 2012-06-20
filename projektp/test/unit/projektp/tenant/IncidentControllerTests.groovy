package projektp.tenant



import org.junit.*
import grails.test.mixin.*

@TestFor(IncidentController)
@Mock(Incident)
class IncidentControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/incident/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.incidentInstanceList.size() == 0
        assert model.incidentInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.incidentInstance != null
    }

    void testSave() {
        controller.save()

        assert model.incidentInstance != null
        assert view == '/incident/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/incident/show/1'
        assert controller.flash.message != null
        assert Incident.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/incident/list'


        populateValidParams(params)
        def incident = new Incident(params)

        assert incident.save() != null

        params.id = incident.id

        def model = controller.show()

        assert model.incidentInstance == incident
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/incident/list'


        populateValidParams(params)
        def incident = new Incident(params)

        assert incident.save() != null

        params.id = incident.id

        def model = controller.edit()

        assert model.incidentInstance == incident
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/incident/list'

        response.reset()


        populateValidParams(params)
        def incident = new Incident(params)

        assert incident.save() != null

        // test invalid parameters in update
        params.id = incident.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/incident/edit"
        assert model.incidentInstance != null

        incident.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/incident/show/$incident.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        incident.clearErrors()

        populateValidParams(params)
        params.id = incident.id
        params.version = -1
        controller.update()

        assert view == "/incident/edit"
        assert model.incidentInstance != null
        assert model.incidentInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/incident/list'

        response.reset()

        populateValidParams(params)
        def incident = new Incident(params)

        assert incident.save() != null
        assert Incident.count() == 1

        params.id = incident.id

        controller.delete()

        assert Incident.count() == 0
        assert Incident.get(incident.id) == null
        assert response.redirectedUrl == '/incident/list'
    }
}
